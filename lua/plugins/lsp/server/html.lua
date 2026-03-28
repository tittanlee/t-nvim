-- HTML language server configuration
-- Handles HTML files and embedded CSS/JS

local common = require('plugins.lsp.server.common')

vim.lsp.config('html', {
  capabilities = common.capabilities,
  on_attach = common.on_attach,

  filetypes = {
    'html',
    'htmldjango',
    'templ',
  },

  settings = {
    html = {
      format = {
        wrapLineLength = 120,
        wrapAttributes = 'auto',
      },
      hover = {
        documentation = true,
        references = true,
      },
    },
  },
})

vim.lsp.enable('html')
