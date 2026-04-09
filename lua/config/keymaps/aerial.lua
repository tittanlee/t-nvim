local M = {}

M.outline = { key = '<leader>O', desc = 'Outline (Aerial sidebar)' }

M.wk = {
  { M.outline.key, desc = M.outline.desc },
}

return M
