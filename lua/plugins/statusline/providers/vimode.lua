
local vi_mode_utils = require('feline.providers.vi_mode')

local colors = require('plugins.statusline.colors')
local icons = require('plugins.statusline.icons')

local M = {}

function M.vim_mode()
    icon = ''
    mode = vim.fn.mode():upper()
    return icon .. " " .. mode
end

function M.highlight()
    local hl_val = {}
    hl_val.fg = colors.dark.black
    -- hl_val.bg = colors.dark.violet
    hl_val.bg = vi_mode_utils.get_mode_color()
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
        -- fg = colors.dark.violet,
        fg = vi_mode_utils.get_mode_color()
    }
    return sep
end

function M.components_enabled()
    return true
end

function M.component_opts()
    local mode      = function() return M.vim_mode() end
    local hl        = function() return M.highlight() end
    local left_sep  = function() return M.separators('left') end
    local right_sep = function() return M.separators('right') end
    local enabled   = function() return M.components_enabled() end

    local component_opts = {}
    component_opts.provider  = mode
    component_opts.hl        = hl
    component_opts.left_sep  = left_sep
    component_opts.right_sep = right_sep
    component_opts.enabled   = enabled

    return component_opts
end

return M
