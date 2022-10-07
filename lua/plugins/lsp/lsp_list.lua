



local M = {}

M.servers = {
    bashls = {
    },

    clangd = {
    },

    cmake = {
    },

    diagnosticls = {

    },

    efm = {

    },

    html = {
    },

    jsonls = {
        settings = {
            json = {
                schemas = require("schemastore").json.schemas(),
            },
        },
    },

    -- XML
    lemminx = {
    },

    perlnavigator = {

    },

    powershell_es = {

    },

    pyright = {
        analysis = {
            typeCheckingMode = "off",
        },
    },

    sumneko_lua = {
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = "LuaJIT",
                    -- Setup your lua path
                    path = vim.split(package.path, ";"),
                },
                diagnostics = {
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
                    maxPreload = 2000,
                    preloadFileSize = 50000,
                },
                completion = { callSnippet = "Both" },
                telemetry = { enable = false },
                hint = {
                    enable = true,
                },
            },
        },
    },

    tsserver = {
        disable_formatting = true,
        settings = {
            javascript = {
                inlayHints = {
                    includeInlayEnumMemberValueHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayVariableTypeHints = true,
                },
            },
            typescript = {
                inlayHints = {
                    includeInlayEnumMemberValueHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayVariableTypeHints = true,
                },
            },
        },
    },

    vimls = {
    },

}

return M
