

return {
    "lukas-reineke/indent-blankline.nvim",

    event = "BufRead",

    config = function()
        require("indent_blankline").setup({
            -- char                         = '▌',
            -- char                         = '|',
            char                           = '│',
            -- char                           = '┊',

            enabled                        = true,
            use_treesitter                 = false,
            show_current_context           = true,
            show_current_context_start     = true,
            show_end_of_line               = true,
            show_first_indent_level        = true,
            show_trailing_blankline_indent = false,
            space_char_blankline           = ' ',

            filetype_exclude = {
                "startify",
                "dashboard",
                "dotooagenda",
                "log",
                "fugitive",
                "gitcommit",
                "packer",
                "vimwiki",
                "markdown",
                "json",
                "txt",
                "vista",
                "help",
                "todoist",
                "NvimTree",
                "peekaboo",
                "git",
                "TelescopePrompt",
                "undotree",
                "flutterToolsOutline",
                "qf",
                "" -- for all buffers without a file type
            },

            buftype_exclude = {
                "terminal",
                "nofile",
                "help"
            },

            context_patterns = {
                "class",
                "function",
                "method",
                "block",
                "list_literal",
                "selector",
                "^if",
                "^table",
                "if_statement",
                "while",
                "for",
                "type",
                "var",
                "import"
            },
        })
    end,
}
