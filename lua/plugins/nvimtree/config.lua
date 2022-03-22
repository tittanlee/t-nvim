

local g = vim.g
local tree_cb = require "nvim-tree.config".nvim_tree_callback


-- g.nvim_tree_ignore                 = {".repo", ".git", "node_modules", ".cache"}
-- g.nvim_tree_auto_ignore_ft         = {"dashboard"} -- don't open tree on specific fiypes.
-- g.nvim_tree_indent_markers         = 1
-- g.nvim_tree_git_hl                 = 1
-- g.nvim_tree_highlight_opened_files = 1
-- g.nvim_tree_root_folder_modifier   = ":t"
-- g.nvim_tree_allow_resize           = 1
-- g.nvim_tree_add_trailing           = 0 -- append a trailing slash to folder names


g.nvim_tree_show_icons = {
    git     = 0,
    folders = 1,
    files   = 1,
    folder_arrows= 1
}
g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged  = "✗",
        staged    = "✓",
        unmerged  = "",
        renamed   = "➜",
        untracked = "★",
        deleted   = "",
        ignored   = "◌"
    },

    folder = {
        -- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the arrow icons in front ofthe default and opened folders below!
        arrow_open   = "",
        arrow_closed = "",
        default      = "",
        open         = "",
        empty        = "",
        empty_open   = "",
        symlink      = "",
        symlink_open = ""
    },

    lsp = {
        hint    = "",
        info    = "",
        warning = "",
        error   = "",
    }
}

require'nvim-tree'.setup {
    disable_netrw      = true,
    hijack_netrw       = false,
    open_on_setup      = false,
    ignore_ft_on_setup = {'dashboard'},
    auto_open          = false,
    auto_close         = false,
    open_on_tab        = false,
    hijack_cursor      = true,
    update_cwd         = false,
    follow             = true,
    tab_open           = false,
    sort_by            = "name",
    auto_reload_on_write = true,

    diagnostics         = {
        enable = false,
        icons  = { hint = "", info = "", warning = "", error = "" }
    },

    update_focused_file = {
        enable      = true,
        update_cwd  = true,
        ignore_list = {}
    },

    system_open = {
        cmd  = nil,
        args = {}
    },

    view = {
        width = '20%',
        side = 'left',
        auto_resize = false,
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {}
        }
    },

    ignore_ft_on_setup = {
        "dashboard",
    },

    actions = {
        change_dir = {
            enable = true,
            global = false,
        },
        open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },

    filters = {
        dotfiles = false,
        custom = {},
        exclude = {},
    },

    git = {
        enable = false,
        ignore = true,
        timeout = 400,
    },

    bindings = {
        {key = {"<CR>"          , "o", "<2-LeftMouse>"}   ,cb = tree_cb("edit")},
        {key = {"<2-RightMouse>", "<C-}>"             }   ,cb = tree_cb("cd")},
        {key = "<C-v>"          ,                          cb = tree_cb("vsplit")}            ,
        {key = "<C-x>"          ,                          cb = tree_cb("split")}             ,
        {key = "<C-t>"          ,                          cb = tree_cb("tabnew")}            ,
        {key = "<"              ,                          cb = tree_cb("prev_sibling")}      ,
        {key = ">"              ,                          cb = tree_cb("next_sibling")}      ,
        {key = "P"              ,                          cb = tree_cb("parent_node")}       ,
        {key = "<BS>"           ,                          cb = tree_cb("close_node")}        ,
        {key = "<S-CR>"         ,                          cb = tree_cb("close_node")}        ,
        {key = "<Tab>"          ,                          cb = tree_cb("preview")}           ,
        {key = "K"              ,                          cb = tree_cb("first_sibling")}     ,
        {key = "J"              ,                          cb = tree_cb("last_sibling")}      ,
        {key = "I"              ,                          cb = tree_cb("toggle_ignored")}    ,
        {key = "H"              ,                          cb = tree_cb("toggle_dotfiles")}   ,
        {key = "R"              ,                          cb = tree_cb("refresh")}           ,
        {key = "a"              ,                          cb = tree_cb("create")}            ,
        {key = "d"              ,                          cb = tree_cb("remove")}            ,
        {key = "r"              ,                          cb = tree_cb("rename")}            ,
        {key = "<C->"           ,                          cb = tree_cb("full_rename")}       ,
        {key = "x"              ,                          cb = tree_cb("cut")}               ,
        {key = "c"              ,                          cb = tree_cb("copy")}              ,
        {key = "p"              ,                          cb = tree_cb("paste")}             ,
        {key = "y"              ,                          cb = tree_cb("copy_name")}         ,
        {key = "Y"              ,                          cb = tree_cb("copy_path")}         ,
        {key = "gy"             ,                          cb = tree_cb("copy_absolute_path")},
        {key = "[c"             ,                          cb = tree_cb("prev_git_item")}     ,
        {key = "}c"             ,                          cb = tree_cb("next_git_item")}     ,
        {key = "-"              ,                          cb = tree_cb("dir_up")}            ,
        {key = "q"              ,                          cb = tree_cb("close")}             ,
        {key = "?"              ,                          cb = tree_cb("toggle_help")}
    }
}
