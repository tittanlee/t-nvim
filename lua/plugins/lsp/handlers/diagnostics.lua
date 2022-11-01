
local diagnostic = {}

diagnostic.enable_option = true

diagnostic.disable = function()
    diagnostic.enable_option = false
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
end

diagnostic.enable = function()
    diagnostic.enable_option = true
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            -- Enable underline, use default values
            underline = true,
            -- Enable virtual text, override spacing to 4
            virtual_text = {
                spacing = 4,
            },
            -- Use a function to dynamically turn signs off
            -- and on, using buffer local variables
            signs = function(namespace, bufnr)
                return vim.b[bufnr].show_signs == true
            end,
            -- Disable a feature
            update_in_insert = false,
        }
    )
end

diagnostic.toggle = function ()
    if diagnostic.enable_option == false then
        vim.notify("diag enable")
        vim.diagnostic.enable()
    else
        vim.notify("diag disable")
        vim.diagnostic.disable()
    end
end

return diagnostic
