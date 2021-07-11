

local status_ok, actions = pcall(require, "telescope.actions")
if not status_ok then
    return
end


require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        prompt_prefix = "🔍  ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "bottom",
                preview_width = 0.4,
                results_width = 0.6
            },
            vertical = {
                mirror = false
            },
            width = 0.95,
            height = 0.9,
            preview_cutoff = 120
        },
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 15,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        -- path_display = { },
        -- set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,

        mappings = {
            i = {
                ["<C-c>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                -- ["<CR>"] = actions.select_default + actions.center,
                -- To disable a keymap, put [map] = false
                -- So, to not map "<C-n>", just put
                -- ["<c-t>"] = trouble.open_with_trouble,
                -- ["<c-x>"] = false,
                -- ["<ESC>"] = actions.close,
                -- Otherwise, just set the mapping to the function that you want it to be.
                -- ["<C-i>"] = actions.select_horizontal,
                -- Add up multiple actions
                -- You can perform as many actions in a row as you like
                -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                -- ["<c-t>"] = trouble.open_with_trouble,
                -- ["<C-i>"] = my_cool_custom_action,
            },
        },
    },

    pickers = {
        find_files = {
            previewer = false,
            -- opts = {
            --     find_command = "rg --files --hidden",
            --     hidden = true,
            --     follow = true,
            -- },
        },

        buffers = {
            previewer = false,
            sort_lastused = true,
            selection_strategy = "closest",
            mappings = {
                i = { ["<c-d>"] = actions.delete_buffer },
            }
        },

        file_browser = {
            previewer = false,
            sorting_strategy = "ascending",
            mappings = {
                i = {
                    ["<C-h>"] = actions.move_to_middle,
                    ["<C-o>"] = actions.select_default + actions.center,
                    ["-"] = actions.move_to_top + actions.select_default + actions.center,
                },
                n = {
                    ["<C-h>"] = actions.move_to_middle,
                    ["<C-o>"] = actions.select_default + actions.center,
                    ["-"] = actions.move_to_top + actions.select_default + actions.center,
                },
            },

        },

        lsp_references = { shorten_path = true },
        lsp_document_symbols = { symbol_width = 1, shorten_path = true },
        lsp_workspace_symbols = { shorten_path = true },
        lsp_code_actions = { theme = "dropdown" },
        current_buffer_fuzzy_find = { theme = "dropdown", previewer = false },
    },
}

