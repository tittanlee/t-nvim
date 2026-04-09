local wk = require('which-key')

-- All keymap modules whose groups should appear in which-key
local km_modules = {
  require('config.keymaps.snacks'),
  require('config.keymaps.gitsigns'),
  require('config.keymaps.hi-my-words'),
  require('config.keymaps.aerial'),
  require('config.keymaps.bufdelete'),
  require('config.keymaps.flash'),
  require('config.keymaps.mini-align'),
  require('config.keymaps.multicursors'),
  require('config.keymaps.yanky'),
  require('config.keymaps.bufferline'),
  require('config.keymaps.treesitter'),
}

-- Each module declares its own wk spec — just collect and register
local spec = {}
for _, mod in ipairs(km_modules) do
  vim.list_extend(spec, mod.wk or {})
end

wk.add(spec)

-- Other manually defined which-key groups
require('config.which-key.copy_path')
