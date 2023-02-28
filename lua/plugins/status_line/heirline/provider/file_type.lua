

local utils = require("heirline.utils")


local default_opts = {
    provider = function()
        return string.upper(vim.bo.filetype)
    end,

    hl = {
        fg = utils.get_highlight("Type").fg,
        bold = true
    },
}


local file_type = function(left_sep, right_sep, color)
    return {
        condition = function()
            return vim.bo.filetype ~= ""
        end,
        utils.surround({left_sep, right_sep}, color, default_opts)
    }
end

return file_type
