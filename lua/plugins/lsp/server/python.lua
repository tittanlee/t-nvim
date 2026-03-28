local common = require('plugins.lsp.server.common')

vim.lsp.config('pyright', {
  capabilities = common.capabilities,
  on_attach = common.on_attach,

  settings = {
    pyright = {
      -- Disable overly strict type checking by default
      typeCheckingMode = 'basic',

      -- Respect virtual environments
      disableOrganizeImports = false,
    },

    python = {
      analysis = {
        -- Use library code for type inference
        useLibraryCodeForTypes = true,

        -- Auto search paths
        autoSearchPaths = true,

        -- Diagnostic mode: "openFilesOnly" or "workspace"
        diagnosticMode = 'openFilesOnly',
      },
    },
  },
})

vim.lsp.enable('pyright')
