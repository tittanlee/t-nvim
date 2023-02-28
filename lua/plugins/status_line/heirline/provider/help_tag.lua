

local utils      = require("heirline.utils")
local conditions = require("heirline.conditions")

local default_opts = {

    condition = function()
        return vim.bo.filetype == "help"
    end,

    provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        return vim.fn.fnamemodify(filename, ":t")
    end,

    hl = {
        fg = "blue"
    },
}

local help_tag = function(left_sep, right_sep, color)
    return {
        condition = conditions.is_git_repo,

        utils.surround({left_sep, right_sep}, color, default_opts)
    }
end

return help_tag
