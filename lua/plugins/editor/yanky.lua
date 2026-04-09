local km = require('config.keymaps.yanky')

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
      km.history.key,
      function() Snacks.picker.yanky() end,
      mode = km.history.mode,
      desc = km.history.desc,
    },
    { km.put_after.key,   '<Plug>(YankyPutAfter)',      mode = km.put_after.mode,   desc = km.put_after.desc   },
    { km.put_before.key,  '<Plug>(YankyPutBefore)',     mode = km.put_before.mode,  desc = km.put_before.desc  },
    { km.prev.key,        '<Plug>(YankyPreviousEntry)', mode = km.prev.mode,        desc = km.prev.desc        },
    { km.next.key,        '<Plug>(YankyNextEntry)',      mode = km.next.mode,        desc = km.next.desc        },
    { km.gput_after.key,  '<Plug>(YankyGPutAfter)',     mode = km.gput_after.mode,  desc = km.gput_after.desc  },
    { km.gput_before.key, '<Plug>(YankyGPutBefore)',    mode = km.gput_before.mode, desc = km.gput_before.desc },
  },
}
