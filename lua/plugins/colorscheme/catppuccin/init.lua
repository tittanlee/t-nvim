

local env_var = require("environment").variable
local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
    return
end

if env_var.colorscheme ~= "catppuccin" then
    return
end



catppuccin.setup({
    compile_path = require("environment").std_path.cache .. "/catppuccin",
    transparent_background = false,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    styles = {
        comments     = { "bold" },
        conditionals = { "italic" },
        loops        = {},
        functions    = {},
        keywords     = {},
        strings      = {},
        variables    = {},
        numbers      = {},
        booleans     = {},
        properties   = {},
        types        = {},
        operators    = {},
    },
    integrations = {
        aerial     = true,
        cmp        = true,
        gitsigns   = true,
        hop        = true,
        nvimtree   = true,
        telescope  = true,
        treesitter = true,

        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },

        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
    color_overrides   = {},
    custom_highlights = {},
})

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd[[colorscheme catppuccin]]
