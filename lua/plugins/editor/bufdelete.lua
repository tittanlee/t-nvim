local km = require('config.keymaps.bufdelete')

return {
  'famiu/bufdelete.nvim',
  enabled = false,

  keys = {
    { km.delete.key, '<cmd>Bdelete<cr>', desc = km.delete.desc },
    { km.force.key,  '<cmd>bd!<cr>',     desc = km.force.desc  },
  },
}
