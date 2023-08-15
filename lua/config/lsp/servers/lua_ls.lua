

-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/lua_ls.lua
return {
    settings = {
        Lua = {
            runtime = {
                -- LuaJIT in the case of Neovim
                version = 'LuaJIT',
            },

            format = {
                enable = true,
                defaultConfig = {
                    indent_style                         = 'space',
                    indent_size                          = '4',
                    -- # none/single/double
                    quote_style                          = 'double',
                    -- align_if_branch                 = false,
                    -- align_array_table                 = false,
                    -- align_continuous_assign_statement = false,
                    -- align_continuous_rect_table_field = false,
                    align_call_args                      = 'false',
                    align_function_params                = 'false',
                    align_continuous_assign_statement    = 'false',
                    align_continuous_rect_table_field    = 'false',
                    align_array_table                    = 'true',
                }
            },

            diagnostics = {
                globals = { "vim" },
                disable = { "different-requires" },
            },

            workspace = {
                checkThirdParty = false,
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")]         = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },

            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },

            -- Do not override treesitter lua highlighting with lua_ls's highlighting
            semantic = {
                enable = false
            },
        }
    }
}
