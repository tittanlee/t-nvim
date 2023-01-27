
local M = {}

M.lsp_name = "pyright"

M.lsp_config = {
    settings = {

        pyright = {
            autoImportCompletion = true
        },

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

}


return M
