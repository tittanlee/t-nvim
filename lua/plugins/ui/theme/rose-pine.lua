return {
  'rose-pine/neovim',
  enabled = function()
    return require('environment').color_scheme == 'rose-pine'
  end,

  name = 'rose-pine',
  priority = 1000, -- Ensure it loads before other UI plugins

  config = function()
    require('rose-pine').setup({
      ------------------------------------------------------------------
      -- Theme variant
      ------------------------------------------------------------------
      variant = 'main', -- main | moon | dawn

      ------------------------------------------------------------------
      -- Reduce visual noise
      ------------------------------------------------------------------
      disable_background = false,
      disable_float_background = false,
      disable_italics = true,

      ------------------------------------------------------------------
      -- Style choices focused on readability
      ------------------------------------------------------------------
      styles = {
        bold = true,
        italic = false,
        transparency = false,
      },

      ------------------------------------------------------------------
      -- Improve contrast for UI components
      ------------------------------------------------------------------
      highlight_groups = {
        -- Flash.nvim
        FlashLabel = { fg = 'love', bold = true },
        FlashBackdrop = { fg = 'muted' },

        -- Blink / completion
        PmenuSel = { bg = 'overlay', fg = 'text', bold = true },
        Pmenu = { bg = 'base' },

        -- Diagnostics
        DiagnosticError = { fg = 'love' },
        DiagnosticWarn = { fg = 'gold' },
        DiagnosticInfo = { fg = 'foam' },
        DiagnosticHint = { fg = 'iris' },

        -- Cursor line
        CursorLine = { bg = 'surface' },
      },
    })

    --------------------------------------------------------------------
    -- Apply colorscheme
    --------------------------------------------------------------------
    vim.cmd('colorscheme rose-pine')
  end,
}
