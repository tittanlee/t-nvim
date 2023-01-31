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
    colorscheme              = "catppuccin",

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

M.keys               = {
    generic = {
        save_file        = "<F2>",
        source_cur_file  = "<F3>",
        quit             = "<F4>",
        strip_tail_white = "<F12>",

        -- better window movement
        mv_win_up        = "<C-k>",
        mv_win_down      = "<C-j>",
        mv_win_left      = "<C-l>",
        mv_win_right     = "<C-h>",

        -- buffer ontrol - switch and wipe - instead of nvim_bufferline plugin
        buf_next         = "<M-l>",
        buf_prev         = "<M-h>",
        -- bdelete instead of bufdelete plugin
        buf_wipe         = "<M-w>",

        -- neovim paste remapping to shift+insert
        paste            = "<S-Insert>",

        -- open / source vimrc file quickly
        so_vimrc         = "<LEADER>rv",
        ed_vimrc         = "<LEADER>ev",

        -- split or close the window
        split_vert_wn    = "<LEADER>sv",
        split_horz_wn    = "<LEADER>sh",
        close_wn         = "<LEADER>sc",

        -- easier moving of code blocks
        indent_right     = "<",
        indent_left      = ">",

        -- jk mapping to <ESC> return normal mode
        remapping_esc    = "jk",

        -- directly entering command mode instead of ;
        remapping_colon  = ";",

        -- Move current line / block with Alt-j/k ala vscode.
        mv_line_blk_up   = "<M-k>",
        mv_line_blk_down = "<M-j>",
    },


    module = {
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ module key binding ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        bufferline    = {
            cycle_prev = "<M-h>",
            cycle_next = "<M-l>",
            move_prev  = "<M-1>",
            move_next  = "<M-2>",
            pick       = "<M-b>",
        },

        bufdelete = {
            buf_del = "<M-w>",
        },

        cmp = {

        },

        comment = {

        },

        easy_aling = {
            prefix     = "<LEADER>e",
            align      = "a",
            live_align = "la",
        },

        fzf = {

        },

        gitsigns = {

        },

        indent_blankline = {
            prefix = "<LEADER>i",
            toggle = "l",
        },

        lsp = {

        },

        nvim_tree = {
            prefix = "<LEADER>w",
            toggle = "w",
            find   = "e",
        },
    },
}

return M
