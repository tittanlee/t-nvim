

local cursor = require('feline.providers.cursor')

local colors = require('plugins.statusline.colors')
local icons = require('plugins.statusline.icons')

local M = {}

function M.cursor_position()
    return cursor.line_percentage() .. ' ' .. cursor.scroll_bar()
end

function M.highlight()
    local hl_val = {}
    hl_val.fg = colors.dark.black
    hl_val.bg = colors.dark.cyan
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
        fg = colors.dark.cyan
    }
    return sep
end

function M.components_enabled()
    return true
end

function M.component_opts()
    local cur_pos  = function() return M.cursor_position() end
    local hl        = function() return M.highlight() end
    local left_sep  = function() return M.separators('left') end
    local right_sep = function() return M.separators('right') end
    local enabled   = function() return M.components_enabled() end

    local component_opts = {}
    component_opts.provider  = cur_pos
    component_opts.hl        = hl
    component_opts.left_sep  = left_sep
    component_opts.right_sep = right_sep
    component_opts.enabled   = enabled

    return component_opts
end

return M
