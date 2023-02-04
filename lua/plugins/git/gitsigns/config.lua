

local status_ok, gitsigns= pcall(require, "gitsigns")
if not status_ok then
    return
end

local line_blame_formatter = function(name, blame_info, opts)
    local text
    local date_time

    -- date_time = require('gitsigns.util').get_relative_time(tonumber(blame_info['author_time']))
    date_time = os.date('%Y-%m-%d', tonumber(blame_info['author_time']))
    text = string.format('%s | %s | %s | %s | %s',
        date_time,
        blame_info.abbrev_sha,
        blame_info.author,
        blame_info.summary,
        blame_info.filename
    )

    return {{' >>> '..text, 'Search'}}
end

gitsigns.setup {
    signs = {
        add          = {hl = 'GitSignsAdd',    text = '', numhl='GitSignsAddNr',    linehl='GitSignsAddLn'    },
        change       = {hl = 'GitSignsChange', text = '', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
        delete       = {hl = 'GitSignsDelete', text = '', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
        topdelete    = {hl = 'GitSignsDelete', text = '', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
        changedelete = {hl = 'GitSignsChange', text = '', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    },
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        interval     = 300,
        follow_files = true,
    },

    attach_to_untracked = true,
    current_line_blame  = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text         = true,
        virt_text_pos     = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay             = 300,
        ignore_whitespace = false,
    },

    current_line_blame_formatter = line_blame_formatter,
    sign_priority                = 6,
    update_debounce              = 100,
    status_formatter             = nil, -- Use default
    max_file_length              = 40000,

    preview_config = {
        -- Options passed to nvim_open_win
        border   = 'single',
        style    = 'minimal',
        relative = 'cursor',
        row      = 0,
        col      = 1
    },

    yadm = {
        enable = false
    },

    on_attach = function(bufnr)

        local module_key = require("environment").keys.module.gitsigns
        local status_ok, wk = pcall(require, "which-key")

        if status_ok then
            wk.register({
                [module_key.prefix] = {
                    name = "[G]itsigns",
                    [module_key.next_hunk]         = {"<cmd>Gitsigns next_hunk<CR>"                , "next hunk"            },
                    [module_key.prev_hunk]         = {"<cmd>Gitsigns prev_hunk<CR>"                , "prev hunk"            },
                    [module_key.stage_hunk]        = {"<cmd>Gitsigns stage_hunk<CR>"               , "stage hunk"           },
                    [module_key.reset_hunk]        = {"<cmd>Gitsigns reset_hunk<CR>"               , "reset hunk"           },
                    [module_key.stage_buffer]      = {"<cmd>Gitsigns stage_buffer<CR>"             , "stage buffer"         },
                    [module_key.undo_stage_hunk]   = {"<cmd>Gitsigns undo_stage_hunk<CR>"          , "undo stage hunk"      },
                    [module_key.reset_buffer]      = {"<cmd>Gitsigns reset_buffer<CR>"             , "reset buffer"         },
                    [module_key.preview_hunk]      = {"<cmd>Gitsigns preview_hunk<CR>"             , "preview hunk"         },
                    [module_key.blame_line]        = {"<cmd>Gitsigns blame_line<CR>"               , "blame line"           },
                    [module_key.diff_this]         = {"<cmd>Gitsigns diffthis<CR>"                 , "diff this"            },
                    [module_key.diff_head]         = {"<cmd>lua require'gitsigns'.diffthis('~')"   , "diff head"            },

                    [module_key.toggle_line_blame] = {"<cmd>Gitsigns toggle_current_line_blame<CR>", "toggle line blame"    },
                    [module_key.toggle_signs]      = {"<cmd>Gitsigns toggle_signs<CR>"             , "toggle signs"         },
                    [module_key.toggle_deleted]    = {"<cmd>Gitsigns toggle_deleted<CR>"           , "toggle deleted"       },
                    [module_key.toggle_numhl]      = {"<cmd>Gitsigns toggle_numhl<CR>"             , "toggle num highlight" },
                    [module_key.toggle_word_diff]  = {"<cmd>Gitsigns toggle_word_diff<CR>"         , "toggle word diff"     },
                                                                                                                            },
            }, {buffer = bufnr, mode = "n"})

            wk.register({
                [module_key.prefix] = {
                    name = "gitsigns",
                    [module_key.select_hunk]  = {":<cmd>Gitsigns select_hunk<CR>", "select hunk"},
                },
            }, {buffer = bufnr, mode = "o"})

            wk.register({
                [module_key.prefix] = {
                    name = "gitsigns",
                    [module_key.select_hunk]  = {":<cmd>Gitsigns select_hunk<CR>", "select hunk"},
                },
            }, {buffer = bufnr, mode = "x"})

        else
            local keymap = require("utils").keymap

            -- Navigation
            keymap('n', module_key.prefix .. module_key.next_hunk       , "<cmd>Gitsigns next_hunk<CR>"        , {expr=true, buffer = bufnr, desc = "next hunk"})
            keymap('n', module_key.prefix .. module_key.prev_hunk       , "<cmd>Gitsigns prev_hunk<CR>"        , {expr=true, buffer = bufnr, desc = "prev hunk"})

            -- Actions
            keymap('n', module_key.prefix .. module_key.stage_hunk       , '<cmd>Gitsigns stage_hunk<CR>'                        , {buffer = bufnr, desc = "stage hunk"})
            keymap('n', module_key.prefix .. module_key.reset_hunk       , '<cmd>Gitsigns reset_hunk<CR>'                        , {buffer = bufnr, desc = "reset hunk"})
            keymap('n', module_key.prefix .. module_key.stage_buffer     , '<cmd>Gitsigns stage_buffer<CR>'                      , {buffer = bufnr, desc = "stage buffer"})
            keymap('n', module_key.prefix .. module_key.undo_stage_hunk  , '<cmd>Gitsigns undo_stage_hunk<CR>'                   , {buffer = bufnr, desc = "undo stage hunk"})
            keymap('n', module_key.prefix .. module_key.reset_buffer     , '<cmd>Gitsigns reset_buffer<CR>'                      , {buffer = bufnr, desc = "reset buffer"})
            keymap('n', module_key.prefix .. module_key.preview_hunk     , '<cmd>Gitsigns preview_hunk<CR>'                      , {buffer = bufnr, desc = "preview hunk"})
            keymap('n', module_key.prefix .. module_key.blame_line       , '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', {buffer = bufnr, desc = "blame line"})
            keymap('n', module_key.prefix .. module_key.diff_this        , '<cmd>Gitsigns diffthis<CR>'                          , {buffer = bufnr, desc = "diff this"})
            keymap('n', module_key.prefix .. module_key.diff_head        , '<cmd>lua require"gitsigns".diffthis("~")<CR>'        , {buffer = bufnr, desc = "diff head"})

            -- toogle signs
            keymap('n', module_key.prefix .. module_key.toggle_line_blame, '<cmd>Gitsigns toggle_current_line_blame<CR>'         , {buffer = bufnr, desc = "toggle line blame"})
            keymap('n', module_key.prefix .. module_key.toggle_signs     , '<cmd>Gitsigns toggle_signs<CR>'                      , {buffer = bufnr, desc = "toggle signs"})
            keymap('n', module_key.prefix .. module_key.toggle_deleted   , '<cmd>Gitsigns toggle_deleted<CR>'                    , {buffer = bufnr, desc = "toggle deleted"})
            keymap('n', module_key.prefix .. module_key.toggle_numhl     , '<cmd>Gitsigns toggle_numhl<CR>'                      , {buffer = bufnr, desc = "toggle num highlight"})
            keymap('n', module_key.prefix .. module_key.toggle_word_diff , '<cmd>Gitsigns toggle_word_diff<CR>'                  , {buffer = bufnr, desc = "toggle word diff"})

            -- Text object
            keymap('o', module_key.prefix .. module_key.select_hunk      , ':<C-U>Gitsigns select_hunk<CR>'                      , {buffer = bufnr, desc = "select hunk"})
            keymap('x', module_key.prefix .. module_key.select_hunk      , ':<C-U>Gitsigns select_hunk<CR>'                      , {buffer = bufnr, desc = "select hunk"})
        end
    end
}
