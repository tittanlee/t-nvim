local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
        "bash",
        "bibtex",
        "c",
        "c_sharp",
        "clojure",
        "cmake",
        "comment",
        "cpp",
        "css",
        "fennel",
        "gdscript",
        "go",
        "graphql",
        "html",
        "java",
        "javascript",
        "json",
        "kotlin",
        "latex",
        "lua",
        "python",
        "ql",
        "query",
        "regex",
        "ruby",
        "rust",
        "rst",
        "teal",
        "toml",
        "typescript",
        "yaml"
    },

    indent = {
        enable = false
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<cr>",
            node_incremental = "<cr>",
            node_decremental = "<tab>",
            scope_incremental = "<s-cr>"
        }
    },

    highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = false,
    },


    -- context_commentstring = {
    --     enable = true,
    --     config = {
    --         c = "// %s",
    --         lua = "-- %s"
    --     }
    -- },
}
