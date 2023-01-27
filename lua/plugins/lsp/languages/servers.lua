
local servers = {
    -- ❰ bash ❱
    -- [require("plugins.lsp.languages.bashls").lsp_name] = require("plugins.lsp.languages.bashls").setup,

    -- ❰ C/C++ ❱
    -- [require("plugins.lsp.languages.clangd").lsp_name] =  require("plugins.lsp.languages.clangd").setup,

    -- ❰ html ❱
    -- [require("plugins.lsp.languages.html").lsp_name] = require("plugins.lsp.languages.html").setup,

    -- ❰ jsonls ❱
    -- [require("plugins.lsp.languages.jsonls").lsp_name] = require("plugins.lsp.languages.jsonls").setup,

    -- ❰ python ❱
    -- [require("plugins.lsp.languages.pyright").lsp_name] = require("plugins.lsp.languages.pyright").setup,
    -- [require("plugins.lsp.languages.jedi_language_server").lsp_name] = require("plugins.lsp.languages.jedi_language_server").setup,

    -- ❰ lua ❱
    [require("plugins.lsp.languages.sumneko_lua").lsp_name] = require("plugins.lsp.languages.sumneko_lua").lsp_config,

    -- ❰ xml ❱
    -- [require("plugins.lsp.languages.lemminx").lsp_name] = require("plugins.lsp.languages.lemminx").setup,

    -- ❰ typescript ❱
    -- [require("plugins.lsp.languages.tsserver").lsp_name] = require("plugins.lsp.languages.tsserver").setup,

}

return servers
