
local cursor = require('feline.providers.cursor')
local file = require('feline.providers.file')
local git = require('feline.providers.git')

local colors = {
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

-- This table is equal to the default vi_mode_colors table
local vi_mode_colors = {
    NORMAL = 'green',
    OP = 'green',
    INSERT = 'red',
    VISUAL = 'skyblue',
    BLOCK = 'skyblue',
    REPLACE = 'violet',
    ['V-REPLACE'] = 'violet',
    ENTER = 'cyan',
    MORE = 'cyan',
    SELECT = 'orange',
    COMMAND = 'green',
    SHELL = 'green',
    TERM = 'green',
    NONE = 'yellow'
}

local properties = {
    force_inactive = {
        filetypes = {
            'NvimTree',
            'dbui',
            'packer',
            'startify',
            'fugitive',
            'fugitiveblame',
            'coc-explorer',
            'coctree',
        },
        buftypes = {
            'terminal'
        },
        bufnames = {}
    }
}

-- This table is equal to the default separators table
local separators = {
    vertical_bar       = '┃',
    vertical_bar_thin  = '│',
    left               = '',
    right              = '',
    block              = '█',
    left_filled        = '',
    right_filled       = '',
    slant_left         = '',
    slant_left_thin    = '',
    slant_right        = '',
    slant_right_thin   = '',
    slant_left_2       = '',
    slant_left_2_thin  = '',
    slant_right_2      = '',
    slant_right_2_thin = '',
    left_rounded       = '',
    left_rounded_thin  = '',
    right_rounded      = '',
    right_rounded_thin = '',
    circle             = '●'
}

local components = {
    left  = {active = {}, inactive = {}},
    mid   = {active = {}, inactive = {}},
    right = {active = {}, inactive = {}}
}

local components_gap_str = " "

-------------------- insert left start -------------------- {
table.insert(components.left.active, {
    icon = '',
    provider = 'vi_mode',
    hl = function()
        local val = {}
        val.fg    = colors.black
        val.bg    = colors.violet
        val.style = 'bold'
        return val
    end,

    left_sep = {
        str = 'left_rounded',
        hl = {
            fg = colors.violet,
        }
    },
    right_sep = {
        str = 'right_rounded',
        hl = {
            fg = colors.violet,
        }
    }
})

table.insert(components.left.active, {
    provider = components_gap_str,
})

table.insert(components.left.active, {
    -- git branch related
    provider = function()
        return git.git_branch({}) .. git.git_diff_added({}) .. git.git_diff_removed({}) .. git.git_diff_changed({})
    end,
    hl =  {
        fg    = colors.yellow,
        bg    = colors.oceanblue,
        style = 'bold',
    },
    left_sep = {
        str = 'left_rounded',
        hl = {
            fg = colors.oceanblue,
        }
    },
    right_sep = {
        str = 'right_rounded',
        hl = {
            fg = colors.oceanblue,
        }
    },
})

table.insert(components.left.active, {
    provider = components_gap_str,
})

table.insert(components.left.active, {
    provider = function()
        return vim.b.coc_current_function
    end,
    hl =  {
        fg    = colors.bg,
        bg    = colors.magenta,
        style = 'bold',
    },
    left_sep = {
        str = 'left_rounded',
        hl = {
            fg = colors.magenta,
        }
    },
    right_sep = {
        str = 'right_rounded',
        hl = {
            fg = colors.magenta,
        }
    },
    enabled = function ()
        return vim.b.coc_current_function ~= '' and
        vim.fn.exists('b:coc_current_function') ~= 0 and
        ENV.show_current_func
    end
})

table.insert(components.left.inactive, {
    provider = function()
        return vim.bo.filetype:upper()
    end,
    hl =  {
        fg    = colors.bg,
        bg    = colors.magenta,
        style = 'bold',
    },
    left_sep = {
        str = 'left_rounded',
        hl = {
            fg = colors.magenta,
        }
    },
    right_sep = {
        str = 'right_rounded',
        hl = {
            fg = colors.magenta,
        }
    },
})

-------------------- insert left end -------------------- }

-------------------- insert mid start -------------------- {
table.insert(components.mid.active, {
    provider = function()
        local tag_progress = vim.fn['gutentags#inprogress']()
        local ctags = tag_progress[1]
        local gtags = tag_progress[2]
        local msg = ''
        if type(ctags) ~= 'nil' then
            msg = msg .. '⏳' .. ctags
        end
        if type(gtags) ~= 'nil' then
            msg = msg .. '⏳' .. gtags
        end
        return msg
    end,
    hl =  {
        fg    = colors.lightgray,
        bg    = colors.darkgray,
        style = 'bold',
    },
    left_sep = {
        str = 'left_rounded',
        hl = {
            fg = colors.darkgray,
        }
    },
    right_sep = {
        str = 'right_rounded',
        hl = {
            fg = colors.darkgray,
        }
    },
    enabled = function()
        local tag_progress = vim.fn['gutentags#inprogress']()
        return type(tag_progress[1]) ~= 'nil' or type(tag_progress[2]) ~= 'nil'
    end
})
-------------------- insert mid end -------------------- }

-------------------- insert right start -------------------- {
table.insert(components.right.active, {
    provider = function ()
        -- check table is empty
        local icon = '⚡'

        local diagnostics = {}
        diagnostics = vim.b.coc_diagnostic_info
        local error   = diagnostics['error']
        local warning = diagnostics['warning']
        return string.format("%sE:%d W:%d", icon, error, warning)
    end,
    hl = function()
        local val = {}
        val.fg    = colors.black
        val.bg    = colors.red
        val.style = 'bold'
        return val
    end,

    left_sep = {
        str = 'left_rounded',
        hl = {
            fg = colors.red,
        }
    },

    right_sep = {
        str = 'right_rounded',
        hl = {
            fg = colors.red,
        }
    },
    enabled = function()
        return type(vim.b.coc_diagnostic_info) ~= 'nil'
    end
})

table.insert(components.right.active, {
    provider = components_gap_str,
})

table.insert(components.right.active, {
    -- file encoding
    provider = function()
        local fenc = file.file_encoding()
        local icon = '👽 '
        return icon .. fenc
    end,

    hl = function()
        local val = {}
        val.fg    = colors.black
        val.bg    = colors.yellow
        val.style = 'bold'
        return val
    end,

    left_sep = {
        str = 'left_rounded',
        hl = {
            fg = colors.yellow,
        }
    },

    right_sep = {
        str = 'right_rounded',
        hl = {
            fg = colors.yellow,
        }
    }
})

table.insert(components.right.active, {
    provider = components_gap_str,
})

table.insert(components.right.active, {
    -- file format
    provider = function()
        local fft = vim.bo.fileformat:upper()
        local icon = ''
        if fft == 'UNIX' then
            icon = ' '
        elseif fft == 'MAC' then
            icon = ' '
        else
            icon = ' '
        end
        return icon .. fft
    end,
    hl = function()
        local val = {}
        val.fg    = colors.black
        val.bg    = colors.skyblue
        val.style = 'bold'
        return val
    end,

    left_sep = {
        str = 'left_rounded',
        hl = {
            fg = colors.skyblue,
        }
    },

    right_sep = {
        str = 'right_rounded',
        hl = {
            fg = colors.skyblue,
        }
    }
})

table.insert(components.right.active, {
    provider = components_gap_str,
})

table.insert(components.right.active, {
    -- line number + line percentage + line scroll bar --
    provider = function()
        -- return ' ' .. cursor.position() .. separators.slant_right_2_thin .. cursor.line_percentage() .. ' ' .. cursor.scroll_bar()
        return cursor.line_percentage() .. ' ' .. cursor.scroll_bar()
    end,

    hl = function()
        local val = {}
        val.fg    = colors.black
        val.bg    = colors.cyan
        val.style = 'bold'
        return val
    end,

    left_sep = {
        str = 'left_rounded',
        hl = {
            fg = colors.cyan,
        }
    },

    right_sep = {
        str = 'right_rounded',
        hl = {
            fg = colors.cyan,
        }
    }
})
-------------------- insert right end -------------------- }

require('feline').setup({
    colors = colors,
    vi_mode_colors = vi_mode_colors,

    components = components,
    properties = properties,
    separators = separators,
})




