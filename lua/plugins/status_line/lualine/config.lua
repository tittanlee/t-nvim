
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local env_var = require("environment").variable
local gutentags = require("plugins.status_line.lualine.provider.gutentags")


lualine.setup {
    options = {
        icons_enabled        = true,
        theme                = env_var.lualine_theme,
        -- component_separators = { left = "", right = ""},
        -- section_separators   = { left = "", right = ""},

        component_separators = { left = "", right = ""},
        section_separators   = { left = "", right = ""},

        ignore_focus         = {},
        always_divide_middle = true,
        globalstatus         = false,
        disabled_filetypes   = {
            statusline = {},
            winbar     = {},
        },
        refresh = {
            statusline = 1000,
            tabline    = 1000,
            winbar     = 1000,
        }
    },

    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = {"filename"},
        lualine_x = {"searchcount", gutentags.component_opts()},
        lualine_y = {"encoding", "fileformat", "filetype", "progress",},
        lualine_z = { "location"}
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
    },

    tabline         = {},

    winbar          = {
        lualine_a = {"%=", {"filename", path = 3}},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },

    inactive_winbar = {},
    extensions      = {
        "quickfix",
        "nvim-tree",
        "fzf",
    }
}
