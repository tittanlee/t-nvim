


-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/pyright.lua
return {
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
}
