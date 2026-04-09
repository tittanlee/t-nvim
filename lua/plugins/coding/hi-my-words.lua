local km = require('config.keymaps.hi-my-words')
local K  = require('config.keymaps')

return {
  'dvoytik/hi-my-words.nvim',
  -- Load on these keys to keep startup fast
  keys = {
    { K.key(km.hi, 'toggle'), '<cmd>HiMyWordsToggle<cr>', desc = K.desc(km.hi, 'toggle') },
    { K.key(km.hi, 'clear'),  '<cmd>HiMyWordsClear<cr>',  desc = K.desc(km.hi, 'clear') },
  },
  config = function()
    require('hi-my-words').setup({
      -- You can define your own highlight groups or use the defaults
      -- The plugin cycling through 6 default colors
      backlog = 'HiMyWordsBacklog',
    })
  end,
}
