

local colors = require('plugins.statusline.colors')
local icons = require('plugins.statusline.icons')

local M = {}

function M.coc_current_function()
    return vim.b.coc_current_function
end

function M.highlight()
    local hl_val = {}
    hl_val.fg = colors.dark.bg
    hl_val.bg = colors.dark.magenta
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
        fg = colors.dark.magenta
    }
    return sep
end

function M.components_enabled()
    return vim.b.coc_current_function ~= '' and
    vim.fn.exists('b:coc_current_function') ~= 0 and
    ENV.show_current_func
end

function M.component_opts()
    local coc_fun   = function() return M.coc_current_function() end
    local hl        = function() return M.highlight() end
    local left_sep  = function() return M.separators('left') end
    local right_sep = function() return M.separators('right') end
    local enabled   = function() return M.components_enabled() end

    local component_opts = {}
    component_opts.provider  = coc_fun
    component_opts.hl        = hl
    component_opts.left_sep  = left_sep
    component_opts.right_sep = right_sep
    component_opts.enabled   = enabled

    return component_opts
end

return M
