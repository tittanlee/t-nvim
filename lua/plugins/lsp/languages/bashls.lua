
local M = {}


local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

M.lsp_name = "bashls"

M.config = {
    [M.lsp_name] = function()
        lspconfig.bashls.setup ({
            capabilities = capabilities,
            flags = {
                debounce_text_changes = 150,
            },
        })
    end
}

return M


