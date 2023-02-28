

local utils = require("heirline.utils")
local conditions = require("heirline.conditions")

local default_opts = {

    update = {'LspAttach', 'LspDetach'},

    -- You can keep it simple,
    -- provider = " [LSP]",
    -- Or complicate things a bit and get the servers names
    provider  = function()
        local names = {}
        for i, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
            table.insert(names, server.name)
        end
        return " ❰" .. table.concat(names, " ") .. "❱"
    end,

    hl = {
        fg = "green",
        bold = true
    },
}

local lsp = function(left_sep, right_sep, color)
    return {
        condition = conditions.lsp_attached,
        utils.surround({left_sep, right_sep}, color, default_opts)
    }
end

return lsp
