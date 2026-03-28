-- YAML language server configuration (Neovim 0.11+)
-- Uses native vim.lsp.config / vim.lsp.enable API
-- Schema support is the primary value of YAML LSP

local common = require('plugins.lsp.server.common')

vim.lsp.config('yamlls', {
  capabilities = common.capabilities,
  on_attach = common.on_attach,

  settings = {
    yaml = {
      -- Enable schema-based validation
      validate = true,

      -- Enable key completion
      completion = true,

      -- Enable hover information from schemas
      hover = true,

      -- Automatically fetch schemas from SchemaStore
      schemaStore = {
        enable = true,
        url = 'https://www.schemastore.org/api/json/catalog.json',
      },

      -- You can still add custom schemas here if needed
      schemas = {
        -- Example:
        -- ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*",
      },
    },
  },
})

vim.lsp.enable('yamlls')
