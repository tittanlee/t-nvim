local km = require('config.keymaps.snacks')
local K = require('config.keymaps')

return {
  'tittanlee/gtags_snacks',
  dependencies = {
    'folke/snacks.nvim',
  },
  cmd = { 'GtagsGenerate', 'GtagsReindex', 'GtagsDef', 'GtagsRef', 'GtagsGrep' },
  keys = {
    {
      K.key(km.gtags, 'definitions'),
      '<cmd>GtagsDef<cr>',
      desc = K.desc(km.gtags, 'definitions'),
    },
    {
      K.key(km.gtags, 'references'),
      '<cmd>GtagsRef<cr>',
      desc = K.desc(km.gtags, 'references'),
    },
    {
      K.key(km.gtags, 'grep'),
      '<cmd>GtagsGrep',
      desc = K.desc(km.gtags, 'grep'),
    },
  },

  config = function()
    require('gtags_snacks').setup({
      gtags = {
        label = 'edk2', -- --gtagslabel
        conf = 'C:\\utility_tools\\share\\gtags\\gtags.conf', -- --gtagsconf
        accept_dotfiles = true, -- default off, opt-in-
        skip_unreadable = true, -- default on
        compact = false, -- off by default
        use_sqlite = false, -- --sqlite3
      },

      global = {
        -- path (default), ctags, ctags-x, grep or cscope
        -- result = 'ctags-x',
        result = 'grep',
      },

      picker = {
        layout = {
          preview = true,
          preset = 'default',
        },
      },
    })
  end,
}
