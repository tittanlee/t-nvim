-- lua/plugins/tools/mason-installer.lua
return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    require('mason-tool-installer').setup({
      ensure_installed = {
        -- LSP servers
        'bash-language-server',
        'clangd',
        'html-lsp',
        'json-lsp',
        'lemminx',
        'lua-language-server',
        'pyright',
        'vim-language-server',
        'yaml-language-server',

        -- formatters (conform sued)
        'stylua',
        'shfmt',
        'black',
        'beautysh',
        'ruff',
        'prettier',
      },

      auto_update = false,
      run_on_start = true,
      start_delay = 300, -- ms

      notifications = {
        success = false,
        failure = true,
      },
    })
  end,
}
