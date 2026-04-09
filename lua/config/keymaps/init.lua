local M = {}

-- Top-level prefix keys for all groups. Change here to remap an entire group.
M.prefix = {
  find     = '<leader>f',
  lsp      = '<leader>l',
  grep     = '<leader>s',
  git      = '<leader>g',
  toggle   = '<leader>t',
  hi       = '<leader>k',
  gitsigns = '<leader>G',
  edit     = '<leader>e',
  buf      = '<leader>b',
}

-- Build the full keystring from prefix + sub key.
-- Usage: K.key(km.find, 'files') => '<leader>ff'
function M.key(group, name)
  return group.prefix .. group[name].key
end

-- Get the description string for a keymap entry.
-- Usage: K.desc(km.find, 'files') => 'Files'
function M.desc(group, name)
  return group[name].desc
end

-- Get the mode table for a keymap entry. Returns nil if not specified.
-- Usage: K.mode(km.grep, 'word') => { 'n', 'x' }
function M.mode(group, name)
  return group[name].mode
end

return M
