

local status_ok, ts_config = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

ts_config.setup {
    ensure_installed = {
        "bash",
        "bibtex",
        "c",
        "c_sharp",
        "clojure",
        "cmake",
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
        "rust",
        "rst",
        "teal",
        "toml",
        "typescript",
        "yaml"
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    indent = {
        enable = false
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection    = "<cr>",
            node_incremental  = "<cr>",
            node_decremental  = "<tab>",
            scope_incremental = "<s-cr>"
        }
    },

    highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = false,
        disable = function(lang, buf)
            local max_filesize = 2 * 1024 * 1024 -- 2MB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
    },
}


