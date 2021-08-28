
local M = {}

M.dark = {
    bg        = '#34343C',
    fg        = '#C5CDD9',
    black     = '#1B1B1B',
    skyblue   = '#50B0F0',
    cyan      = '#009090',
    green     = '#60A040',
    oceanblue = '#0066cc',
    magenta   = '#C26BDB',
    orange    = '#FF9000',
    red       = '#E76350',
    violet    = '#9E93E8',
    white     = '#F0F0F0',
    yellow    = '#EAE53E',
    lightgray = '#BBC0B6',
    darkgray  = '#60625E'
}

M.vim_mode_colors = {
    NORMAL        = 'green',
    OP            = 'green',
    INSERT        = 'red',
    VISUAL        = 'skyblue',
    BLOCK         = 'skyblue',
    REPLACE       = 'violet',
    ['V-REPLACE'] = 'violet',
    ENTER         = 'cyan',
    MORE          = 'cyan',
    SELECT        = 'orange',
    COMMAND       = 'green',
    SHELL         = 'green',
    TERM          = 'green',
    NONE          = 'yellow'
}


return M
