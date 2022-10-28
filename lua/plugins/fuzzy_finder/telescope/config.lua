

local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    return
end

local actions = require('telescope.actions')
local actions_layout = require('telescope.actions.layout')

telescope.setup {

    defaults = {
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

        initial_mode       = "insert",
        selection_strategy = "reset",
        sorting_strategy   = "descending",
        layout_strategy    = "vertical",
        layout_config = {
            horizontal = {
                mirror          = false,
                prompt_position = "bottom",
                preview_width   = 0.5,
            },
            vertical = {
                mirror = false,
                preview_height = 0.5,
            },
            width = 0.95,
            height = 0.95,
            -- preview_cutoff = 120,
        },

        file_ignore_patterns = {
            "__pycache__/", "__pycache__/*",
            "build/",       "gradle/",  "node_modules/", "node_modules/*",
            "smalljre_*/*", "target/",  "vendor/*","venv/",
            ".dart_tool/",  ".git/",   ".github/", ".gradle/",      ".idea/",        ".vscode/",
            "%.sqlite3",    "%.ipynb", "%.lock",   "%.pdb",
            "%.dll",        "%.class", "%.exe",    "%.cache", "%.pdf",  "%.dylib",
            "%.jar",        "%.docx",  "%.met",    "%.burp",  "%.mp4",  "%.mkv", "%.rar",
            "%.zip",        "%.7z",    "%.tar",    "%.bz2",   "%.epub", "%.flac","%.tar.gz",
        },

        file_sorter            = require'telescope.sorters'.get_fuzzy_file,
        generic_sorter         = require'telescope.sorters'.get_generic_fuzzy_sorter,
        file_previewer         = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer         = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer       = require'telescope.previewers'.vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
        -- termopen_previewer     = require'telescope.previewers'.new_termopen_previewer,

        --get_command = function(entry, status)
            --    return { 'bat', "--number", entry.path }
            --end,

        prompt_prefix   = " ",
        selection_caret = " ",
        entry_prefix    = "  ",
        winblend        = 10,
        border          = {},
        borderchars     = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons  = true,
        use_less        = false,
        set_env         = {['COLORTERM'] = 'truecolor'}, -- default = nil,
        path_display    = {'truncate'}, -- How file paths are displayed ()

        preview = {
            msg_bg_fillchar = " ",
            treesitter      = false,
            hide_on_startup = false,
            filesize_limit  = 10, -- MB
        },

        mappings = {
            i = {
                -- ━━━━━━━━━━━━━━━━━❰ result scroll ❱━━━━━━━━━━━━━━━━━ --
                ["<C-d>"] = actions.results_scrolling_down,
                ["<C-u>"] = actions.results_scrolling_up,

                -- ━━━━━━━━━━━━━━━━━❰ selection scroll ❱━━━━━━━━━━━━━━━━━ --
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                -- ━━━━━━━━━━━━━━━━━❰ preview scroll ❱━━━━━━━━━━━━━━━━━ --
                ["<C-p>"] = actions_layout.toggle_preview,
                ["<C-f>"] = actions.preview_scrolling_up,
                ["<C-b>"] = actions.preview_scrolling_down,


                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                -- ["<ESC>"] = actions.close,
                ["<CR>"]  = actions.select_default + actions.center
            },
            n = {
                -- ━━━━━━━━━━━━━━━━━❰ result scroll ❱━━━━━━━━━━━━━━━━━ --
                ["<C-d>"] = actions.results_scrolling_down,
                ["<C-u>"] = actions.results_scrolling_up,

                -- ━━━━━━━━━━━━━━━━━❰ selection scroll ❱━━━━━━━━━━━━━━━━━ --
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                -- ━━━━━━━━━━━━━━━━━❰ preview scroll ❱━━━━━━━━━━━━━━━━━ --
                ["<C-p>"] = actions_layout.toggle_preview,
                ["<C-f>"] = actions.preview_scrolling_up,
                ["<C-b>"] = actions.preview_scrolling_down,

                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
            }
        },
    },
}
