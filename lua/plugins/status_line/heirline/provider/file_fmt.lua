
local icons      = require("resources.icons")
local conditions = require("heirline.conditions")
local utils      = require("heirline.utils")

local default_opts = {
    static = {
        fmt_icons = {
            dos  = icons.os_logo.dos,
            unix = icons.os_logo.unix,
            mac  = icons.os_logo.mac,
        },
    },

    provider = function(self)
        local fmt = vim.bo.fileformat
        -- return fmt ~= 'unix' and fmt:upper()
        return self.fmt_icons[fmt] .. " " .. fmt:upper()
    end,

    hl = {
        fg = "cyan",
        bold = true,
    },
}

local file_format = function(left_sep, right_sep, color)
    return {
        utils.surround({left_sep, right_sep}, color, default_opts)
    }
end

return file_format
