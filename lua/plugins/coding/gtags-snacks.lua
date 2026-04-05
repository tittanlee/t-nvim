-- lua/plugins/gtags-snacks.lua
return {
  'tittanlee/gtags_snacks',
  dependencies = {
    'folke/snacks.nvim',
  },
  cmd = { 'GtagsGenerate', 'GtagsReindex', 'GtagsDef', 'GtagsRef', 'GtagsGrep' },
  keys = {
    {
      '<leader>fgd',
      '<cmd>GtagsDef<cr>',
      desc = 'global to look up definditon',
    },
    {
      '<leader>fgr',
      '<cmd>GtagsRef<cr>',
      desc = 'global to look up reference',
    },
    {
      '<leader>fgp',
      '<cmd>GtagsGrep',
      desc = 'global to grep everything',
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
