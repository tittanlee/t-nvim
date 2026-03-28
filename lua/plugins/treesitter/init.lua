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
        init_selection = '<cr>',
        node_incremental = '<cr>',
        node_decremental = '<tab>',
        scope_incremental = '<s-cr>',
      },
    },
  },

  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
