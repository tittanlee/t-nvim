

local keymap = require("util.keymap")
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
            folder_open = "",
            -- folder_empty = "󰜌",
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
                ["w"] = "open_with_window_picker",
                --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
                ["C"] = "close_node",
                -- ['C'] = 'close_all_subnodes',
                ["z"] = "close_all_nodes",
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
                    ["bd"] = "buffer_delete",
                    ["<bs>"] = "navigate_up",
                    ["."] = "set_root",
                }
            },
        },

    })
    -- }}}


    -- keymap binding {{{
    keymap("n", module_key.toggle.lhs, "<cmd>Neotree toggle<CR>", { desc = module_key.toggle.desc })
    keymap("n", module_key.reveal.lhs, "<cmd>Neotree reveal<CR>", { desc = module_key.reveal.desc })
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

        config = neo_tree_config,

        enabled = true,
    },
}
