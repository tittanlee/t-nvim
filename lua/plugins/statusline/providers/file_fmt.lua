

local colors = require('plugins.statusline.colors')
local icons  = require('resource.icons')
local utils  = require('plugins.statusline.utils')

local M = {}

function M.file_format()
    local fft = vim.bo.fileformat:upper()
    local icon = {
        ['UNIX'] = icons.os_logo.unix,
        ['MAC']  = icons.os_logo.mac,
        ['DOS']  = icons.os_logo.dos,
    }
    return icon[fft] .. " " .. fft
end

function M.highlight()
    return {
        fg = colors.dark.black,
        bg = colors.dark.skyblue,
        gui = 'bold'
    }
end

function M.components_enabled()
    return utils.check_width() and utils.buffer_not_empty()
end

function M.component_opts()
    return {
        M.file_format,
        color = M.highlight(),
        cond  = M.components_enabled
    }
end

return M
