-- XML language server configuration
-- Provides validation and completion for XML files

local common = require('plugins.lsp.server.common')

vim.lsp.config('lemminx', {
  capabilities = common.capabilities,
  on_attach = common.on_attach,

  settings = {
    xml = {
      -- Enable XML validation
      validation = {
        enabled = true,
      },

      -- Enable auto-completion
      completion = {
        autoCloseTags = true,
      },

      -- Schema and DTD support
      schemas = {},
      catalogs = {},
    },
  },
})

vim.lsp.enable('lemminx')
