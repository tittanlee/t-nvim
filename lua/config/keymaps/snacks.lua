local p = require('config.keymaps').prefix

local M = {}

M.find = {
  prefix = p.find,
  group = '[snacks] Find',
  autocmds = { key = 'a', desc = 'Autocmds' },
  buffers = { key = 'b', desc = 'Buffers' },
  config = { key = 'C', desc = '.config file' },
  command_history = { key = 'c', desc = 'Command history' },
  commands = { key = ':', desc = 'Commands' },
  diagnostics = { key = 'd', desc = 'Diagnostics' },
  diagnostics_buf = { key = 'D', desc = 'Buffer Diagnostics' },
  files = { key = 'f', desc = 'Files' },
  help = { key = 'h', desc = 'Help pages' },
  highlights = { key = 'H', desc = 'Highlights' },
  icons = { key = 'i', desc = 'Icons' },
  keymaps = { key = 'k', desc = 'Keymaps' },
  loclist = { key = 'l', desc = 'Location List' },
  notifier = { key = 'n', desc = 'Notifier history' },
  notifications = { key = 'N', desc = 'Notifications History' },
  explorer = { key = 'w', desc = 'Explorer' },
  resume = { key = 'r', desc = 'Resume' },
  terminal = { key = 't', desc = 'Terminal' },
  qflist = { key = 'q', desc = 'Quickfix list' },
}

M.lsp = {
  prefix = p.lsp,
  group = '[snacks] LSP',
  definitions = { key = 'd', desc = 'Definitions' },
  declarations = { key = 'D', desc = 'Declarations' },
  references = { key = 'r', desc = 'References' },
  implementations = { key = 'i', desc = 'Implementations' },
  type_definitions = { key = 'y', desc = 'T[y]pe Definition' },
  incoming = { key = 'c', desc = 'Calls Incoming' },
  outgoing = { key = 'o', desc = 'Calls Outgoing' },
  symbols = { key = 's', desc = 'Symbols' },
  workspace_symbols = { key = 'S', desc = 'Workspace Symbols' },
}

M.grep = {
  prefix = p.grep,
  group = '[snacks] Grep',
  buffers = { key = 'b', desc = 'Open Buffers lines' },
  grep = { key = 'g', desc = 'Live Grep' },
  lines = { key = 'l', desc = 'Buffer Lines' },
  word = { key = 'w', desc = 'Word', mode = { 'n', 'x' } },
}

M.git = {
  prefix = p.git,
  group = '[snacks] Git',
  branches = { key = 'b', desc = 'Branches' },
  log = { key = 'l', desc = 'Log' },
  status = { key = 's', desc = 'Status' },
  diff = { key = 'd', desc = 'Diff' },
  lazy_git = { key = 'g', desc = 'Lazygit' },
}

M.toggle = {
  prefix = p.toggle,
  group = '[snacks] Toggle',
  diagnostics = { key = 'D', desc = 'Diagnostics' },
  dim = { key = 'd', desc = 'Dim mode' },
  inlay_hints = { key = 'l', desc = 'Inlay hints' },
  treesitter = { key = 'T', desc = 'Treesitter' },
  zen_mode = { key = 'z', desc = 'Zen Mode' },
  zen_zoom = { key = 'Z', desc = 'Zen Zoom' },
}

M.gtags = {
  prefix = p.find .. 'j',
  group = '[snacks] Gtags',
  definitions = { key = 'd', desc = 'global to look up definditon' },
  references = { key = 'r', desc = 'global to look up reference' },
  grep = { key = 'g', desc = 'global to grep everything' },
}

M.buf_del = { key = '<M-w>', desc = 'Delete Buffer' }

-- Which-key registration spec for this module
M.wk = {
  { M.find.prefix, group = M.find.group },
  { M.lsp.prefix, group = M.lsp.group },
  { M.grep.prefix, group = M.grep.group },
  { M.git.prefix, group = M.git.group },
  { M.toggle.prefix, group = M.toggle.group },
  { M.gtags.prefix, group = M.gtags.group },
  { M.buf_del.key, desc = M.buf_del.key },
}

return M
