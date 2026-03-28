return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000, -- Load the theme first to prevent flickering
  enabled = function()
    return require('environment').color_scheme == 'catppuccin'
  end,
  config = function()
    require('catppuccin').setup({
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      transparent_background = false, -- Set to true if you want to see your desktop wallpaper
      show_end_of_buffer = false, -- Hide the '~' characters at the end of the buffer
      term_colors = true, -- Enable terminal colors integration

      background = {
        light = 'latte',
        dark = 'mocha',
      },

      integrations = {
        treesitter = true, -- Better syntax highlighting for C/Python
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { 'italic' },
            hints = { 'italic' },
            warnings = { 'italic' },
            information = { 'italic' },
          },
        },
        telescope = { enabled = true }, -- Themed search UI
        mason = true, -- Themed LSP manager UI
        indent_blankline = {
          enabled = true,
          scope_color = 'lavender', -- Color of the active indent guide
        },
      },
    })

    -- Set the colorscheme immediately after setup
    vim.cmd.colorscheme('catppuccin')
  end,
}
