
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local env_var = require("environment").variable


lualine.setup {
    options = {
        icons_enabled        = true,
        theme                = env_var.lualine_theme,
        component_separators = { left = "", right = ""},
        section_separators   = { left = "", right = ""},
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
        lualine_x = {"searchcount","encoding", "fileformat", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
    },

    tabline         = {},
    winbar          = {},
    inactive_winbar = {},
    extensions      = {
        "quickfix",
        "nvim-tree",
        "fzf",
    }
}
