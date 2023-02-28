
local M = {}

local icons = require("resources.icons")

M.align = "%="
M.space = " "
M.empty = ""

M.left = {
    arrow = {
        thin   = icons.separators.left,
        filled = icons.separators.left_filled,
    },

    slant = {
        thin   = icons.separators.slant_left_thin,
        filled = icons.separators.slant_left,
    },

    slant_2 = {
        thin   = icons.separators.slant_left_2_thin,
        filled = icons.separators.slant_left_2,
    },

    rounded = {
        thin   = icons.separators.left_rounded_thin,
        filled = icons.separators.left_rounded,
    },
}

M.right= {
    arrow = {
        thin   = icons.separators.right,
        filled = icons.separators.right_filled,
    },

    slant = {
        thin   = icons.separators.slant_right_thin,
        filled = icons.separators.slant_right,
    },

    slant_2 = {
        thin   = icons.separators.slant_right_2_thin,
        filled = icons.separators.slant_right_2,
    },

    rounded = {
        thin   = icons.separators.right_rounded_thin,
        filled = icons.separators.right_rounded,
    },
}

function M.insert_delimiter(delimiter)
    return {
        provider = delimiter,
    }
end

return M
