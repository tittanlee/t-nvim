return {
  'folke/which-key.nvim',
  event = 'VeryLazy', -- Load after startup

  config = function()
    local wk = require('which-key')

    wk.setup({
      preset = 'modern', -- modern | classic | helix
      delay = 250,
      icons = {
        breadcrumb = '»',
        separator = '➜',
        group = '+',
      },
      win = {
        border = 'rounded',
        padding = { 1, 2 },
      },
    })

    ------------------------------------------------------------------
    -- Leader key groups
    ------------------------------------------------------------------
  end,
}
