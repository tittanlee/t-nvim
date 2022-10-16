

local M = {}

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

M.lsp_name = "pyright"

M.config = {
    [M.lsp_name] = function()
        lspconfig.pyright.setup ({
            flags = {
                debounce_text_changes = 200,
            },

            analysis = {
                typeCheckingMode       = "off",
                -- useLibraryCodeForTypes = true,
            },
        })
    end
}


return M

