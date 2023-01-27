

local M = {}

M.lsp_name = "html"

M.lsp_config = {
    single_file_support = true,
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
        embeddedLanguages = {
            css = true,
            javascript = true
        },
    },

}


return M
