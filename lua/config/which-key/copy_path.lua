local wk = require('which-key')
local cp = require('utils.copy_path')

wk.add({
  { '<leader>cp', group = 'copy-path' },

  {
    '<leader>cpp',
    function()
      cp.copy('%:p', 'absolute path')
    end,
    desc = 'absolute path',
  },
  {
    '<leader>cph',
    function()
      cp.copy('%:p:h', 'absolute dir')
    end,
    desc = 'absolute dir',
  },
  {
    '<leader>cpt',
    function()
      cp.copy('%:t', 'filename')
    end,
    desc = 'filename',
  },
  {
    '<leader>cpr',
    function()
      cp.copy('%:p:r', 'path w/o ext')
    end,
    desc = 'path w/o ext',
  },
  {
    '<leader>cpe',
    function()
      cp.copy('%:e', 'extension')
    end,
    desc = 'extension',
  },
  {
    '<leader>cp.',
    function()
      cp.copy('%:.', 'relative to cwd')
    end,
    desc = 'relative to cwd',
  },
  {
    '<leader>cp~',
    function()
      cp.copy('%:~', 'path with ~')
    end,
    desc = 'path with ~',
  },
  {
    '<leader>cpd',
    function()
      cp.copy('%:.:h', 'relative dir')
    end,
    desc = 'relative dir',
  },
})
