
lualine_config = function()
    local env_var    = require("environment").env_var
    local treesitter = require("config.lualine.treesitter")
    local gutentags  = require("config.lualine.gutentags")

    require("lualine").setup {
        options = {
            icons_enabled = true,
            theme = env_var.lualine_theme,
            component_separators = { left = "", right = ""},
            section_separators   = { left = "", right = ""},
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline    = 1000,
                winbar     = 1000,
            }
        },
        sections = {
            lualine_a = {
                "mode"
            },

            lualine_b = {
                "branch",
                { "diff", source = diff },
            },

            lualine_c = {
                {
                    treesitter.current_context
                },
            },

            lualine_x = {
                {
                    gutentags.progress,
                    cond = function ()
                        return vim.fn.exists("vim.fn['gutentags#inprogress']")
                    end,
                    draw_empty = false,

                },
                {
                    "encoding",
                },
                {
                    "fileformat",
                    symbols = {
                        unix = '', -- e712
                        dos  = '', -- e70f
                        mac  = '', -- e711
                    },
                },
                {
                    "filetype",
                    colored = true,
                },
            },

            lualine_y = {
                {
                    "searchcount",
                    maxcount = 9999,
                    timeout = 500,
                },
                "progress",
            },

            lualine_z = {
                "location"
            }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {"filename"},
            lualine_x = {"location"},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {
            -- 0: Just the filename
            -- 1: Relative path
            -- 2: Absolute path
            -- 3: Absolute path, with tilde as the home directory
            -- 4: Filename and parent dir, with tilde as the home directory
            lualine_a = {
                {"filename", path = 3}
            },

            lualine_z = {
            },
        },
        inactive_winbar = {},
        extensions = {
            "quickfix",
            "fugitive",
            "nvim-tree",
            "neo-tree",
            "toggleterm",
            "fzf",
            "lazy",
        },
    }
end



return {
    {
        "nvim-lualine/lualine.nvim",
        config = lualine_config,
    },

}

