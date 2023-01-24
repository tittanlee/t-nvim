local uv = vim.loop
local os_name = uv.os_uname().sysname

local M = {}

M.std_path = {
    cache      = vim.fn.stdpath("cache"),
    config     = vim.fn.stdpath("config"),
    config_dir = vim.fn.stdpath("config_dirs"),
    data       = vim.fn.stdpath("data"),
    data_dir   = vim.fn.stdpath("data_dirs"),
}

M.variable = {
    leader_key               = " ", -- space as leader key
    local_leader_key         = ",",

    -- onedark   , dracula   , vscode, nord,
    -- tokyonight, catppuccin, kanagawa
    colorscheme              = "kanagawa",

    is_mac                   = os_name == "Darwin",
    is_linux                 = os_name == "Linux",
    is_windows               = os_name == "Windows_NT" or "Windows",
    path_sep                 = os_name == "Windows_NT" or "Windows" and "\\" or "/",
    is_gui_nvim              = vim.fn.exists("vim.g.GuiLoaded") == true,

    -- TUI git application support
    gitui_support            = false,
    lazygit_support          = true,

    -- status line flag
    status_show_file_path    = "relative", -- relative or absolute
    status_show_current_func = false,
    status_show_git_info     = true,
}

-- disable = 1, enable = 0
M.default_builtin_plugin = {
    ["2html_plugin"]      = 1,
    ["getscript"]         = 1,
    ["getscriptPlugin"]   = 1,
    ["gzip"]              = 1,
    ["logipat"]           = 1,
    ["matchit"]           = 1,
    ["matchparen"]        = 1,
    ["netrw"]             = 1,
    ["netrwPlugin"]       = 1,
    ["netrwSettings"]     = 1,
    ["netrwFileHandlers"] = 1,
    ["rrhelper"]          = 1,
    ["spellfile_plugin"]  = 1,
    ["shada_plugin"]      = 1,
    ["tar"]               = 1,
    ["tarPlugin"]         = 1,
    ["vimball"]           = 1,
    ["vimballPlugin"]     = 1,
    ["zip"]               = 1,
    ["zipPlugin"]         = 1,
}

return M
