local lspconfig = require 'lspconfig'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local function on_attach(client, bufnr)
    -- if client.resolved_capabilities.document_formatting then
    --     local defs = {}
    --     local ext = vim.fn.expand('%:e')
    --     table.insert(defs,{"BufWritePre", '*.'..ext ,
    --     "lua vim.lsp.buf.formatting_sync(nil,1000)"})
    --     vim.api.nvim_command('augroup lsp_before_save')
    --     vim.api.nvim_command('autocmd!')
    --     for _, def in ipairs(defs) do
    --         local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
    --         vim.api.nvim_command(command)
    --     end
    --     vim.api.nvim_command('augroup END')
    -- end
    if client.config.flags then
        client.config.flags.allow_incremental_sync = true
    end

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.bnuf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end


local lsp_setup_table = {
    -- clangd lsp parameter setup
    clangd = {
        enable = true,
        servername = "clangd",
        setup = {
            cmd = {
                "clangd",
                "--clang-tidy",
                "--completion-style=bundled",
                "--header-insertion=iwyu",
                "--suggest-missing-includes",
                "--cross-file-rename"
            },

            filetypes = {
                "c", "cpp", "objc", "objcpp"
            },

            init_options = {
                clangdFileStatus = true,
                usePlaceholders = true,
                completeUnimported = true,
                semanticHighlighting = true
            },
            flags = { debounce_text_changes = 150 },
            on_attach = on_attach,
        },
    },

    --pyright lsp parameter setup
    pyright = {
        enable = true,
        servername = "pyright-langserver",
        setup = {
            -- cmd = {
            --     "pyright-langserver",
            --     "--stdio" 
            -- },
            filetypes = { "python" },
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = "workspace",
                        useLibraryCodeForTypes = true
                    }
                },
            },
            on_attach = on_attach,
        }
    },

    -- py lsp parameter setup
    pylsp = {
        enable = false,
        servername = "pylsp",
        setup = {
            cmd = { "pylsp" },
            filetypes = { "python" },

            root_dir = function(fname)
                return lspconfig.util.root_pattern(
                "pyproject.toml",
                "setup.py",
                "setup.cfg",
                "requirements.txt",
                "mypy.ini",
                ".pylintrc",
                ".flake8rc",
                ".gitignore"
                )(fname) or
                lspconfig.util.find_git_ancestor(fname) or
                vim.loop.os_homedir()
            end,

            on_attach = on_attach,
        },
    },

    -- bashls parameter setup
    bashls = {
        enable = true,
        servername = "bashls",
        setup = {
            cmd = {
                "bash-language-server.cmd",
                "start"
            },
            filetypes = {
                "sh",
                "zsh"
            },
            root_dir = lspconfig.util.root_pattern(".git"),
            on_attach = on_attach
        }
    },

    -- lua lsp parameter setup
}


for lsp, options in pairs(lsp_setup_table) do
    if (options.enable == true) then
        lspconfig[lsp].setup (options.setup)
    end
end

