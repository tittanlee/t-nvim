

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp_config = function()
    local status_ok, cmp = pcall(require, "cmp")
    if not status_ok then
        return
    end

    local module_key = require("environment").module_key.cmp

    require("luasnip/loaders/from_vscode").lazy_load()

    local kind_icons = {
        Text          = "",
        Method        = "m",
        Function      = "",
        Constructor   = "",
        Field         = "",
        Variable      = "",
        Class         = "",
        Interface     = "",
        Module        = "",
        Property      = "",
        Unit          = "",
        Value         = "",
        Enum          = "",
        Keyword       = "",
        Snippet       = "",
        Color         = "",
        File          = "",
        Reference     = "",
        Folder        = "",
        EnumMember    = "",
        Constant      = "",
        Struct        = "",
        Event         = "",
        Operator      = "",
        TypeParameter = "",
    }

    cmp.setup({
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body) -- Luasnip expand
            end,
        },

        formatting = {
            fields = { "abbr", "kind", "menu" },
            format = function(entry, vim_item)
                -- Kind icons
                vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                vim_item.menu     = setmetatable({
                    cmp_tabnine   = "[TN]",
                    copilot       = "[CPLT]",
                    buffer        = "[BUF]",
                    orgmode       = "[ORG]",
                    nvim_lsp      = "[LSP]",
                    nvim_lua      = "[LUA]",
                    path          = "[PATH]",
                    tmux          = "[TMUX]",
                    treesitter    = "[TS]",
                    latex_symbols = "[LTEX]",
                    luasnip       = "[SNIP]",
                    spell         = "[SPELL]",
                    }, {
                        __index = function()
                            return "[BTN]" -- builtin/unknown source names
                        end,
                })[entry.source.name]

                local label = vim_item.abbr
                local truncated_label = vim.fn.strcharpart(label, 0, 80)
                if truncated_label ~= label then
                    vim_item.abbr = truncated_label .. "..."
                end

                return vim_item
            end,
        },

        sources = {
            { name = "nvim_lsp", max_item_count = 350 },
            { name = "buffer"                         },
            { name = "tags"                           },
            { name = "luasnip"                        },
            { name = "nvim_lua"                       },
            { name = "path"                           },
        },

        mapping = cmp.mapping.preset.insert({
            [module_key.scroll_doc_up.lhs]    = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
            [module_key.scroll_doc_down.lhs]  = cmp.mapping(cmp.mapping.scroll_docs(4),  {'i', 'c'}),
            [module_key.complete.lhs]         = cmp.mapping(cmp.mapping.complete(),      {'i', 'c'}),
            [module_key.close.lhs]            = cmp.mapping.close(),
            [module_key.confirm.lhs]          = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            [module_key.select_prev_item.lhs] = cmp.mapping.select_prev_item(),
            [module_key.select_next_item.lhs] = cmp.mapping.select_next_item(),
            [module_key.alt_select_next.lhs]  = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                    vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "c", "s" }),

            [module_key.alt_select_prev.lhs] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                    vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
                else
                    fallback()
                end
            end, { "i", "c", "s" }),

        }),
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            {name = 'buffer'},
        })
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            {name = 'cmdline'},
            {name = 'buffer'},
        })
    })
end




return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-git",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "quangnguyen30192/cmp-nvim-tags",
        "hrsh7th/cmp-nvim-lsp-signature-help",

        {
            "L3MON4D3/LuaSnip",
            dependencies = {
                "rafamadriz/friendly-snippets"
            },
            config = function()
                local snippet_path = vim.fn.stdpath("config") .. "/snips/"
                if not vim.tbl_contains(vim.opt.rtp:get(), snippet_path) then
                    vim.opt.rtp:append(snippet_path)
                end

                require("luasnip").config.set_config({
                    history = true,
                    update_events = "TextChanged,TextChangedI",
                    delete_check_events = "TextChanged,InsertLeave",
                })
                require("luasnip.loaders.from_lua").lazy_load()
                require("luasnip.loaders.from_vscode").lazy_load()
                require("luasnip.loaders.from_snipmate").lazy_load()
            end,
        },
    },
    event = { "InsertEnter", "CmdlineEnter" },
    lazy = true,
    config = cmp_config,
}
