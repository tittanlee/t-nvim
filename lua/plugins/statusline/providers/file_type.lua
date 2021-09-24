



local colors = require('plugins.statusline.colors')
local icons = require('plugins.statusline.icons')
local utils = require('plugins.statusline.utils')

local M = {}

function M.file_type()
    return vim.bo.filetype:upper()
end

function M.highlight()
    return {
        fg = colors.dark.bg,
        bg = colors.dark.magenta,
        gui = 'bold'
    }
end

function M.components_enabled()
    return utils.check_width()
end

function M.component_opts()
    return {
        M.file_type,
        color     = M.highlight(),
        condition = M.components_enabled
    }
end

function M.inact_component_opts()
    return {
        M.file_type,
        color     = M.highlight(),
    }
end


return M
