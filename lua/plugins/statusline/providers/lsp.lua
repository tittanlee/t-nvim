

local colors = require('plugins.statusline.colors')
local icons = require('plugins.statusline.icons')
local utils = require('plugins.statusline.utils')

local M = {}

function M.coc_diagnostic_info()
    -- check table is empty
    local icon = '⚡'

    local diagnostics = {}
    diagnostics = vim.b.coc_diagnostic_info
    local error   = diagnostics['error']
    local warning = diagnostics['warning']
    return string.format("%sE:%d W:%d", icon, error, warning)
end

function M.highlight()
    local hl_val = {}
    hl_val.fg = colors.dark.black
    hl_val.bg = colors.dark.red
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
        fg = colors.dark.red
    }
    return sep
end

function M.components_enabled()
    return type(vim.b.coc_diagnostic_info) ~= 'nil' and
    utils.buffer_not_empty() and
    utils.check_width()
end

function M.component_opts()
    local diagnostic = function() return M.coc_diagnostic_info() end
    local hl         = function() return M.highlight() end
    local left_sep   = function() return M.separators('left') end
    local right_sep  = function() return M.separators('right') end
    local enabled    = function() return M.components_enabled() end

    local component_opts = {}
    component_opts.provider  = diagnostic
    component_opts.hl        = hl
    component_opts.left_sep  = left_sep
    component_opts.right_sep = right_sep
    component_opts.enabled   = enabled

    return component_opts
end


return M
