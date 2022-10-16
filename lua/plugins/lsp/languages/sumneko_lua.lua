
local M = {}

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
local neodev_status, neodev = pcall(require, "neodev")
if not neodev_status then
    return
end
neodev.setup({
    -- add any options here, or leave empty to use the default settings
    library = {
        enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
        -- these settings will be used for your Neovim config directory
        runtime = true, -- runtime path
        types   = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
        plugins = true, -- installed opt or start plugins in packpath
        -- you can also specify the list of plugins to make available as a workspace library
        -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
    },
    setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
    -- for your Neovim config directory, the config.library settings will be used as is
    -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
    -- for any other directory, config.library.enabled will be set to false
    override = function(root_dir, options) end,

})


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

M.lsp_name = "sumneko_lua"

M.config = {
    [M.lsp_name] = function()
        lspconfig.sumneko_lua.setup ({

            flags = {
                debounce_text_changes = 200,
            },

            capabilities = capabilities,

            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = "LuaJIT",
                        -- Setup your lua path
                        path = vim.split(package.path, ";"),
                    },
                    diagnostics = {
                        enable = false,
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim", "describe", "it", "before_each", "after_each", "packer_plugins" },
                        -- disable = { "lowercase-global", "undefined-global", "unused-local", "unused-vararg", "trailing-space" },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = {
                            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                        },
                        -- library = vim.api.nvim_get_runtime_file("", true),
                        maxPreload = 10000,
                        preloadFileSize = 50000,
                    },
                    completion = { callSnippet = "Both" },
                    telemetry = { enable = false },
                    hint = {
                        enable = true,
                    },
                },
            }
        })
    end
}


return M
