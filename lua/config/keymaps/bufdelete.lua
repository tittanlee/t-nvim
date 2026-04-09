local M = {}

M.delete = { key = '<M-w>', desc = 'Delete Buffer (keep layout)' }
M.force  = { key = '<M-W>', desc = 'Force Delete Buffer' }

M.wk = {
  { M.delete.key, desc = M.delete.desc },
  { M.force.key,  desc = M.force.desc  },
}

return M
