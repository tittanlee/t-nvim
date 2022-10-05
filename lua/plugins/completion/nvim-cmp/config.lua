

local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
    return
end


cmp.setup({
    snippet = {
    },

    completion = {
      ---@usage The minimum length of a word to complete on.
      keyword_length = 1,
    },

    window = {
		documentation = {
            border = {'╭', "─", '╮', "│", '╯', "─", "╰", "│"},
            -- winhighlight = 'NormalFloat:CompNormal,FloatBorder:CompBorder',
		},
		completion = {
            border = {'╭', "─", '╮', "│", '╯', "─", "╰", "│"},
            -- winhighlight = 'NormalFloat:CompNormal,FloatBorder:FloatBorder',
		}

    },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>']     = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>']     = cmp.mapping(cmp.mapping.scroll_docs(4),  {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(),      {'i', 'c'}),
        ['<C-e>']     = cmp.mapping.abort(),
        ['<CR>']      = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-k>"]     = cmp.mapping.select_prev_item(),
        ["<C-j>"]     = cmp.mapping.select_next_item(),
        ["<Tab>"]     = cmp.mapping.select_next_item(),
        ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
    }),

    sources = {
        { name = "nvim_lsp" },
        { name = "tags" },
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
        -- { name = "luasnip" },
        { name = "nvim_lua"},
        { name = "path"},
        { name = 'spell'},
    },

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
        {name = 'path' },
        {name = 'buffer'},
    }, {
        {name = 'cmdline'},
    })
})

