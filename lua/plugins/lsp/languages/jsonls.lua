

local M = {}


local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

M.lsp_name = "jsonls"

M.config = {
    [M.lsp_name] = function()
        lspconfig.jsonls.setup({
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                },
            }
        })
    end
}

return M
