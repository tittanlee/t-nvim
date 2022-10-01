


local uv = vim.loop
local os_name = uv.os_uname().sysname

local M = {}

M.stdpath = {
    CACHE      = vim.fn.stdpath 'cache',
    CONFIG     = vim.fn.stdpath 'config',
    CONFIG_DIR = vim.fn.stdpath 'config_dirs',
    DATA       = vim.fn.stdpath 'data',
    DATA_DIR   = vim.fn.stdpath 'data_dirs',
}

M.variable = {
    leader_key               = ' ', -- space as leader key
    local_leader_key         = ',',
    colorscheme              = 'onedark',

    is_mac                   = os_name == 'Darwin',
    is_linux                 = os_name == 'Linux',
    is_windows               = os_name == 'Windows_NT' or 'Windows;',
    path_sep                 = is_windows and '\\' or '/',
    is_gui_nvim              = vim.fn.exists('vim.g.GuiLoaded') == true,

    status_show_file_path    = 'relative', -- relative or absolute
    status_show_current_func = false,
    status_show_git_info     = true,
}


-- disable = 1, enable = 0
M.builtin_feature = {
    'netrw'             ,
    'netrwPlugin'       ,
    'netrwSettings'     ,
    'netrwFileHandlers' ,
    'gzip'              ,
    'zip'               ,
    'zipPlugin'         ,
    'tar'               ,
    'tarPlugin'         ,
    'getscript'         ,
    'getscriptPlugin'   ,
    'vimball'           ,
    'vimballPlugin'     ,
    '2html_plugin'      ,
    'logipat'           ,
    'rrhelper'          ,
    'spellfile_plugin'  ,
    'matchit'           ,
    'matchparen'        ,
    'shada_plugin'      ,
}

return M
