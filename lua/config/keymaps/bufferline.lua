local p = require('config.keymaps').prefix

local M = {}

M.buf = {
  prefix = p.buf,
  group  = '[bufferline] Buffer',
  pick   = { key = 'p', desc = 'Pick buffer' },
}

M.prev = { key = '<M-h>', desc = 'Prev buffer' }
M.next = { key = '<M-l>', desc = 'Next buffer' }

M.wk = {
  { M.buf.prefix, group = M.buf.group   },
  { M.prev.key,   desc  = M.prev.desc   },
  { M.next.key,   desc  = M.next.desc   },
}

return M
