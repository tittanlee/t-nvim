
local file = require('feline.providers.file')

local colors = require('plugins.statusline.colors')
local icons = require('plugins.statusline.icons')
local utils = require('plugins.statusline.utils')


local M = {}

function M.file_path(type)
    return file.file_info({
        type = type
    })
end

function M.highlight()
    local hl_val = {}
    hl_val.fg = colors.dark.yellow
    hl_val.bg = colors.dark.darkgray
    hl_val.style = 'bold'
    return hl_val
end

function M.separators(direction)
    local sep = {}

    if (direction == 'left') then
        sep.str = icons.separators.left_rounded
    else
        sep.str = icons.separators.right_rounded
    end

    sep.hl = {
        fg = colors.dark.darkgray
    }
    return sep
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
    local file_path = function() return M.file_path('relative') end
    local hl        = function() return M.highlight() end
    local left_sep  = function() return M.separators('left') end
    local right_sep = function() return M.separators('right') end
    local enabled   = function() return M.components_enabled() end
    local file_icon = function() return M.components_icon() end

    local component_opts = {}
    component_opts.provider  = file_path
    component_opts.hl        = hl
    component_opts.left_sep  = left_sep
    component_opts.right_sep = right_sep
    component_opts.enabled   = enabled
    component_opts.icon      = file_icon

    return component_opts
end

return M
