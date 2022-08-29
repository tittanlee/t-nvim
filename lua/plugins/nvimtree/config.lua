

local g = vim.g


require'nvim-tree'.setup {
    auto_reload_on_write         = true,
    disable_netrw                = true,
    hijack_netrw                 = false,
    open_on_setup                = false,
    ignore_ft_on_setup           = {'dashboard'},
    open_on_tab                  = false,
    hijack_cursor                = true,
    update_cwd                   = false,
    sort_by                      = "name",

    diagnostics                  = {
        enable                   = false,
        icons                    = { hint = "", info = "", warning = "", error = "" }
    },

    update_focused_file          = {
        enable                   = false,
        update_cwd               = false,
        ignore_list              = {}
    },

    system_open                  = {
        cmd                      = nil,
        args                     = {}
    },

    hijack_directories           = {
        enable                   = true,
        auto_open                = true,
    },

    view                         = {
        width                    = '20%',
        side                     = 'left',
        signcolumn               = "yes",
        relativenumber           = true,
        hide_root_folder         = false,
        number                   = false,
        relativenumber           = false,
        mappings                 = {
            custom_only          = false,
            list                 = {},
        }
    },

    renderer                     = {
        add_trailing             = false,
        group_empty              = false,
        highlight_git            = false,
        full_name                = false,
        highlight_opened_files   = "none",
        root_folder_modifier     = ":~",
        indent_markers           = {
            enable               = false,
            inline_arrows        = true,
            icons                = {
                corner           = "└",
                edge             = "│",
                item             = "│",
                none             = " ",
            },
        },
        icons                    = {
            webdev_colors        = true,
            git_placement        = "before",
            padding              = " ",
            symlink_arrow        = " ➛ ",
            show                 = {
                file             = true,
                folder           = true,
                folder_arrow     = true,
                git              = true,
            },
            glyphs               = {
                default          = "",
                symlink          = "",
                bookmark         = "",
                folder           = {
                    arrow_closed = "",
                    arrow_open   = "",
                    default      = "",
                    open         = "",
                    empty        = "",
                    empty_open   = "",
                    symlink      = "",
                    symlink_open = "",
                },
                git              = {
                    unstaged     = "✗",
                    staged       = "✓",
                    unmerged     = "",
                    renamed      = "➜",
                    untracked    = "★",
                    deleted      = "",
                    ignored      = "◌",
                },
            },
        },
        special_files            = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        symlink_destination      = true,
    },

    ignore_ft_on_setup           = {
        "dashboard",
    },

    actions                      = {
        change_dir               = {
            enable               = false,
            global               = false,
        },
        open_file                = {
            quit_on_open         = false,
            resize_window        = false,
            window_picker        = {
                enable           = true,
                chars            = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude          = {
                    filetype     = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype      = { "nofile", "terminal", "help" },
                },
            },
        },
    },

    filters                      = {
        dotfiles                 = false,
        custom                   = {},
        exclude                  = {},
    },

    git                          = {
        enable                   = false,
        ignore                   = true,
        timeout                  = 400,
    },
}
