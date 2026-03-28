local common = require('plugins.lsp.server.common')

vim.lsp.config('lua_ls', {
  capabilities = common.capabilities,
  on_attach = common.on_attach,

  settings = {
    Lua = {
      -- Disable LSP formatter (stylua is the source of truth)
      format = {
        enable = false,
      },

      -- Recognize Neovim globals
      diagnostics = {
        globals = { 'vim' },
      },

      -- Improve completion experience
      completion = {
        callSnippet = 'Replace',
      },

      -- Runtime configuration for Neovim
      runtime = {
        version = 'LuaJIT',
      },

      -- Workspace library for Neovim API awareness
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },

      -- Telemetry disabled
      telemetry = {
        enable = false,
      },
    },
  },
})

vim.lsp.enable('lua_ls')
