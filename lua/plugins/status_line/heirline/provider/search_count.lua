

local utils = require("heirline.utils")
local conditions = require("heirline.conditions")

local default_opts = {
    provider = function(self)
        local result = vim.fn.searchcount { maxcount = 9999, timeout = 1000 }
        local denominator = math.min(result.total, result.maxcount)
        return string.format('❰%d/%d❱', result.current, denominator)
    end,

    hl = {
        fg = "purple",
        bold = true,
    },

}


local search_count = function(left_sep, right_sep, color)
    return {
        condition = function()
            return vim.v.hlsearch ~= 0
        end,

        utils.surround({left_sep, right_sep}, color, default_opts)
    }
end

return search_count 
