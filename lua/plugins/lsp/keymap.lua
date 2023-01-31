
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.

local M = {}

M.keymap = function(bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    local xmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('x', keys, func, { buffer = bufnr, desc = desc })
    end

    -- See `:help K` for why this keymap

    -- Displays hover information about the symbol under the cursor
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

    -- Jump to the definition
    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')

    -- Jump to declaration
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- Lists all the implementations for the symbol under the cursor
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')

    -- Jumps to the definition of the type symbol
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')

    -- Lists all the references
    nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')

    -- Displays a function's signature information
    nmap('gs', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Renames all references to the symbol under the cursor
    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')


    -- Selects a code action available at the current cursor position
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    xmap('<Leader>ga', vim.lsp.buf.range_code_action, 'code ran[g]e [A]ction')

    -- Lesser used LSP functionality
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl',
        function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        '[W]orkspace [L]ist Folders'
    )

    -- Diagnostic keymaps
    -- Show diagnostics in a floating window
    nmap('gl', vim.diagnostic.open_float)

    -- Move to the previous diagnostic
    nmap('[d', vim.diagnostic.goto_prev)

    -- Move to the next diagnostic
    nmap(']d', vim.diagnostic.goto_next)

    nmap('<leader>dq', vim.diagnostic.setqflist)

    -- nmap('<Leader>dd', '<cmd>lua require("plugins.lsp.handlers.diagnostics").toggle() <CR>')
end

return M
