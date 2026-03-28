-- JSON language server configuration
-- Provides validation, schemas, and completion

local common = require('plugins.lsp.server.common')

vim.lsp.config('jsonls', {
  capabilities = common.capabilities,
  on_attach = common.on_attach,

  settings = {
    json = {
      -- Enable validation and comments support
      validate = { enable = true },

      -- Automatically fetch schemas from SchemaStore
      schemas = {
        {
          description = 'NPM package.json',
          fileMatch = { 'package.json' },
          url = 'https://json.schemastore.org/package.json',
        },
        {
          description = 'TypeScript config',
          fileMatch = { 'tsconfig.json', 'tsconfig.*.json' },
          url = 'https://json.schemastore.org/tsconfig.json',
        },
        {
          description = 'ESLint config',
          fileMatch = { '.eslintrc', '.eslintrc.json' },
          url = 'https://json.schemastore.org/eslintrc.json',
        },
      },

      -- Allow comments in JSON files (JSONC-style)
      comments = {
        severity = 'warning',
      },
    },
  },
})

vim.lsp.enable('jsonls')
