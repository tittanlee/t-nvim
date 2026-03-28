local common = require('plugins.lsp.server.common')

vim.lsp.config('clangd', {
  capabilities = common.capabilities,
  on_attach = common.on_attach,

  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--completion-style=detailed',
    '--header-insertion=iwyu',
  },

  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },

  init_options = {
    clangdFileStatus = true,
  },
})

vim.lsp.enable('clangd')
