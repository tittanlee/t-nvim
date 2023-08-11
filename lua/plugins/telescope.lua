

local env_var = require("environment").env_var

local telescope_config = function()
    local actions        = require("telescope.actions")
    local actions_layout = require("telescope.actions.layout")
    local module_key     = require("environment").module_key.telescope
    local action_key     = require("environment").module_key.telescope.action

    require("telescope").setup({
        defaults = {

            sorting_strategy = ascending,
            layout_strategy = "vertical",
            prompt_prefix   = " ",
            selection_caret = " ",
            entry_prefix    = "  ",
            winblend        = 10,
            path_display    = { "absoulte" },

            vimgrep_arguments = {
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
                    [action_key.select_default.lhs]         = actions.select_default + actions.center
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
            },

            buffers = {
                sort_mru  = true,
                theme     = "dropdown",
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

                layout_strategy = "vertical",

                -- override default mappings
                -- default_mappings = {},
                mappings = { -- extend mappings
                    i = {},
                    n = {},
                }
            },
        },
    })
end

local telescop_init = function()
    local keymap = require("util.keymap")
    local module_key = require("environment").module_key.telescope

    keymap("n", module_key.find_file.lhs    , "<cmd>Telescope find_files<cr>"               , {desc = module_key.find_file.desc     })
    keymap("n", module_key.ctags_outline.lhs, "<cmd>Telescope ctags_outline outline<cr>"    , {desc = module_key.ctags_outline.desc })
    keymap("n", module_key.help_tags.lhs    , "<cmd>Telescope help_tags<cr>"                , {desc = module_key.help_tags.desc     })
    keymap("n", module_key.buffer_lines.lhs , "<cmd>Telescope current_buffer_fuzzy_find<cr>", {desc = module_key.buffer_lines.desc  })
    keymap("n", module_key.buffer.lhs       , "<cmd>Telescope buffers<cr>"                  , {desc = module_key.buffer.desc        })
end




return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",

            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = function(plugin)
                    if env_var.is_windows then
                        return "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
                    end
                    return "make"
                end,
                config = function()
                    -- To get fzf loaded and working with telescope, you need to call
                    -- load_extension, somewhere after setup function:
                    require("telescope").load_extension("fzf")
                end,
            },

            {
                "fcying/telescope-ctags-outline.nvim",
                config = function()
                    require("telescope").load_extension("ctags_outline")
                end,
            },

            {
                "gnfisher/nvim-telescope-ctags-plus",
                config = function()
                    require("telescope").load_extension("ctags_plus")
                end,
            },

        },
        cmd     = { "Telescope" },
        init    = telescop_init,
        config  = telescope_config,
        enabled = true,
    },
}
