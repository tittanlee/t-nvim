local M = {}


local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

M.lsp_name = "html"

M.setup = function()
    lspconfig.html.setup ({
        capabilities = capabilities,

        flags = {
            debounce_text_changes = 150,
        },

        cmd = {
            "html-languageserver",
            "--stdio"
        },

        filetypes = {
            "html"
        },

        init_options = {
            configurationSection = {
                "html",
                "css",
                "javascript"
            },
            embeddedLanguages = { css = true, javascript = true },
        },

        settings = {
        },

        single_file_support = true,
        -- on_attach = custom_attach,
    })
end


return M

