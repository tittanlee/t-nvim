
local uv = vim.loop
local os_name = uv.os_uname().sysname

local M = {}


-- personal environment variable {{{
M.env_var = {
    leader_key               = " ", -- space as leader key
    local_leader_key         = ",",

    -- onedark   , dracula   , vscode, nord,
    -- tokyonight, catppuccin, kanagawa
    color_scheme             = "catppuccin",

    is_mac                   = os_name == "Darwin",
    is_linux                 = os_name == "Linux",
    is_windows               = os_name == "Windows_NT" or "Windows",
}
-- }}}


-- Default Plugins {{{
-- disable = 1, enable = 0
M.builtin_feature = {
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
-- }}}

-- neovim generic key binding {{{
M.generic_key = {
    save_file        = { lhs = "<F2>" , desc = "save file"              },
    source_file      = { lhs = "<F3>" , desc = "source current file"    },
    quit             = { lhs = "<F4>" , desc = "quit (neo)vim"          },
    strip_tail_white = { lhs = "<F12>", desc = "strip tail white space" },

    -- buffer ontrol - switch and wipe - instead of nvim_bufferline plugin
    buf_next         = { lhs = "<M-h>", desc = "buffer cycle next" },
    buf_prev         = { lhs = "<M-l>", desc = "buffer cycle prev" },
    -- bdelete instead of bufdelete plugin
    buf_wipe         = { lhs = "<M-w>", desc = "buffer wipe" },

    -- better window movement
    mv_win_up        = { lhs = "<C-k>", desc = "move win up"    },
    mv_win_down      = { lhs = "<C-j>", desc = "move win down"  },
    mv_win_left      = { lhs = "<C-h>", desc = "move win left"  },
    mv_win_right     = { lhs = "<C-l>", desc = "move win right" },

    -- split or close the window
    split_vert_wn    = { lhs = "<LEADER>sv", desc = "split vert win" },
    split_horz_wn    = { lhs = "<LEADER>sh", desc = "split horz win" },
    close_wn         = { lhs = "<LEADER>sc", desc = "close current win" },

    -- easier moving of code blocks
    indent_right     = { lhs = "<", desc = "indent right" },
    indent_left      = { lhs = ">", desc = "indent left"  },

    -- open / source vimrc file quickly
    so_vimrc         = { lhs = "<LEADER>rv", desc = "source $MYVIMRC" },
    ed_vimrc         = { lhs = "<LEADER>ev", desc = "edit $MYVIMRC"   },

    -- jk mapping to <ESC> return normal mode
    remapping_esc    = { lhs = "jk", desc = "remmpping to ESC" },

    -- directly entering command mode instead of ;
    remapping_colon  = { lhs = ";", desc = "remapping colon" },

    -- resize with arrows
    resize_up    = { lhs = "<C-up>"   , desc = "Resize - 2" }         ,
    resize_down  = { lhs = "<C-down>" , desc = "Resize + 2" }         ,
    resize_left  = { lhs = "<C-left>" , desc = "Vertical Resize - 2" },
    resize_right = { lhs = "<C-right>", desc = "Vertical Resize + 2" },

}
-- }}}


M.module_key = {
    easy_align = {
        prefix     = { lhs = "<LEADER>e", desc = "[E]asy align"       },
        align      = { lhs = "a"        , desc = "[A]lign with"       },
        live_align = { lhs = "l"        , desc = "[L]ive align with"  },
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
        prefix       = { lhs = "<LEADER>c", desc = "comment"                             },
        toggle_line  = { lhs = "c"        , desc = "[C]omment toggl current line"        },
        toggle_block = { lhs = "b"        , desc = "comment toggl current [B]lock"       },
        op_line      = { lhs = "c"        , desc = "[C]omment toggle linewise <visual>"  },
        op_block     = { lhs = "b"        , desc = "comment toggle [B]lockwise <visual>" },
        ex_above     = { lhs = "0"        , desc = "comment insert above"                },
        ex_below     = { lhs = "o"        , desc = "comment insert bel[O]w"              },
        ex_eol       = { lhs = "A"        , desc = "comment insert end of line"          },
    },

    fzf = {
        prefix      = { lhs = "<LEADER>f", desc = "fzf"             },
        find_files  = { lhs = "f"        , desc = "fzf find file"   },
        buffer_tags = { lhs = "t"        , desc = "fzf buffer tags" },
        ctags_jump  = { lhs = "j"        , desc = "fzf ctags jump"  },
    },

    gitsigns = {
        prefix            = { lhs = "<LEADER>h", desc = "git signs"              },
        next_hunk         = { lhs = "]"        , desc = "next hunk"              },
        prev_hunk         = { lhs = "["        , desc = "prev hunk"              },
        stage_hunk        = { lhs = "s"        , desc = "[s]tage hunk"           },
        reset_hunk        = { lhs = "r"        , desc = "[R]eset hunk"           },
        stage_buffer      = { lhs = "S"        , desc = "[S]tage buffer"         },
        undo_stage_hunk   = { lhs = "u"        , desc = "[U]ndo stage hunk "     },
        reset_buffer      = { lhs = "R"        , desc = "[R]eset buffer"         },
        preview_hunk      = { lhs = "p"        , desc = "[P]review hunk"         },
        blame_line        = { lhs = "b"        , desc = "[B]lame line"           },
        diff_this         = { lhs = "d"        , desc = "[d]iff this"            },
        diff_head         = { lhs = "D"        , desc = "[D]iff head"            },
        select_hunk       = { lhs = "h"        , desc = "select [H]unk"          },

        toggle_line_blame = { lhs = "tb"       , desc = "toggle line [B]lame"    },
        toggle_signs      = { lhs = "ts"       , desc = "toggle [S]igns"         },
        toggle_deleted    = { lhs = "td"       , desc = "toggle deleted"         },
        toggle_numhl      = { lhs = "tn"       , desc = "toggle [N]um highlight" },
        toggle_word_diff  = { lhs = "tw"       , desc = "toggle [W]ord diff"     },
    },

    interestingwords = {
        search        = { lhs = "<LEADER>m", desc = "interestingwords search"        },
        cancel_search = { lhs = "<LEADER>M", desc = "interestingwords cancel search" },
        color         = { lhs = "<LEADER>k", desc = "interestingwords color"         },
        cancel_color  = { lhs = "<LEADER>K", desc = "interestingwords cancel color"  },
    },

    neo_tree = {
        prefix = { lhs = "<LEADER>w", desc = "NeoTree" },
        toggle = { lhs = "w" , desc = "NeoTree toggle" },
        reveal = { lhs = "e" , desc = "NeoTree reveal current file" },
    },

    nvim_tree = {
        prefix = { lhs = "<LEADER>w", desc = "NvimTree" },
        toggle = { lhs = "w" , desc = "NvimTree toggle" },
        reveal = { lhs = "e" , desc = "NeoTree reveal current file" },
    },

    telescope = {
        prefix          = { lhs = "<LEADER>f", desc = "telescope"                      },
        find_file       = { lhs = "f"        , desc = "telescope find file"            },
        ctags_jump      = { lhs = "j"        , desc = "telescope ctags jump"           },
        ctags_outline   = { lhs = "t"        , desc = "telescope ctags outline"        },
        gtags_reference = { lhs = "gr"       , desc = "telescope gtags referencjumpe"  },
        help_tags       = { lhs = "h"        , desc = "telescope help tags"            },
        buffer_lines    = { lhs = "bl"       , desc = "telescope current buffer lines" },
        buffer          = { lhs = "b"        , desc = "telescope buffers list"         },

        action= {
            move_selection_next    = { lhs = "<C-j>", desc = "telescope action selection next"        },
            move_selection_prev    = { lhs = "<C-k>", desc = "telescope action selection previous"    },
            results_scrolling_up   = { lhs = "<C-u>", desc = "telescope action result scrolling up"   },
            results_scrolling_down = { lhs = "<C-d>", desc = "telescope action result scrolling down" },
            toggle_preview         = { lhs = "<C-p>", desc = "telescope action toggle preview"        },
            preview_scrolling_down = { lhs = "<C-f>", desc = "telescope action preview scroll down"   },
            preview_scrolling_up   = { lhs = "<C-b>", desc = "telescope action preview scroll down"   },
            action_close           = { lhs = "<ESC>", desc = "telescope action close"                 },
            result_to_qflist       = { lhs = "<C-q>", desc = "telescope result to qflist"             },
            select_default         = { lhs = "<CR>" , desc = "telescope select the default"           },
            delete_buffer          = { lhs = "<C-w>", desc = "telescope delete the select buffer"     },
        },
    },
}

for p_name, p_value in pairs(M.module_key) do
    for k, v in pairs(M.module_key[p_name]) do
        if k ~= "prefix" then
            if (M.module_key[p_name].prefix) and (v.lhs) then
                v.lhs = M.module_key[p_name].prefix.lhs .. v.lhs
            end
        end
    end
end

-- print(vim.inspect(M.module_key))


return M
