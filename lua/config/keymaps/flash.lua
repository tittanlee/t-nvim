local M = {}

M.backward = { key = 'f', mode = { 'n', 'x', 'o' }, desc = 'Flash jump backward' }
M.forward  = { key = 'F', mode = { 'n', 'x', 'o' }, desc = 'Flash jump forward'  }
M.ts_back  = { key = 't', mode = { 'n', 'x', 'o' }, desc = 'Flash treesitter search backward' }
M.ts_fwd   = { key = 'T', mode = { 'n', 'x', 'o' }, desc = 'Flash treesitter search forward'  }

M.wk = {
  { M.backward.key, mode = M.backward.mode, desc = M.backward.desc },
  { M.forward.key,  mode = M.forward.mode,  desc = M.forward.desc  },
  { M.ts_back.key,  mode = M.ts_back.mode,  desc = M.ts_back.desc  },
  { M.ts_fwd.key,   mode = M.ts_fwd.mode,   desc = M.ts_fwd.desc   },
}

return M
