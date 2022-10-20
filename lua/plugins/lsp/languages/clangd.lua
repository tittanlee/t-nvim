
local M = {}

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.offsetEncoding = { "utf-16" }

M.lsp_name = "clangd"

M.setup = function()
    lspconfig.clangd.setup ({
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
        cmd = {
            "clangd",
            "--background-index",
            "--pch-storage=memory",
            "--clang-tidy",
            "--completion-style=detailed",
            "--fallback-style=google",
            "--header-insertion=iwyu",
            "--suggest-missing-includes"
            -- You MUST set this arg ↓ to your clangd executable location (if not included)!
            -- "--query-driver=/usr/bin/clang++,/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
            -- "--clang-tidy",
            -- "--all-scopes-completion",
            -- "--cross-file-rename",
            -- "--completion-style=detailed",
            -- "--header-insertion-decorators",
            -- "--header-insertion=iwyu",
        },
    })
end

return M
