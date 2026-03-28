-- Vim script language server configuration
-- Supports vimscript (.vim) files

local common = require('plugins.lsp.server.common')

vim.lsp.config('vimls', {
  capabilities = common.capabilities,
  on_attach = common.on_attach,

  settings = {
    -- Reduce false positives for common Vimscript patterns
    vimls = {
      diagnostic = {
        enable = true,
      },
    },
  },
})

vim.lsp.enable('vimls')
