-- =========================================================
-- Lazy.nvim plugin declaration
-- This file serves BOTH roles:
--  - Lazy plugin spec
--  - Shared LSP utility module
-- =========================================================
return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },

  config = function()
    -- Load LSP servers after the plugin is fully loaded

    local servers = {
      'bash',
      'c',
      'html',
      'json',
      'lua',
      'python',
      'vim',
      'xml',
      'yaml',
    }
    for _, name in ipairs(servers) do
      require('plugins.lsp.server.' .. name)
    end
  end,
}
