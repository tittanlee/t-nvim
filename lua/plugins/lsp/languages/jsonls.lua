

local M = {}

M.lsp_name = "bashls"

M.lsp_config = {
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
        },
    }
}


return M
