

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

        local action_grp = require("environment").keys.module.gitsigns.action_grp
        local toggle_grp = require("environment").keys.module.gitsigns.toggle_grp
        local status_ok, wk = pcall(require, "which-key")

        if status_ok then
            wk.register({
                [action_grp.prefix.lhs] = {
                    name = action_grp.prefix.desc,
                    [action_grp.next_hunk.lhs]         = {"<cmd>Gitsigns next_hunk<CR>"                , action_grp.next_hunk.desc       },
                    [action_grp.prev_hunk.lhs]         = {"<cmd>Gitsigns prev_hunk<CR>"                , action_grp.prev_hunk.desc       },
                    [action_grp.stage_hunk.lhs]        = {"<cmd>Gitsigns stage_hunk<CR>"               , action_grp.stage_hunk.descj     },
                    [action_grp.reset_hunk.lhs]        = {"<cmd>Gitsigns reset_hunk<CR>"               , action_grp.reset_hunk.desc      },
                    [action_grp.stage_buffer.lhs]      = {"<cmd>Gitsigns stage_buffer<CR>"             , action_grp.stage_buffer.desc    },
                    [action_grp.undo_stage_hunk.lhs]   = {"<cmd>Gitsigns undo_stage_hunk<CR>"          , action_grp.undo_stage_hunk.desc },
                    [action_grp.reset_buffer.lhs]      = {"<cmd>Gitsigns reset_buffer<CR>"             , action_grp.reset_buffer.desc    },
                    [action_grp.preview_hunk.lhs]      = {"<cmd>Gitsigns preview_hunk<CR>"             , action_grp.prev_hunk.desc       },
                    [action_grp.blame_line.lhs]        = {"<cmd>Gitsigns blame_line<CR>"               , action_grp.blame_line.desc      },
                    [action_grp.diff_this.lhs]         = {"<cmd>Gitsigns diffthis<CR>"                 , action_grp.diff_this.desc       },
                    [action_grp.diff_head.lhs]         = {"<cmd>lua require'gitsigns'.diffthis('~')"   , action_grp.diff_head.desc     },
                    [action_grp.select_hunk.lhs]       = {":<cmd>Gitsigns select_hunk<CR>"             , action_grp.select_hunk.desc     },
                },

                [toggle_grp.prefix.lhs] = {
                    name = toggle_grp.prefix.desc,
                    [toggle_grp.line_blame.lhs] = {"<cmd>Gitsigns toggle_current_line_blame<CR>", toggle_grp.line_blame.desc },
                    [toggle_grp.signs.lhs]      = {"<cmd>Gitsigns toggle_signs<CR>"             , toggle_grp.signs.desc },
                    [toggle_grp.deleted.lhs]    = {"<cmd>Gitsigns toggle_deleted<CR>"           , toggle_grp.deleted.desc },
                    [toggle_grp.numhl.lhs]      = {"<cmd>Gitsigns toggle_numhl<CR>"             , toggle_grp.numhl.desc },
                    [toggle_grp.word_diff.lhs]  = {"<cmd>Gitsigns toggle_word_diff<CR>"         , toggle_grp.word_diff.desc },
                },
            }, {buffer = bufnr, mode = "n"})
        else
            local keymap = require("utils").keymap

            -- Navigation
            keymap('n', action_grp.prefix.lhs .. action_grp.next_hunk.lhs      , "<cmd>Gitsigns next_hunk<CR>"                         , {buffer = bufnr, desc = action_grp.next_hunk.desc })
            keymap('n', action_grp.prefix.lhs .. action_grp.prev_hunk.lhs      , "<cmd>Gitsigns prev_hunk<CR>"                         , {buffer = bufnr, desc = action_grp.prev_hunk.desc})

            -- Actions
            keymap('n', action_grp.prefix.lhs .. action_grp.stage_hunk.lhs     , '<cmd>Gitsigns stage_hunk<CR>'                        , {buffer = bufnr, desc = action_grp.stage_hunk.desc      })
            keymap('n', action_grp.prefix.lhs .. action_grp.reset_hunk.lhs     , '<cmd>Gitsigns reset_hunk<CR>'                        , {buffer = bufnr, desc = action_grp.reset_hunk.desc      })
            keymap('n', action_grp.prefix.lhs .. action_grp.stage_buffer.lhs   , '<cmd>Gitsigns stage_buffer<CR>'                      , {buffer = bufnr, desc = action_grp.stage_buffer.desc    })
            keymap('n', action_grp.prefix.lhs .. action_grp.undo_stage_hunk.lhs, '<cmd>Gitsigns undo_stage_hunk<CR>'                   , {buffer = bufnr, desc = action_grp.undo_stage_hunk.desc })
            keymap('n', action_grp.prefix.lhs .. action_grp.reset_buffer.lhs   , '<cmd>Gitsigns reset_buffer<CR>'                      , {buffer = bufnr, desc = action_grp.reset_buffer.desc    })
            keymap('n', action_grp.prefix.lhs .. action_grp.preview_hunk.lhs   , '<cmd>Gitsigns preview_hunk<CR>'                      , {buffer = bufnr, desc = action_grp.prev_hunk.desc       })
            keymap('n', action_grp.prefix.lhs .. action_grp.blame_line.lhs     , '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', {buffer = bufnr, desc = action_grp.blame_line.desc      })
            keymap('n', action_grp.prefix.lhs .. action_grp.diff_this.lhs      , '<cmd>Gitsigns diffthis<CR>'                          , {buffer = bufnr, desc = action_grp.diff_this.desc       })
            keymap('n', action_grp.prefix.lhs .. action_grp.diff_head.lhs      , '<cmd>lua require"gitsigns".diffthis("~")<CR>'        , {buffer = bufnr, desc = action_grp.diff_head.desc       })
            keymap('n', action_grp.prefix.lhs .. action_grp.select_hunk.lhs    , '<cmd>Gitsigns select_hunk<CR>'                       , {buffer = bufnr, desc = action_grp.select_hunk.desc     })

            -- toogle signs
            keymap('n', toggle_grp.prefix.lhs .. toggle_grp.line_blame.lhs, '<cmd>Gitsigns toggle_current_line_blame<CR>'         , {buffer = bufnr, desc = toggle_grp.line_blame.desc })
            keymap('n', toggle_grp.prefix.lhs .. toggle_grp.signs.lhs     , '<cmd>Gitsigns toggle_signs<CR>'                      , {buffer = bufnr, desc = toggle_grp.signs.desc      })
            keymap('n', toggle_grp.prefix.lhs .. toggle_grp.deleted.lhs   , '<cmd>Gitsigns toggle_deleted<CR>'                    , {buffer = bufnr, desc = toggle_grp.deleted.desc    })
            keymap('n', toggle_grp.prefix.lhs .. toggle_grp.numhl.lhs     , '<cmd>Gitsigns toggle_numhl<CR>'                      , {buffer = bufnr, desc = toggle_grp.numhl.desc      })
            keymap('n', toggle_grp.prefix.lhs .. toggle_grp.word_diff.lhs , '<cmd>Gitsigns toggle_word_diff<CR>'                  , {buffer = bufnr, desc = toggle_grp.word_diff.desc      })
        end
    end
}
