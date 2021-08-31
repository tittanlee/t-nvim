

local colors = require('plugins.statusline.colors')
local icons = require('plugins.statusline.icons')
local utils = require('plugins.statusline.utils')

local M = {
    current_function = {},
    diagnostics = {}
}

---------- coc current function ------------
function M.current_function.provider()
    return vim.b.coc_current_function
end

function M.current_function.highlight()
    local hl_val = {}
    hl_val.fg = colors.dark.bg
    hl_val.bg = colors.dark.magenta
    hl_val.style = 'bold'
    return hl_val
end

function M.current_function.separators(direction)
    local sep = {}

    if (direction == 'left') then
        sep.str = icons.separators.left_rounded
    else
        sep.str = icons.separators.right_rounded
    end

    sep.hl = {
        fg = colors.dark.magenta
    }
    return sep
end

function M.current_function.components_enabled()
    return vim.b.coc_current_function ~= '' and
    vim.fn.exists('b:coc_current_function') ~= 0 and
    ENV.show_current_func
end

function M.current_function.component_opts()
    local coc_fun   = function() return M.current_function.provider() end
    local hl        = function() return M.current_function.highlight() end
    local left_sep  = function() return M.current_function.separators('left') end
    local right_sep = function() return M.current_function.separators('right') end
    local enabled   = function() return M.current_function.components_enabled() end

    local component_opts = {}
    component_opts.provider  = coc_fun
    component_opts.hl        = hl
    component_opts.left_sep  = left_sep
    component_opts.right_sep = right_sep
    component_opts.enabled   = enabled

    return component_opts
end

---------- coc diagnostics information ------------
function M.diagnostics.provider()
    -- check table is empty
    local icon = '⚡'

    local diagnostics = {}
    diagnostics = vim.b.coc_diagnostic_info
    local error   = diagnostics['error']
    local warning = diagnostics['warning']
    return string.format("%sE:%d W:%d", icon, error, warning)
end

function M.diagnostics.highlight()
    local hl_val = {}
    hl_val.fg = colors.dark.black
    hl_val.bg = colors.dark.red
    hl_val.style = 'bold'
    return hl_val
end

function M.diagnostics.separators(direction)
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

function M.diagnostics.components_enabled()
    return type(vim.b.coc_diagnostic_info) ~= 'nil' and
    utils.buffer_not_empty() and
    utils.check_width()
end

function M.diagnostics.component_opts()
    local diagnostics = function() return M.diagnostics.provider() end
    local hl         = function() return M.diagnostics.highlight() end
    local left_sep   = function() return M.diagnostics.separators('left') end
    local right_sep  = function() return M.diagnostics.separators('right') end
    local enabled    = function() return M.diagnostics.components_enabled() end

    local component_opts = {}
    component_opts.provider  = diagnostics
    component_opts.hl        = hl
    component_opts.left_sep  = left_sep
    component_opts.right_sep = right_sep
    component_opts.enabled   = enabled

    return component_opts
end

return M
