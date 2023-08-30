

local module_key = require("environment").module_key.neo_tree


local neo_tree_config = function()

    -- neo-tree setup {{{
    require("neo-tree").setup({

        close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
        -- popup_border_style   = "rounded",
        enable_git_status    = false,
        enable_diagnostics   = false,

        indent = {
            indent_size        = 2,
            padding            = 1, -- extra padding on left hand side
            -- indent guides
            with_markers       = true,
            indent_marker      = "│",
            last_indent_marker = "└",
            highlight          = "NeoTreeIndentMarker",
            -- expander config, needed for nesting files
            with_expanders     = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded  = "",
            expander_highlight = "NeoTreeExpander",
        },

        source_selector = {
            winbar = false,
            statusline = false,
        },

        icon = {
            folder_closed = "",
            folder_open   = "",
            folder_empty  = "",
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            default = "*",
            highlight = "NeoTreeFileIcon"
        },

        window = {
            position = "left",
            width = 40,
            mapping_options = {
                noremap = true,
                nowait = true,
            },

            mappings = {
                ["<space>"] = {
                    "toggle_node",
                    nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
                },
                ["<2-LeftMouse>"] = "open",
                ["<cr>"] = "open",
                ["<esc>"] = "cancel", -- close preview or floating neo-tree window
                ["P"] = { "toggle_preview", config = { use_float = true } },
                ["l"] = "focus_preview",
                ["<C-s>"] = "open_split",
                ["<C-v>"] = "open_vsplit",
                -- ["S"] = "split_with_window_picker",
                -- ["s"] = "vsplit_with_window_picker",
                ["t"] = "open_tabnew",
                -- ["<cr>"] = "open_drop",
                -- ["t"] = "open_tab_drop",
                -- ["w"] = "open_with_window_picker",
                ["w"] = "none",
                --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
                ["C"] = "close_node",
                -- ['C'] = 'close_all_subnodes',
                ["z"] = "none",
                --["Z"] = "expand_all_nodes",
                ["a"] = {
                    "add",
                    -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
                    -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                    config = {
                        show_path = "none" -- "none", "relative", "absolute"
                    }
                },
                ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
                ["d"] = "delete",
                ["r"] = "rename",
                ["y"] = "copy_to_clipboard",
                ["x"] = "cut_to_clipboard",
                ["p"] = "paste_from_clipboard",
                ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
                -- ["c"] = {
                --  "copy",
                --  config = {
                --    show_path = "none" -- "none", "relative", "absolute"
                --  }
                --}
                ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
                ["o"] = "open", -- takes text input for destination, also accepts the optional config.show_path option like "add".
                ["q"] = "close_window",
                ["R"] = "refresh",
                ["?"] = "show_help",
                ["<"] = "prev_source",
                [">"] = "next_source",
            }
        },

        filesystem = {
            filtered_items = {
                visible = false, -- when true, they will just be displayed differently than normal items
                hide_dotfiles = false,
                hide_gitignored = true,
                hide_hidden = false, -- only works on Windows for hidden files/directories
                hide_by_name = {
                    --"node_modules"
                },
                hide_by_pattern = { -- uses glob style patterns
                    --"*.meta",
                    --"*/src/*/tsconfig.json",
                },
                always_show = { -- remains visible even if other settings would normally hide it
                    --".gitignored",
                },
                never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                    --".DS_Store",
                    --"thumbs.db"
                },
                never_show_by_pattern = { -- uses glob style patterns
                    --".null-ls_*",
                },
            },
            follow_current_file = {
                enabled = false, -- This will find and focus the file in the active buffer every time
                --               -- the current file is changed while the tree is open.
                leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
            group_empty_dirs = false, -- when true, empty folders will be grouped together
            hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
            -- in whatever position is specified in window.position
            -- "open_current",  -- netrw disabled, opening a directory opens within the
            -- window like netrw would, regardless of window.position
            -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
            use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
            -- instead of relying on nvim autocmd events.
            window = {
                mappings = {
                    ["<bs>"] = "navigate_up",
                    ["."] = "set_root",
                    ["H"] = "toggle_hidden",
                    ["/"] = "fuzzy_finder",
                    ["D"] = "fuzzy_finder_directory",
                    ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
                    -- ["D"] = "fuzzy_sorter_directory",
                    ["f"] = "filter_on_submit",
                    ["<c-x>"] = "clear_filter",
                    ["[g"] = "prev_git_modified",
                    ["]g"] = "next_git_modified",
                },
                fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
                    ["<down>"] = "move_cursor_down",
                    ["<C-n>"] = "move_cursor_down",
                    ["<up>"] = "move_cursor_up",
                    ["<C-p>"] = "move_cursor_up",
                },
            },

            commands = {} -- Add a custom command or override a global one using the same function name
        },

        buffers = {
            follow_current_file = {
                enabled = true, -- This will find and focus the file in the active buffer every time
                --              -- the current file is changed while the tree is open.
                leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
            group_empty_dirs = true, -- when true, empty folders will be grouped together
            show_unloaded = true,
            window = {
                mappings = {
                    ["bd"]   = "buffer_delete",
                    ["<bs>"] = "navigate_up",
                    ["."]    = "set_root",
                }
            },
        },

    })
    -- }}}

end




return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },

        keys = {
            { module_key.toggle.lhs, "<cmd>Neotree toggle<CR>", { desc = module_key.toggle.desc, mode = "n" }},
            { module_key.reveal.lhs, "<cmd>Neotree reveal<CR>", { desc = module_key.reveal.desc, mode = "n" }},
        },

        config = neo_tree_config,
        enabled = true,
    },
}
