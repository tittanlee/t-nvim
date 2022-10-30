
local M = {}

local conditions = require("heirline.conditions")


M.lsp_active = {
    condition = conditions.lsp_attached,
    update = {'LspAttach', 'LspDetach'},

    -- You can keep it simple,
    -- provider = " [LSP]",

    -- Or complicate things a bit and get the servers names
    provider  = function()
        local names = {}
        for i, server in pairs(vim.lsp.buf_get_clients(0)) do
            table.insert(names, server.name)
        end
        return " [" .. table.concat(names, " ") .. "]"
    end,
    hl = { fg = "green", bold = true },
}




-- I personally use it only to display progress messages!
-- See lsp-status/README.md for configuration options.
-- Note: check "j-hui/fidget.nvim" for a nice statusline-free alternative.
-- M.lsp_message = {
--     provider = require("lsp-status").status,
--     hl = { fg = "gray" },
-- }



return M
