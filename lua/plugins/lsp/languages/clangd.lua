

local M = {}

M.lsp_name = "clangd"

M.lsp_config = {
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
}


return M
