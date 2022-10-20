

local M = {}

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

M.lsp_name = "pyright"

M.setup = function()
    lspconfig.pyright.setup ({
        flags = {
            debounce_text_changes = 150,
        },

        settings = {
            python = {
                analysis = {
                    typeCheckingMode       = 'off',
                    diagnosticMode         = "workspace",
                    autoSearchPaths        = true,
                    useLibraryCodeForTypes = true,
                    completeFunctionParens = true,
                }
            }
        },
        single_file_support = true,
        root_dir = function()
            return vim.fn.getcwd(0)
        end
    })
end


return M

