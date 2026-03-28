-- Bash language server configuration
-- Provides diagnostics and completion for shell scripts

local common = require('plugins.lsp.server.common')

vim.lsp.config('bashls', {
  capabilities = common.capabilities,
  on_attach = common.on_attach,
})

vim.lsp.enable('bashls')
