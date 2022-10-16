

local M = {}


M.servers = {
    require("plugins.lsp.languages.sumneko_lua").lsp_name,
    require("plugins.lsp.languages.clangd").lsp_name,
}

M.handlers = {
    require("plugins.lsp.languages.sumneko_lua").config,
    require("plugins.lsp.languages.clangd").config,
}

return M
