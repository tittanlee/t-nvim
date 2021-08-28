local colors = require('plugins.statusline.colors')
local icons = require('plugins.statusline.icons')
local utils = require('plugins.statusline.utils')

local M = {}

function M.getentags_progress()
    local tag_progress = vim.fn['gutentags#inprogress']()
    local ctags = tag_progress[1]
    local gtags = tag_progress[2]
    local msg = ''
    if type(ctags) ~= 'nil' then
        msg = msg .. '⏳' .. ctags
    end
    if type(gtags) ~= 'nil' then
        msg = msg .. '⏳' .. gtags
    end
    return msg
end

function M.highlight()
    local hl_val = {}
    hl_val.fg = colors.dark.lightgray
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
    local tag_progress = vim.fn['gutentags#inprogress']()
    return type(tag_progress[1]) ~= 'nil' or type(tag_progress[2]) ~= 'nil'
end

function M.component_opts()
    local tag_progress = function() return M.getentags_progress() end
    local hl           = function() return M.highlight() end
    local left_sep     = function() return M.separators('left') end
    local right_sep    = function() return M.separators('right') end
    local enabled      = function() return M.components_enabled() end

    local component_opts = {}
    component_opts.provider  = tag_progress
    component_opts.hl        = hl
    component_opts.left_sep  = left_sep
    component_opts.right_sep = right_sep
    component_opts.enabled   = enabled

    return component_opts
end

return M
