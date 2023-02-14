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
    colorscheme              = "dracula",
    lualine_theme            = "jellybeans",

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

M.keys = {
    generic = {
        save_file        = { lhs = "<F2>" , desc = "save file"              },
        source_cur_file  = { lhs = "<F3>" , desc = "source current file"    },
        quit             = { lhs = "<F4>" , desc = "quit (neo)vim"          },
        strip_tail_white = { lhs = "<F12>", desc = "strip tail white space" },

        -- better window movement
        mv_win_up        = { lhs = "<C-k>", desc = "move win up"    },
        mv_win_down      = { lhs = "<C-j>", desc = "move win down"  },
        mv_win_left      = { lhs = "<C-h>", desc = "move win left"  },
        mv_win_right     = { lhs = "<C-l>", desc = "move win right" },

        -- buffer ontrol - switch and wipe - instead of nvim_bufferline plugin
        buf_next         = { lhs = "<M-l>", desc = "buffer cycle next" },
        buf_prev         = { lhs = "<M-h>", desc = "buffer cycle prev" },
        -- bdelete instead of bufdelete plugin
        buf_wipe         = { lhs = "<M-w>", desc = "buffer wipe" },

        -- neovim paste remapping to shift+insert
        paste            = { lhs = "<S-Insert>", desc = "paste"},

        -- open / source vimrc file quickly
        so_vimrc         = { lhs = "<LEADER>rv", desc = "source $MYVIMRC" },
        ed_vimrc         = { lhs = "<LEADER>ev", desc = "edit $MYVIMRC"   },

        -- split or close the window
        split_vert_wn    = { lhs = "<LEADER>sv", desc = "split vert win" },
        split_horz_wn    = { lhs = "<LEADER>sh", desc = "split horz win" },
        close_wn         = { lhs = "<LEADER>sc", desc = "close current win" },

        -- easier moving of code blocks
        indent_right     = { lhs = "<", desc = "indent right" },
        indent_left      = { lhs = ">", desc = "indent left"  },

        -- jk mapping to <ESC> return normal mode
        remapping_esc    = { lhs = "jk", desc = "remmpping to ESC" },

        -- directly entering command mode instead of ;
        remapping_colon  = { lhs = ";", desc = "remapping colon" },

        -- Move current line / block with Alt-j/k ala vscode.
        mv_line_blk_up   = { lhs = "<M-k>", desc = "move line block up " },
        mv_line_blk_down = { lhs = "<M-j>", desc = "move line block down" },

        -- folding level.
        fold_level_0 = { lhs = "z0", desc = "set fold level = 0" },
        fold_level_1 = { lhs = "z1", desc = "set fold level = 1" },
        fold_level_2 = { lhs = "z2", desc = "set fold level = 2" },
        fold_level_3 = { lhs = "z3", desc = "set fold level = 3" },
        fold_level_4 = { lhs = "z4", desc = "set fold level = 4" },
        fold_level_5 = { lhs = "z5", desc = "set fold level = 5" },
        fold_level_6 = { lhs = "z6", desc = "set fold level = 6" },
        fold_level_7 = { lhs = "z7", desc = "set fold level = 7" },
        fold_level_8 = { lhs = "z8", desc = "set fold level = 8" },
        fold_level_9 = { lhs = "z9", desc = "set fold level = 9" },
    },


    module = {
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ module key binding ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        bufferline    = {
            cycle_prev = { lhs = "<M-h>", desc = "buf prev"      },
            cycle_next = { lhs = "<M-l>", desc = "buf next"      },
            move_prev  = { lhs = "<M-1>", desc = "move buf prev" },
            move_next  = { lhs = "<M-2>", desc = "move buf next" },
            pick       = { lhs = "<M-b>", desc = "buf pick"      },
        },

        bufdelete = {
            buf_del = { lhs = "<M-w>", desc = "buf delete" },
        },

        cmp = {
            scroll_doc_up    = { lhs = "<C-f>"    , desc = "scroll doc up"           },
            scroll_doc_down  = { lhs = "<C-b>"    , desc = "scroll doc down"         },
            complete         = { lhs = "<C-Space>", desc = "complete"                },
            close            = { lhs = "<C-e>"    , desc = "close"                   },
            confirm          = { lhs = "<CR>"     , desc = "confirm"                 },
            select_next_item = { lhs = "<C-j>"    , desc = "select next item"        },
            select_prev_item = { lhs = "<C-k>"    , desc = "select prev item"        },
            alt_select_next  = { lhs = "<TAB>"    , desc = "alternative select next" },
            alt_select_prev  = { lhs = "<S-TAB>"  , desc = "alternative select prev" },
        },

        comment = {
            prefix       = { lhs = "<LEADER>c", desc = "[C]omment"                           },
            toggle_line  = { lhs = "c"        , desc = "[C]omment toggl current line"        },
            toggle_block = { lhs = "b"        , desc = "comment toggl current [B]lock"       },
            op_line      = { lhs = "c"        , desc = "[C]omment toggle linewise <visual>"  },
            op_block     = { lhs = "b"        , desc = "comment toggle [B]lockwise <visual>" },
            ex_above     = { lhs = "0"        , desc = "comment insert above"                },
            ex_below     = { lhs = "o"        , desc = "comment insert bel[O]w"              },
            ex_eol       = { lhs = "A"        , desc = "comment insert end of line"          },
        },

        easy_aling = {
            prefix     = { lhs = "<LEADER>e", desc = "[E]asy align"       },
            align      = { lhs = "a"        , desc = "[A]lign with"       },
            live_align = { lhs = "l"        , desc = "[L]ive align with"  },
        },

        fzf = {
            prefix           = { lhs = "<LEADER>f", desc = "[F]zf"               },
            find_files       = { lhs = "f"        , desc = "[F]iles"             },
            outline          = { lhs = "t"        , desc = "buffer [T]ags"       },
            maps             = { lhs = "m"        , desc = "maps"                },

            ctags_jump       = { lhs = "j"        , desc = "ctags [J]ump"        },

            gtags_definition = { lhs = "d"        , desc = "gtags [D]definition" },
            gtags_reference  = { lhs = "r"        , desc = "gtags [R]eference"   },
            gtags_symbol     = { lhs = "s"        , desc = "gtags [S]ymbol"      },
            gtags_grepper    = { lhs = "g"        , desc = "gtags [G]repper"     },
        },

        gitsigns = {
            action_grp = {
                prefix            = { lhs = "<LEADER>h", desc = "git signs"        },
                next_hunk         = { lhs = "]"        , desc = "next hunk"          },
                prev_hunk         = { lhs = "["        , desc = "prev hunk"          },
                stage_hunk        = { lhs = "s"        , desc = "[s]tage hunk"       },
                reset_hunk        = { lhs = "r"        , desc = "[R]eset hunk"       },

                stage_buffer      = { lhs = "S"        , desc = "[S]tage buffer"     },
                undo_stage_hunk   = { lhs = "u"        , desc = "[U]ndo stage hunk " },
                reset_buffer      = { lhs = "R"        , desc = "[R]eset buffer"     },

                preview_hunk      = { lhs = "p"        , desc = "[P]review hunk"     },
                blame_line        = { lhs = "b"        , desc = "[B]lame line"       },
                diff_this         = { lhs = "d"        , desc = "[d]iff this"        },
                diff_head         = { lhs = "D"        , desc = "[D]iff head"        },
                select_hunk       = { lhs = "h"        , desc = "select [H]unk"      },
            },

            toggle_grp = {
                prefix     = { lhs = "<LEADER>ht", desc = "[G]it signs"            },
                line_blame = { lhs = "b"         , desc = "toggle line [B]lame"    },
                signs      = { lhs = "s"         , desc = "toggle [S]igns"         },
                deleted    = { lhs = "d"         , desc = "toggle deleted"         },
                numhl      = { lhs = "n"         , desc = "toggle [N]um highlight" },
                word_diff  = { lhs = "w"         , desc = "toggle [W]ord diff"     }
            },
        },

        hop = {
            prefix    = { lhs = "<LEADER>s", desc = "[S]earch" },
            two_words = { lhs = "s"        , desc = "hop two word[S]"    },
            patterns  = { lhs = "p"        , desc = "hop [P]atterns"     },
        },

        indent_blankline = {
            prefix = { lhs = "<LEADER>i", desc = "[I]ndent blank line"   },
            toggle = { lhs = "l"        , desc = "indent blank togg[L]e" },
        },

        lsp = {

        },

        nvim_tree = {
            prefix = { lhs = "<LEADER>w", desc = "nvim-tree [W]indow"   },
            toggle = { lhs = "o"        , desc = "nvim-tree t[O]ggle"   },
            find   = { lhs = "e"        , desc = "nvim-ree find fil[E]" },
        },

        spectre = {
            prefix            = { lhs = "<LEADER>s", desc = "[S]earch"                       },
            search_word       = { lhs = "w"        , desc = "spectre - search select [W]ord" },
            open_search_panel = { lhs = "o"        , desc = "spectre - [O]pen search panel"  },
        },

        smartyank = {
            prefix        = { lhs = "<LEADER>y", desc = "smart [Y]ank"                     },
            relative_path = { lhs = "r"        , desc = "yank [R]elative path"             },
            abs_path      = { lhs = "a"        , desc = "yank [A]bsolute path"             },
            dir_path      = { lhs = "d"        , desc = "yank [D]irectroy path"            },
            file_name     = { lhs = "f"        , desc = "yank [F]ile name"                 },
            cwd_path      = { lhs = "w"        , desc = "yank current [W]orking directory" },
        },

        toggle_term        = {
            prefix         = { lhs = "<LEADER>t", desc = "toggle [T]erm" },
            toggle         = { lhs = "t", desc = "enable [T]oggle term" },
            cmd_git        = { lhs = "g", desc = "[G]it toggle" },

            back_to_normal = "<ESC>",
            mv_win_up      = "<C-k>",
            mv_win_down    = "<C-j>",
            mv_win_left    = "<C-h>",
            mv_win_right   = "<C-l>",
        },
    },
}

return M
