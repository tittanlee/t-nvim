
local colors = require('plugins.statusline.colors')
local icons = require('plugins.statusline.icons')
local utils = require('plugins.statusline.utils')


local M = {}

function M.file_path()
    return vim.fn.expand('%:~:.')
end

function M.highlight()
    return {
        fg = colors.dark.yellow,
        bg = colors.dark.darkgray,
        gui = 'bold'
    }
end

function M.components_enabled()
    return utils.check_width() and utils.buffer_not_empty()
end

function M.components_icon()
    local filename  = vim.fn.expand("%")
    local extension = vim.fn.expand("%:e")
    local file_icon = require("nvim-web-devicons").get_icon(filename, extension, { default = true })
    return file_icon
end

function M.component_opts()
    return {
        M.file_path,
        icon = M.components_icon(),
        color = M.highlight(),
        condition = M.components_enabled
    }
end

return M
