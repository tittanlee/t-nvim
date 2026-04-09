local p = require('config.keymaps').prefix

local M = {}

-- Root group: visible when pressing <leader> alone
M.root = {
  prefix = p.gitsigns,
  group = '[gitsigns]',
}

M.hunk = {
  prefix = p.gitsigns .. 'h',
  group = '[gitsigns] Hunk',
  stage = { key = 's', desc = 'Stage hunk' },
  reset = { key = 'r', desc = 'Reset hunk' },
  stage_buf = { key = 'S', desc = 'Stage buffer' },
  undo_stage = { key = 'u', desc = 'Undo stage hunk' },
  reset_buf = { key = 'R', desc = 'Reset buffer' },
  preview = { key = 'p', desc = 'Preview hunk' },
  blame = { key = 'b', desc = 'Blame line' },
}

M.toggle = {
  prefix = p.gitsigns .. 't',
  group = '[gitsigns] Toggle',
  linehl = { key = 'l', desc = 'Toggle line highlight' },
  blame = { key = 'b', desc = 'Toggle line blame' },
  word = { key = 'w', desc = 'Toggle word diff' },
}

-- Navigation keys (no prefix, direct ]g / [g)
M.nav = {
  next = { key = ']g', desc = 'Next Git hunk' },
  prev = { key = '[g', desc = 'Previous Git hunk' },
}

-- Which-key registration spec for this module
M.wk = {
  { M.root.prefix,   group = M.root.group   },
  { M.hunk.prefix,   group = M.hunk.group   },
  { M.toggle.prefix, group = M.toggle.group },
  { M.nav.next.key,  desc  = M.nav.next.desc },
  { M.nav.prev.key,  desc  = M.nav.prev.desc },
}

return M
