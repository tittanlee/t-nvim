

local file = require('feline.providers.file')

local colors = require('plugins.statusline.colors')
local icons = require('plugins.statusline.icons')
local utils = require('plugins.statusline.utils')

local M = {}

function M.file_encoding()
    local icon = '👽 '
    local fenc = file.file_encoding()
    return icon .. fenc
end

function M.highlight()
    local hl_val = {}
    hl_val.fg = colors.dark.black
    hl_val.bg = colors.dark.yellow
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
        fg = colors.dark.yellow
    }
    return sep
end

function M.components_enabled()
    return utils.check_width() and utils.buffer_not_empty()
end

function M.component_opts()
    local file_enc  = function() return M.file_encoding() end
    local hl        = function() return M.highlight() end
    local left_sep  = function() return M.separators('left') end
    local right_sep = function() return M.separators('right') end
    local enabled   = function() return M.components_enabled() end

    local component_opts = {}
    component_opts.provider  = file_enc
    component_opts.hl        = hl
    component_opts.left_sep  = left_sep
    component_opts.right_sep = right_sep
    component_opts.enabled   = enabled

    return component_opts
end

return M
