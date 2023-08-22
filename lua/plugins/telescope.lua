


local telescope_config = function()
    local actions        = require("telescope.actions")
    local action_state   = require "telescope.actions.state"
    local actions_layout = require("telescope.actions.layout")
    local module_key     = require("environment").module_key.telescope
    local action_key     = require("environment").module_key.telescope.action
    local lga_actions    = require("telescope-live-grep-args.actions")


    require("telescope").setup({
        defaults = {
            sorting_strategy = ascending,
            layout_strategy = "vertical",
            prompt_prefix   = " ",
            selection_caret = " ",
            entry_prefix    = "  ",
            winblend        = 5,
            path_display    = { "absoulte" },

            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--hidden",
                "--glob=!.git/",
            },

            preview = {
                msg_bg_fillchar = "╱",
                treesitter      = false,
                hide_on_startup = false,
                filesize_limit  = 10, -- MB
            },

            layout_config = {
                bottom_pane = {
                    height          = 25,
                    preview_cutoff  = 120,
                    prompt_position = "top"
                },
                center = {
                    height          = 0.4,
                    preview_cutoff  = 40,
                    prompt_position = "top",
                    width           = 0.5,
                },
                cursor = {
                    height         = 0.95,
                    width          = 0.95,
                    preview_cutoff = 40,
                },
                horizontal = {
                    height          = 0.95,
                    width           = 0.95,
                    preview_cutoff  = 50,
                    prompt_position = "bottom",
                },
                vertical = {
                    height          = 0.95,
                    width           = 0.95,
                    preview_cutoff  = 20,
                    prompt_position = "bottom",
                }
            },

            mappings = {
                i = {
                    -- ━━━━━━━━━━━━━━━━━❰ result scroll ❱━━━━━━━━━━━━━━━━━ --
                    [action_key.results_scrolling_up.lhs]   = actions.results_scrolling_up,
                    [action_key.results_scrolling_down.lhs] = actions.results_scrolling_down,

                    -- ━━━━━━━━━━━━━━━━━❰ selection scroll ❱━━━━━━━━━━━━━━━━━ --
                    [action_key.move_selection_next.lhs]    = actions.move_selection_next,
                    [action_key.move_selection_prev.lhs]    = actions.move_selection_previous,

                    -- ━━━━━━━━━━━━━━━━━❰ preview scroll ❱━━━━━━━━━━━━━━━━━ --
                    [action_key.toggle_preview.lhs]         = actions_layout.toggle_preview,
                    [action_key.preview_scrolling_down.lhs] = actions.preview_scrolling_down,
                    [action_key.preview_scrolling_up.lhs]   = actions.preview_scrolling_up,
                    [action_key.result_to_qflist.lhs]       = actions.smart_send_to_qflist + actions.open_qflist,
                    -- ["<ESC>"]                            = actions.close,
                    [action_key.select_default.lhs]         = actions.select_default + actions.center,
                },

                n = {
                    -- ━━━━━━━━━━━━━━━━━❰ result scroll ❱━━━━━━━━━━━━━━━━━ --
                    [action_key.results_scrolling_up.lhs]   = actions.results_scrolling_up,
                    [action_key.results_scrolling_down.lhs] = actions.results_scrolling_down,

                    -- ━━━━━━━━━━━━━━━━━❰ selection scroll ❱━━━━━━━━━━━━━━━━━ --
                    [action_key.move_selection_next.lhs]    = actions.move_selection_next,
                    [action_key.move_selection_prev.lhs]    = actions.move_selection_previous,

                    -- ━━━━━━━━━━━━━━━━━❰ preview scroll ❱━━━━━━━━━━━━━━━━━ --
                    [action_key.toggle_preview.lhs]         = actions_layout.toggle_preview,
                    [action_key.preview_scrolling_down.lhs] = actions.preview_scrolling_down,
                    [action_key.preview_scrolling_up.lhs]   = actions.preview_scrolling_up,
                    [action_key.result_to_qflist.lhs]       = actions.smart_send_to_qflist + actions.open_qflist,
                    [action_key.action_close.lhs]           = actions.close,
                    [action_key.select_default.lhs]         = actions.select_default + actions.center,
                },
            },
        },

        pickers = {
            find_files = {
                layout_strategy = "horizontal",
                preview = {
                    hide_on_startup = true,
                },
                find_command = {
                    "rg",
                    "--files",
                    "--glob=!.git/",
                },

                attach_mappings = function(_, map)
                    local actions = require "telescope.actions"
                    actions.select_default:replace(
                        function(prompt_bufnr)
                            local actions = require "telescope.actions"
                            local state = require "telescope.actions.state"
                            local picker = state.get_current_picker(prompt_bufnr)
                            local multi = picker:get_multi_selection()
                            local single = picker:get_selection()
                            local str = ""
                            if #multi > 0 then
                                for i,j in pairs(multi) do
                                    str = str.."edit "..j[1].." | "
                                end
                            end
                            str = str.."edit "..single[1]
                            -- To avoid populating qf or doing ":edit! file", close the prompt first
                            actions.close(prompt_bufnr)
                            vim.api.nvim_command(str)
                        end
                    )
                    return true
                end,
            },

            buffers = {
                sort_mru  = true,
                previewer = false,
                mappings = {
                    i = {
                        [action_key.delete_buffer.lhs] = actions.delete_buffer
                    },
                },
            },

            current_buffer_fuzzy_find = {
                preview = {
                    hide_on_startup = true,
                },
            },

            quickfix = {
                show_line   = false,
                trim_text   = false,
                fname_width = 100,
            },

        },

        extensions = {
            fzf = {
                fuzzy                   = true,  -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter    = true,  -- override the file sorter
                case_mode               = "smart_case", -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
            },

            ctags_outline = {
                --ctags option
                ctags = {"ctags"},
                --ctags filetype option
                ft_opt = {
                    vim = "--vim-kinds=fk",
                    lua = "--lua-kinds=fk",
                },
            },

            ctags_plus = {
                layout_strategy = "vertical",
                show_line       = false,
                trim_text       = true,
                fname_width     = 120,
            },

            live_grep_args = {
                -- enable/disable auto-quoting
                auto_quoting    = true,

                -- layout_strategy = "vertical",
                -- layout_config = {
                --     height = 0.95,
                --     width = 0.95,
                -- },

                -- override default mappings
                -- default_mappings = {},
                mappings = { -- extend mappings
                    i = {
                        ["<C-o>"] = lga_actions.quote_prompt(),
                        ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                    },
                }
            },
        },
    })


    require("telescope").load_extension("fzf")
    require("telescope").load_extension("ctags_outline")
    require("telescope").load_extension("ctags_plus")
    require("telescope").load_extension("live_grep_args")
end



local telescop_init = function()
    local keymap     = require("util.keymap")
    local module_key = require("environment").module_key.telescope

    local live_grep_args_word_under_cursor = function()
        local lga =  require('telescope').extensions.live_grep_args
        lga.live_grep_args({
            default_text = vim.fn.expand("<cword>")
        })
    end

    local ctags_jump = function()
        require("telescope").extensions.ctags_plus.jump_to_tag({
            show_line       = false,
            trim_text       = true,
            fname_width     = 120,
        })
    end

    local find_directory = function(directory)
        print(directory)
        require("telescope.builtin").find_files ({
            hidden = true,
            follow = false,
            cwd = directory,
            find_command = {
                "rg",
                "--files",
                "--glob=!.git/",
                directory
            },
        })
    end

    keymap("n", module_key.find_files.lhs          , "<cmd>Telescope find_files<CR>"                        , {desc = module_key.find_files.desc           })
    keymap("n", module_key.find_vim_config.lhs     , function() find_directory(vim.fn.stdpath("config")) end, {desc = module_key.find_vim_config.desc      })
    keymap("n", module_key.ctags_outline.lhs       , "<cmd>Telescope ctags_outline outline<CR>"             , {desc = module_key.ctags_outline.desc        })
    keymap("n", module_key.ctags_jump.lhs          , ctags_jump                                             , {desc = module_key.ctags_jump.desc           })
    keymap("n", module_key.help_tags.lhs           , "<cmd>Telescope help_tags<CR>"                         , {desc = module_key.help_tags.desc            })
    keymap("n", module_key.buffer_lines.lhs        , "<cmd>Telescope current_buffer_fuzzy_find<CR>"         , {desc = module_key.buffer_lines.desc         })
    keymap("n", module_key.buffer.lhs              , "<cmd>Telescope buffers<CR>"                           , {desc = module_key.buffer.desc               })
    keymap("n", module_key.live_grep_args_cword.lhs, live_grep_args_word_under_cursor                       , {desc = module_key.live_grep_args_cword.desc })
    keymap("n", module_key.live_grep_args.lhs      , "<cmd>Telescope live_grep_args<CR>"                    , {desc = module_key.live_grep_args.desc       })
    keymap("n", module_key.quickfix.lhs            , "<cmd>Telescope quickfix<CR>"                          , {desc = module_key.quickfix.desc             })
    keymap("n", module_key.resume.lhs              , "<cmd>Telescope resume<CR>"                            , {desc = module_key.resume.desc               })
    keymap("n", module_key.lsp_doc_symbols.lhs     , "<cmd>Telescope lsp_document_symbols<CR>"              , {desc = module_key.lsp_doc_symbols.desc      })
    keymap("n", module_key.lsp_references.lhs      , "<cmd>Telescope lsp_references<CR>"                    , {desc = module_key.lsp_references.desc       })
    keymap("n", module_key.lsp_definitions.lhs     , "<cmd>Telescope lsp_definitions<CR>"                   , {desc = module_key.lsp_definitions.desc      })
    keymap("n", module_key.lsp_type_definitions.lhs, "<cmd>Telescope lsp_type_definitions<CR>"              , {desc = module_key.lsp_type_definitions.desc })
end



return {
    -- ━━━━━━━━━━━━━━━━━❰ telescope ❱━━━━━━━━━━━━━━━━━ {{{
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        lazy = true,
        cmd = { "Telescope" },
        dependencies = {
            "nvim-lua/plenary.nvim",

            -- ━━━━━━━━━━━━━━━━━❰ telescope fzf native ❱━━━━━━━━━━━━━━━━━ {{{
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = function(plugin)
                    local env_var = require("environment").env_var

                    if env_var.is_windows then
                        return "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
                    end
                    return "make"
                end,
            },
            --- }}}

            -- ━━━━━━━━━━━━━━━━━❰ telescope ctags_outline ❱━━━━━━━━━━━━━━━━━ {{{
            "fcying/telescope-ctags-outline.nvim",
            --- }}}

            -- ━━━━━━━━━━━━━━━━━❰ telescope ctags_plus ❱━━━━━━━━━━━━━━━━━ {{{
            "gnfisher/nvim-telescope-ctags-plus",
            --- }}}

            -- ━━━━━━━━━━━━━━━━━❰ telescope live grep args ❱━━━━━━━━━━━━━━━━━ {{{
            "nvim-telescope/telescope-live-grep-args.nvim",
            --- }}}
        },

        init = telescop_init,

        config = telescope_config,

        enabled = true,
    },
    --- }}}
}
