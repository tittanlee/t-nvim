local p = require('config.keymaps').prefix

local M = {}

M.hi = {
  prefix = p.hi,
  group  = '[hi-my-words] Highlight',
  toggle = { key = 'k', desc = 'Toggle highlight for word under cursor' },
  clear  = { key = 'K', desc = 'Clear all word highlights' },
}

-- Which-key registration spec for this module
M.wk = {
  { M.hi.prefix, group = M.hi.group },
}

return M
