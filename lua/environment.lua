

local M = {}


-- personal environment variable {{{
M.env_var = {
    leader_key               = " ", -- space as leader key
    local_leader_key         = ",",

    -- onedark   , dracula   , vscode, nord,
    -- tokyonight, catppuccin, kanagawa
    color_scheme             = "dracula"
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
    buf_next         = { lhs = "<M-l>", desc = "buffer cycle next" },
    buf_prev         = { lhs = "<M-h>", desc = "buffer cycle prev" },
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
        prefix          = { lhs = "<LEADER>f", desc = "telescope"                     },
        find_file       = { lhs = "f"        , desc = "telescope find file"           },
        ctags_jump      = { lhs = "j"        , desc = "telescope ctags jump"          },
        gtags_reference = { lhs = "gr"       , desc = "telescope gtags referencjumpe" },
    },
}

for p_name, p_value in pairs(M.module_key) do
    for k, v in pairs(M.module_key[p_name]) do
        if k ~= "prefix" then
            if (M.module_key[p_name].prefix) then
                v.lhs = M.module_key[p_name].prefix.lhs .. v.lhs
            end
        end
    end
end

-- print(vim.inspect(M.module_key))


return M
