
local colors = require('plugins.statusline.colors')
local icons = require('plugins.statusline.icons')

local M = {}


function M.left_sep()
    return icons.separators.left_rounded
end

function M.right_sep()
    return icons.separators.right_rounded
end

function M.left_component_opts(highlight, condition)
    return {
        M.left_sep,
        color = {
            fg = highlight.bg,
            -- bg = highlight.fg
        },
        condition = function() return condition() end
    }
end

function M.right_component_opts(highlight, condition)
    return {
        M.right_sep,
        color = {
            fg = highlight.bg,
            -- bg = highlight.fg
        },
        condition = function() return condition() end
    }
end

function M.space_component_opts()
    return {
        function() return ' ' end,
    }
end




return M
