



local colors = require('plugins.statusline.colors')
local icons = require('plugins.statusline.icons')
local utils = require('plugins.statusline.utils')

local M = {}

---------- coc current function ------------
function M.provider()
    return require("nvim-gps").get_location()
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
    return require("nvim-gps").is_available() and
    ENV.status_show_current_func and
    utils.check_width()
end

function M.component_opts()
    local cursor_gps = function() return M.provider() end
    local hl         = function() return M.highlight() end
    local left_sep   = function() return M.separators('left') end
    local right_sep  = function() return M.separators('right') end
    local enabled    = function() return M.components_enabled() end

    local component_opts = {}
    component_opts.provider  = cursor_gps
    component_opts.hl        = hl
    component_opts.left_sep  = left_sep
    component_opts.right_sep = right_sep
    component_opts.enabled   = enabled

    return component_opts
end



return M
