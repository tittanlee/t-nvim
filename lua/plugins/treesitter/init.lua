local km = require('config.keymaps.treesitter')

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  build = ':TSUpdate',
  lazy = false,
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'cmake',
      'c_sharp',
      'cpp',
      'css',
      'go',
      'html',
      'java',
      'javascript',
      'json',
      'lua',
      'python',
      'regex',
      'rust',
      'toml',
      'typescript',
      'vim',
      'yaml',
    },

    auto_install = true,
    sync_install = false,

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },

    indent = { enable = true },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection    = km.select.init.key,
        node_incremental  = km.select.increment.key,
        node_decremental  = km.select.decrement.key,
        scope_incremental = km.select.scope.key,
      },
    },
  },

  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'Avante', 'AvanteSelectedFiles', 'AvanteInput' },
      callback = function()
        vim.treesitter.stop()
      end,
    })
  end,
}
