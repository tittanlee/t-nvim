local M = {}

-- Incremental selection (treesitter/init.lua)
M.select = {
  init      = { key = '<cr>',   desc = 'Init selection / Increment node' },
  increment = { key = '<cr>',   desc = 'Increment node' },
  decrement = { key = '<tab>',  desc = 'Decrement node' },
  scope     = { key = '<s-cr>', desc = 'Increment scope' },
}

-- Navigation: jump to function boundaries (treesitter-textobjects.lua)
M.nav = {
  prev_start = { key = '[m', desc = 'Prev function start' },
  next_start = { key = ']m', desc = 'Next function start' },
  prev_end   = { key = '[M', desc = 'Prev function end'   },
  next_end   = { key = ']M', desc = 'Next function end'   },
}

-- Text objects (treesitter-textobjects.lua)
M.textobj = {
  around_func = { key = 'af', desc = 'Around function' },
  inner_func  = { key = 'if', desc = 'Inner function'  },
}

-- Which-key: nav and textobj keys (select keys are plugin-internal, skip)
M.wk = {
  { M.nav.prev_start.key, desc = M.nav.prev_start.desc },
  { M.nav.next_start.key, desc = M.nav.next_start.desc },
  { M.nav.prev_end.key,   desc = M.nav.prev_end.desc   },
  { M.nav.next_end.key,   desc = M.nav.next_end.desc   },
  { M.textobj.around_func.key, mode = { 'o', 'x' }, desc = M.textobj.around_func.desc },
  { M.textobj.inner_func.key,  mode = { 'o', 'x' }, desc = M.textobj.inner_func.desc  },
}

return M
