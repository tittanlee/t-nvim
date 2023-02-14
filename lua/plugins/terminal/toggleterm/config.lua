

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

local module_key = require("environment").keys.module.toggle_term
local callback   = require("plugins.terminal.toggleterm.callback")

toggleterm.setup ({
    -- size can be a number or function which is passed the current terminal
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.5
        end
    end,
    open_mapping      = module_key.prefix.lhs .. module_key.toggle.lhs,
    hide_numbers      = false         , -- hide the number column in toggleterm buffers
    shade_filetypes   = {}            ,
    shade_terminals   = true          ,
    shading_factor    = 1             , -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert   = true          ,
    insert_mappings   = false         , -- whether or not the open mapping applies in insert mode
    persist_size      = true          ,
    terminal_mappings = true          , -- whether or not the open mapping applies in the opened terminals
    persist_mode      = true          , -- if set to true (default) the previous terminal mode will be remembered
    direction         = "horizontal"  , -- direction = "vertical" | "horizontal" | "window" | "float",
    shell             = vim.o.shell   , -- change the default shell
    close_on_exit     = true          , -- close the terminal window when the process exits
    auto_scroll       = true          , -- automatically scroll to the bottom on terminal output

    -- This field is only relevant if direction is set to "float"
    float_opts = {
        -- The border key is *almost* the same as "nvim_open_win"
        -- see :h nvim_open_win for details on borders however
        -- the "curved" border is a custom border type
        -- not natively supported but implemented in this plugin.
        border   = "double",
        winblend = 15,
        width    = math.floor(vim.o.columns * 0.9),
        height   = math.floor(vim.o.lines * 0.9),

        highlights = {
            border     = "Normal",
            background = "Normal",
        },
    },

    winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
            return term.name
        end
    },

    -- function to run when the terminal is first created
    on_create = function(term)
        callback.on_term_create(term)
    end,

    -- function to run when the terminal opens
    on_open = function(term)
        callback.on_term_open(term)
    end,

    -- function to run when the terminal closes
    on_close = function(term)
        callback.on_term_close(term)
    end,

    -- callback for processing output on stdout
    on_stdout = function(term, job, data, name)
        callback.on_term_stdout(term, job, data, name)
    end,

    -- callback for processing output on stderr
    on_stderr =function(term, job, data, name)
        callback.on_term_stderr(term, job, data, name)
    end,

    -- function to run when terminal process exits
    on_exit = function(term, job, exit_code, name)
        callback.on_term_exit(term, job, exit_code, name)
    end,

})


-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ❰ load custom toggle terminal ❱
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
require("plugins.terminal.toggleterm.lazygit")
require("plugins.terminal.toggleterm.gitui")
