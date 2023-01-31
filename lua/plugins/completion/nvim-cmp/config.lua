

local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
    return
end

local pmenu_fmt = require("plugins.completion.nvim-cmp.pmenu_fmt")

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local border = function(hl)
    return {
        { "╭", hl },
        { "─", hl },
        { "╮", hl },
        { "│", hl },
        { "╯", hl },
        { "─", hl },
        { "╰", hl },
        { "│", hl },
    }
end

cmp.setup({

    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },

    completion = {
        ---@usage The minimum length of a word to complete on.
        keyword_length = 1,
    },

    window = {
        completion = {
            border = border("CmpBorder"),
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
            -- winhighlight = 'NormalFloat:CompNormal,FloatBorder:FloatBorder',
        },
        documentation = {
            border = border("CmpDocBorder"),
            -- winhighlight = 'NormalFloat:CompNormal,FloatBorder:CompBorder',
        },
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>']     = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>']     = cmp.mapping(cmp.mapping.scroll_docs(4),  {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(),      {'i', 'c'}),
        ['<C-e>']     = cmp.mapping.close(),
        ['<CR>']      = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-k>"]     = cmp.mapping.select_prev_item(),
        ["<C-j>"]     = cmp.mapping.select_next_item(),

        ["<Tab>"] = cmp.mapping(function(fallback)
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

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
            else
                fallback()
            end
        end, { "i", "c", "s" }),
    }),

    sources = {
        { name = "nvim_lsp" },
        { name = "tags" },
        { name = "rg" },
        { name = "luasnip" },
        { name = "nvim_lua"},
        {
            name = "buffer",
            option = {
                get_bufnrs = function()
                    local bufs = {}
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        bufs[vim.api.nvim_win_get_buf(win)] = true
                    end
                    return vim.tbl_keys(bufs)
                end,
            },
        },
        { name = "path"},
        { name = 'spell'},
    },

    formatting = pmenu_fmt.vscode_format,

    -- preselect = true,
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        {name = 'buffer'},
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        {name = 'cmdline'},
        {name = 'buffer'},
    })
})
