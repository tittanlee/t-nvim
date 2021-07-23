

vim.g.diagnostics_active =false 

vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
function _G.toggle_diagnostics()
    if vim.g.diagnostics_active then
        vim.g.diagnostics_active = false
        vim.lsp.diagnostic.clear(0)
        vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
    else
        vim.g.diagnostics_active = true
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = true,
        }
        )
        vim.cmd(":e!")
    end
end

vim.api.nvim_set_keymap('n', '<leader>tt', ':call v:lua.toggle_diagnostics()<CR>',  {noremap = true, silent = true})
