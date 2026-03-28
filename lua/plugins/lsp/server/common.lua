-- Shared LSP core configuration
-- Responsibility:
--  - Provide capabilities (completion integration for blink)
--  - Provide on_attach hook for non-UI, non-keymap logic
--  - DO NOT define keymaps (Snacks owns LSP UX)

local M = {}

-- =========================================================
-- Capabilities
-- This is the ONLY integration point with blink.cmp
-- =========================================================
M.capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, blink = pcall(require, 'blink.cmp')
if ok then
  -- Extend LSP completion capabilities so BLINK can consume them
  M.capabilities = blink.get_lsp_capabilities(M.capabilities)
end

-- =========================================================
-- on_attach
-- Intentionally minimal:
--  - No keymaps
--  - No UI logic
--  - Snacks handles all LSP UX
-- =========================================================
M.on_attach = function(client, _)
  -- Example (optional):
  -- Central place to disable formatting if needed globally
  -- client.server_capabilities.documentFormattingProvider = false
end

return M
