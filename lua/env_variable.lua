
local os_name = vim.loop.os_uname().sysname


CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH   = vim.fn.stdpath "data"
CACHE_PATH  = vim.fn.stdpath "cache"
TERMINAL    = vim.fn.expand "$TERMINAL"
USER        = vim.fn.expand "$USER"

-- t_nvim environment variable
ENV = {
    leader_key = " ", -- space as leader key
    local_leader_key = ",",
    colorscheme = "nightfox",

    is_mac     = os_name == 'Darwin',
    is_linux   = os_name == 'Linux',
    is_windows = os_name == 'Windows_NT' or 'Windows;',
    path_sep   = is_windows and '\\' or '/',

    -- feline show current function flag
    status_show_file_path    = 'relative', -- relative or absolute
    status_show_current_func = false,
    status_show_git_info     = true,

}
