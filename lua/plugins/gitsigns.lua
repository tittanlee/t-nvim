


return {
    "lewis6991/gitsigns.nvim",

    config = function()
        require("gitsigns").setup({

            signs = {
                add          = {hl = "GitSignsAdd",    text = "", numhl="GitSignsAddNr",    linehl="GitSignsAddLn"    },
                change       = {hl = "GitSignsChange", text = "", numhl="GitSignsChangeNr", linehl="GitSignsChangeLn" },
                delete       = {hl = "GitSignsDelete", text = "", numhl="GitSignsDeleteNr", linehl="GitSignsDeleteLn" },
                topdelete    = {hl = "GitSignsDelete", text = "", numhl="GitSignsDeleteNr", linehl="GitSignsDeleteLn" },
                changedelete = {hl = "GitSignsChange", text = "", numhl="GitSignsChangeNr", linehl="GitSignsChangeLn" },
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
                virt_text_pos     = "eol", -- "eol" | "overlay" | "right_align"
                delay             = 300,
                ignore_whitespace = false,
            },

            sign_priority                = 6,
            update_debounce              = 100,
            status_formatter             = nil, -- Use default
            max_file_length              = 40000,
            current_line_blame_formatter = function(name, blame_info, opts)
                local text
                local date_time

                -- date_time = require("gitsigns.util").get_relative_time(tonumber(blame_info["author_time"]))
                date_time = os.date("%Y-%m-%d", tonumber(blame_info["author_time"]))
                text = string.format("%s | %s | %s | %s | %s",
                    date_time,
                    blame_info.abbrev_sha,
                    blame_info.author,
                    blame_info.summary,
                    blame_info.filename
                )

                return {{" >>> "..text, "Search"}}
            end,

            sign_priority                = 6,
            update_debounce              = 100,
            status_formatter             = nil, -- Use default
            max_file_length              = 40000,

            preview_config = {
                -- Options passed to nvim_open_win
                border   = "single",
                style    = "minimal",
                relative = "cursor",
                row      = 0,
                col      = 1
            },

            yadm = {
                enable = false
            },

            on_attach = function(bufnr)
                local module_key = require("environment").module_key.gitsigns
                local keymap     = require("util.keymap")

                -- Navigation
                keymap('n', module_key.next_hunk.lhs      , "<cmd>Gitsigns next_hunk<CR>"                         , { buffer = bufnr, desc = module_key.next_hunk.desc })
                keymap('n', module_key.prev_hunk.lhs      , "<cmd>Gitsigns prev_hunk<CR>"                         , { buffer = bufnr, desc = module_key.prev_hunk.desc })

                -- Actions
                keymap('n', module_key.stage_hunk.lhs     , '<cmd>Gitsigns stage_hunk<CR>'                        , { buffer = bufnr, desc = module_key.stage_hunk.desc      })
                keymap('n', module_key.reset_hunk.lhs     , '<cmd>Gitsigns reset_hunk<CR>'                        , { buffer = bufnr, desc = module_key.reset_hunk.desc      })
                keymap('n', module_key.stage_buffer.lhs   , '<cmd>Gitsigns stage_buffer<CR>'                      , { buffer = bufnr, desc = module_key.stage_buffer.desc    })
                keymap('n', module_key.undo_stage_hunk.lhs, '<cmd>Gitsigns undo_stage_hunk<CR>'                   , { buffer = bufnr, desc = module_key.undo_stage_hunk.desc })
                keymap('n', module_key.reset_buffer.lhs   , '<cmd>Gitsigns reset_buffer<CR>'                      , { buffer = bufnr, desc = module_key.reset_buffer.desc    })
                keymap('n', module_key.preview_hunk.lhs   , '<cmd>Gitsigns preview_hunk<CR>'                      , { buffer = bufnr, desc = module_key.prev_hunk.desc       })
                keymap('n', module_key.blame_line.lhs     , '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', { buffer = bufnr, desc = module_key.blame_line.desc      })
                keymap('n', module_key.diff_this.lhs      , '<cmd>Gitsigns diffthis<CR>'                          , { buffer = bufnr, desc = module_key.diff_this.desc       })
                keymap('n', module_key.diff_head.lhs      , '<cmd>lua require"gitsigns".diffthis("~")<CR>'        , { buffer = bufnr, desc = module_key.diff_head.desc       })
                keymap('n', module_key.select_hunk.lhs    , '<cmd>Gitsigns select_hunk<CR>'                       , { buffer = bufnr, desc = module_key.select_hunk.desc     })

                -- toogle signs
                keymap('n', module_key.toggle_line_blame.lhs, '<cmd>Gitsigns toggle_current_line_blame<CR>'         , { buffer = bufnr, desc = module_key.toggle_line_blame.desc})
                keymap('n', module_key.toggle_signs.lhs     , '<cmd>Gitsigns toggle_signs<CR>'                      , { buffer = bufnr, desc = module_key.toggle_signs.desc     })
                keymap('n', module_key.toggle_deleted.lhs   , '<cmd>Gitsigns toggle_deleted<CR>'                    , { buffer = bufnr, desc = module_key.toggle_deleted.desc   })
                keymap('n', module_key.toggle_numhl.lhs     , '<cmd>Gitsigns toggle_numhl<CR>'                      , { buffer = bufnr, desc = module_key.toggle_numhl.desc     })
                keymap('n', module_key.toggle_word_diff.lhs , '<cmd>Gitsigns toggle_word_diff<CR>'                  , { buffer = bufnr, desc = module_key.toggle_word_diff.desc })
            end,
        })
    end,
}
