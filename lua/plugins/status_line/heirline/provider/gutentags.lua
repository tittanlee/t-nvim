
local utils      = require("heirline.utils")

local default_opts = {

    init = function(self)
        self.tag_progress_fn = vim.fn['gutentags#inprogress']
    end,

    hl = {
        fg = "purple"
    },

    {
        provider = "⏳❰",
    },

    {
        provider = function(self)
            local tag_progress = self.tag_progress_fn()
            return table.concat(tag_progress, "|")
        end
    },

    {
        provider = "❱",
    },
}

local gutentags = function(left_sep, right_sep, color)
    return {
        condition = function(self)
            local tag_progress = vim.fn['gutentags#inprogress']()
            return #tag_progress ~= 0
        end,

        utils.surround({left_sep, right_sep}, color, default_opts)
    }
end

return gutentags
