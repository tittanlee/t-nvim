

local M = {}


M.servers = {
    require("plugins.lsp.languages.clangd").lsp_name,
    require("plugins.lsp.languages.pyright").lsp_name,
    require("plugins.lsp.languages.sumneko_lua").lsp_name,
}

M.handlers = {
    require("plugins.lsp.languages.clangd").config,
    require("plugins.lsp.languages.pyright").config,
    require("plugins.lsp.languages.sumneko_lua").config,
}

return M
