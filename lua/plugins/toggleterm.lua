

local toggleterm_config = function()

    local module_key = require("environment").module_key.toggleterm
    local action     = require("environment").module_key.toggleterm.action
    local keymap     = require("util.keymap")

    require("toggleterm").setup ({
        -- size can be a number or function which is passed the current terminal
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.5
            end
        end,
        open_mapping      = module_key.toggle.lhs,
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
            keymap("t"   , action.back_to_normal.lhs, [[<C-\><C-n>]]      , {buffer = true, desc = action.back_to_normal.desc })
            -- keymap("t", "jk"                     , [[<C-\><C-n>]]      , {buffer = true, desc = ""                         })
            keymap("t"   , action.mv_win_up.lhs     , [[<C-\><C-n><C-W>k]], {buffer = true, desc = action.mv_win_up.desc      })
            keymap("t"   , action.mv_win_down.lhs   , [[<C-\><C-n><C-W>j]], {buffer = true, desc = action.mv_win_down.desc    })
            keymap("t"   , action.mv_win_left.lhs   , [[<C-\><C-n><C-W>h]], {buffer = true, desc = action.mv_win_left.desc    })
            keymap("t"   , action.mv_win_right.lhs  , [[<C-\><C-n><C-W>l]], {buffer = true, desc = action.mv_win_right.desc   })
        end,

        -- function to run when the terminal opens
        on_open = function(term)
        end,

        -- function to run when the terminal closes
        on_close = function(term)
        end,

        -- callback for processing output on stdout
        on_stdout = function(term, job, data, name)
        end,

        -- callback for processing output on stderr
        on_stderr =function(term, job, data, name)
        end,

        -- function to run when terminal process exits
        on_exit = function(term, job, exit_code, name)
        end,

    })
end


return {

    -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
    -- A neovim plugin to persist and toggle multiple terminals during an editing session
    -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
    "akinsho/toggleterm.nvim",

    config = toggleterm_config,

    cmd = { "ToggleTerm" },

}
