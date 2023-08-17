
return {
    "ludovicchabant/vim-gutentags",
    config = function()
        local env_var = require("environment").env_var
        local module_table = {}

        vim.g.gutentags_project_root = {
            ".root",
            ".svn",
            ".git",
            ".project",
            ".repo",
        }

        vim.g.gutentags_ctags_tagfile = ".tags"
        vim.g.gutentags_cache_dir     = vim.fn.stdpath("data") ..  env_var.path_sep .. "cache_tags"
        vim.g.gutentags_enabled       = false

        -- Defines some advanced commands like
        -- |GutentagsToggleEnabled| and |GutentagsUnlock|
        vim.g.gutentags_define_advanced_commands = true

        -- check if ctags is exist
        if vim.fn.executable("ctags") == 1 then
            table.insert(module_table, "ctags")
        end

        -- check if gtags and gtags-cscope is exist
        if vim.fn.has("cscope") == 1 and vim.fn.executable("gtags") == 1 and vim.fn.executable("gtags-cscope") == 1 then
            table.insert(module_table, "gtags_cscope")
        end
        vim.g.gutentags_modules = module_table

        -- When set to 1, Gutentags will resolve any symlinks
        vim.g.gutentags_resolve_symlinks = true

        -- Specifies command(s) to use to list files
        vim.g.gutentags_file_list_command = "rg --files --no-hidden --no-ignore"

        vim.g.gutentags_ctags_extra_args = {
            "-R",
            "--sort=foldcase",
            "--kinds-C=+pxzL",
            "--kinds-C++=+px",
            "--extras=+fq",
            "--fields=+niazS",
        }
    end,
}
