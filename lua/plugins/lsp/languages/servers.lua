
local servers = {
    -- ❰ bash ❱
    [require("plugins.lsp.languages.bashls").lsp_name] = require("plugins.lsp.languages.bashls").lsp_config,

    -- ❰ C/C++ ❱
    [require("plugins.lsp.languages.clangd").lsp_name] =  require("plugins.lsp.languages.clangd").lsp_config,

    -- ❰ efm ❱
    -- [require("plugins.lsp.languages.efm").lsp_name] =  require("plugins.lsp.languages.efm").lsp_config,

    -- ❰ html ❱
    [require("plugins.lsp.languages.html").lsp_name] = require("plugins.lsp.languages.html").lsp_config,

    -- ❰ jsonls ❱
    [require("plugins.lsp.languages.jsonls").lsp_name] = require("plugins.lsp.languages.jsonls").lsp_config,

    -- ❰ python ❱
    [require("plugins.lsp.languages.pyright").lsp_name] = require("plugins.lsp.languages.pyright").lsp_config,
    -- [require("plugins.lsp.languages.jedi_language_server").lsp_name] = require("plugins.lsp.languages.jedi_language_server").setup,

    -- ❰ lua ❱
    [require("plugins.lsp.languages.lua_ls").lsp_name] = require("plugins.lsp.languages.lua_ls").lsp_config,

    -- ❰ xml ❱
    [require("plugins.lsp.languages.lemminx").lsp_name] = require("plugins.lsp.languages.lemminx").lsp_config,

    -- ❰ typescript ❱
    [require("plugins.lsp.languages.tsserver").lsp_name] = require("plugins.lsp.languages.tsserver").lsp_config,

}

return servers
