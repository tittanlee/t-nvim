

local M = {}

function M.get()
    local env_var = require("environment").variable
    local highlights = {}

    if env_var.colorscheme == "catppuccin" then
        highlights = require("catppuccin.groups.integrations.bufferline").get()
    end

    return highlights
end

return M
