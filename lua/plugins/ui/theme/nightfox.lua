return {
  'EdenEast/nightfox.nvim',
  priority = 1000, -- Ensure the colorscheme loads before UI plugins

  -- Enable this plugin only when the active colorscheme is a Nightfox variant
  enabled = function()
    local env = require('environment')
    return env.color_scheme:match('fox$') ~= nil
  end,

  config = function()
    local env = require('environment')

    require('nightfox').setup({
      options = {
        -- Global style options
        transparent = false,
        dim_inactive = false,
        terminal_colors = true,

        -- Syntax styles
        styles = {
          comments = 'italic',
          keywords = 'bold',
          functions = 'NONE',
          variables = 'NONE',
          types = 'italic,bold',
        },

        -- Plugin integrations (enable only what you actually use)
        modules = {
          native_lsp = { enable = true },
          treesitter = true,
          cmp = true,
          gitsigns = true,
          whichkey = true,
        },
      },

      -- Palette and spec overrides (optional)
      palettes = {},
      specs = {},

      -- Highlight overrides
      groups = {
        all = {
          -- Folder icons (fix missing or invisible directory icons)
          DevIconFolder = { fg = 'palette.blue' },
          DevIconFolderOpen = { fg = 'palette.blue' },

          -- Floating windows
          NormalFloat = { bg = 'bg1' },
          FloatBorder = { fg = 'fg3', bg = 'bg1' },

          -- Directory highlight (extra safety)
          Directory = { fg = 'palette.blue' },

          -- Example Snacks-specific overrides (optional)
          -- SnacksExplorerNormal = { bg = "bg0" },
          -- SnacksExplorerBorder = { fg = "fg3", bg = "bg0" },
        },
      },
    })

    -- Apply the selected Nightfox variant
    vim.cmd.colorscheme(env.color_scheme)
  end,
}
