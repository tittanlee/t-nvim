
local conditions = require("heirline.conditions")
local utils      = require("heirline.utils")

local default_opts = {
    provider = function()
        local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc -- :h 'enc'
        -- return enc ~= 'utf-8' and enc:upper()
        return enc:upper()
    end,

    hl =  {
        fg = "orange",
        bold = true,
    }
}

local file_encodeing = function(left_sep, right_sep, color)
    return {
        utils.surround({left_sep, right_sep}, color, default_opts)
    }
end


return file_encodeing 
