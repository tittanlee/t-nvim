local M = {}

M.history    = { key = '<leader>p', mode = { 'n', 'x' }, desc = 'Yank history'        }
M.put_after  = { key = 'p',         mode = { 'n', 'x' }, desc = 'Put after'            }
M.put_before = { key = 'P',         mode = { 'n', 'x' }, desc = 'Put before'           }
M.prev       = { key = '<c-p>',     mode = { 'n', 'x' }, desc = 'Previous yank entry'  }
M.next       = { key = '<c-n>',     mode = { 'n', 'x' }, desc = 'Next yank entry'      }
M.gput_after  = { key = 'gp',       mode = { 'n' },       desc = 'GPut after'           }
M.gput_before = { key = 'gP',       mode = { 'n' },       desc = 'GPut before'          }

M.wk = {
  { M.history.key,    mode = M.history.mode,    desc = M.history.desc    },
  { M.put_after.key,  mode = M.put_after.mode,  desc = M.put_after.desc  },
  { M.put_before.key, mode = M.put_before.mode, desc = M.put_before.desc },
  { M.prev.key,       mode = M.prev.mode,       desc = M.prev.desc       },
  { M.next.key,       mode = M.next.mode,       desc = M.next.desc       },
  { M.gput_after.key,  mode = M.gput_after.mode,  desc = M.gput_after.desc  },
  { M.gput_before.key, mode = M.gput_before.mode, desc = M.gput_before.desc },
}

return M
