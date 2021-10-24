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
    return {
        fg = colors.dark.lightgray,
        bg = colors.dark.darkgray,
        gui = 'bold'
    }
end

function M.components_enabled()
    local tag_progress = vim.fn['gutentags#inprogress']()
    return type(tag_progress[1]) ~= 'nil' or type(tag_progress[2]) ~= 'nil'
end

function M.component_opts()
    return {
        M.getentags_progress,
        color = M.highlight(),
        cond  = M.components_enabled
    }
end

return M
