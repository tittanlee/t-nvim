local km = require('config.keymaps.mini-align')
local K  = require('config.keymaps')

return {
  'echasnovski/mini.align',
  version = false,

  -- Lazy load when entering visual mode, as alignment is usually done on selections
  event = 'VeryLazy',

  config = function()
    require('mini.align').setup({
      mappings = {
        start              = K.key(km.align, 'start'),
        start_with_preview = K.key(km.align, 'preview'),
      },
    })
  end,
}
