
local env_var = require("environment").env_var



local onedark_config = function()
    local status_ok, onedark = pcall(require, "onedark")
    if not status_ok then
        return
    end

    onedark.setup  {
        -- Main options --
        style                = "darker", -- Default theme style. Choose between "dark", "darker", "cool", "deep", "warm", "warmer" and "light"
        transparent          = false,  -- Show/hide background
        term_colors          = true, -- Change terminal color as per the selected theme style
        ending_tildes        = false, -- Show the end-of-buffer tildes. By default they are hidden
        cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

        -- toggle theme style ---
        toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = {"dark", "darker", "cool", "deep", "warm", "warmer", "light"}, -- List of styles to toggle between

        -- Change code style ---
        -- Options are italic, bold, underline, none
        -- You can configure multiple style with comma seperated, For e.g., keywords = "italic,bold"
        code_style = {
            comments  = "italic",
            keywords  = "none",
            functions = "none",
            strings   = "none",
            variables = "none"
        },

        -- Lualine options --
        lualine = {
            transparent = false, -- lualine center bar transparency
        },

        -- Custom Highlights --
        colors = {}, -- Override default colors
        highlights = {}, -- Override highlight groups

        -- Plugins Config --
        diagnostics = {
            darker     = true, -- darker colors for diagnostic
            undercurl  = true,   -- use undercurl instead of underline for diagnostics
            background = true,    -- use background color for virtual text
        },
    }

    onedark.load()
end



local catppuccin_config = function()
    local status_ok, catppuccin = pcall(require, "catppuccin")
    if not status_ok then
        return
    end

    catppuccin.setup({
        -- latte, frappe, macchiato, mocha
        flavour = "macchiato", 
        background = {
            light = "latte",
            dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the "~" characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
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
            bufferline = true,

            indent_blankline = {
                enabled = true,
                colored_indent_levels = false,
            },

            -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
        color_overrides   = {},
        custom_highlights = {},
    })

    -- setup must be called before loading
    vim.cmd.colorscheme "catppuccin"
end


local tokyonight_config = function()
    local status_ok, tokyonight = pcall(require, "tokyonight")
    if not status_ok then
        return
    end

    tokyonight.setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style                    = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        light_style              = "night", -- The theme is used when the background is set to light
        transparent              = false, -- Enable this to disable setting the background color
        terminal_colors          = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles                   = {
            -- Style to be applied to different syntax groups
            -- Value is any valid attr-list value for `:help nvim_set_hl`
            keywords             = { italic = true, },
            comments             = { italic = false, },
            functions            = {},
            variables            = {},
            -- Background styles. Can be "dark", "transparent" or "normal"
            sidebars             = "dark", -- style for sidebars, see below
            floats               = "dark", -- style for floating windows
        },

        -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        sidebars                 = { "qf", "vista_kind", "terminal", "packer", "NvimTree" },
        day_brightness           = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive             = true, -- dims inactive windows
        lualine_bold             = false, -- When `true`, section headers in the lualine theme will be bold

        --- You can override specific color groups to use other groups or a hex color
        --- function will be called with a ColorScheme table
        ---@param colors ColorScheme
        on_colors                = function(colors) end,

        --- You can override specific highlights to use other groups or a hex color
        --- function will be called with a Highlights and ColorScheme table
        ---@param highlights Highlights
        ---@param colors ColorScheme
        on_highlights            = function(highlights, colors) end,
    })

    vim.cmd.colorscheme "tokyonight"
end


local dracula_config = function()
    local status_ok, dracula = pcall(require, "dracula")
    if not status_ok then
        return
    end

    dracula.setup ({
        -- customize dracula color palette
        colors = {
            bg             = "#282A36",
            fg             = "#F8F8F2",
            selection      = "#44475A",
            comment        = "#6272A4",
            red            = "#FF5555",
            orange         = "#FFB86C",
            yellow         = "#F1FA8C",
            green          = "#50fa7b",
            purple         = "#BD93F9",
            cyan           = "#8BE9FD",
            pink           = "#FF79C6",
            bright_red     = "#FF6E6E",
            bright_green   = "#69FF94",
            bright_yellow  = "#FFFFA5",
            bright_blue    = "#D6ACFF",
            bright_magenta = "#FF92DF",
            bright_cyan    = "#A4FFFF",
            bright_white   = "#FFFFFF",
            menu           = "#21222C",
            visual         = "#3E4452",
            gutter_fg      = "#4B5263",
            nontext        = "#3B4048",
        },
        -- show the "~" characters after the end of buffers
        show_end_of_buffer = true, -- default false
        -- use transparent background
        transparent_bg     = true, -- default false
        -- set custom lualine background color
        lualine_bg_color   = "#44475a", -- default nil
        -- set italic comment
        italic_comment     = true, -- default false
        -- overrides the default highlights see `:h synIDattr`
        overrides = {
            -- Examples
            -- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
            -- NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
            -- Nothing = {} -- clear highlight of Nothing
        },
    })

    dracula.load()
end

local edge_config = function()
    vim.g.edge_style                  = "aura"
    vim.g.edge_enable_italic          = 1
    vim.g.edge_disable_italic_comment = 1
    vim.g.edge_show_eob               = 1
    vim.g.edge_better_performance     = 1
    vim.g.edge_transparent_background = 0

    vim.cmd.colorscheme "edge"
end

return {
    {
        "navarasu/onedark.nvim",
        config = onedark_config,
        enabled = env_var.color_scheme == "onedark"
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = catppuccin_config,
        enabled = env_var.color_scheme == "catppuccin"
    },

    {
        "folke/tokyonight.nvim",
        config = tokyonight_config,
        enabled = env_var.color_scheme == "tokyonight"
    },

    {
        "Mofiqul/dracula.nvim",
        config = dracula_config,
        enabled = env_var.color_scheme == "dracula"
    },

    {
        "sainnhe/edge",
        config = edge_config,
        enabled = env_var.color_scheme == "edge"
    },
}
