return {
  'gbprod/yanky.nvim',
  enabled = true,
  dependencies = { 'folke/snacks.nvim' },

  opts = {
    ring = {
      storage = 'shada',
      history_length = 50,
    },

    system_clipboard = {
      sync_with_ring = false,
    },

    preserve_cursor_position = {
      enabled = true,
    },

    highlight = {
      on_put = true,
      on_yank = true,
      timer = 300,
    },

    picker = {
      select = {
        action = nil, -- nil to use default put action
      },
      telescope = {
        use_default_mappings = false, -- if default mappings should be used
        mappings = nil, -- nil to use default mappings
      },
    },
  },

  keys = {
    {
      '<leader>p',
      function()
        Snacks.picker.yanky()
      end,
      mode = { 'n', 'x' },
      desc = 'Open Yank History',
    },

    -- Yanky keymap
    { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = '' },
    { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = '' },
    { '<c-p>', '<Plug>(YankyPreviousEntry)', mode = { 'n', 'x' }, desc = '<yanky> Previous copy' },
    { '<c-n>', '<Plug>(YankyNextEntry)', mode = { 'n', 'x' }, desc = '<yanky> Next copy' },
    { 'gp', '<Plug>(YankyGPutAfter)', mode = { 'n' }, desc = '<yanky> ' },
    { 'gP', '<Plug>(YankyGPutBefore)', mode = { 'n' }, desc = '<yanky> ' },
  },
}
