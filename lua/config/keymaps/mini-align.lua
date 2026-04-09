local p = require('config.keymaps').prefix

local M = {}

M.align = {
  prefix  = p.edit,
  group   = '[mini-align] Align',
  start   = { key = 'a', desc = 'Align' },
  preview = { key = 'A', desc = 'Align with preview' },
}

M.wk = {
  { M.align.prefix, group = M.align.group },
}

return M
