local M = {}

M.start = { key = '<Leader>m', mode = { 'v', 'n' }, desc = 'Multicursor start' }

M.wk = {
  { M.start.key, desc = M.start.desc },
}

return M
