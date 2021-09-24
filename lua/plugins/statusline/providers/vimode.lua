
local colors = require('plugins.statusline.colors')
local icons = require('plugins.statusline.icons')

local M = {}

function M.vim_mode()
    mode = vim.fn.mode():upper()
    return mode
end

function M.highlight()
    return {
        fg = colors.dark.black,
        bg = colors.dark.violet,
        gui = 'bold'
    }
end


function M.components_enabled()
    return true
end

function M.component_opts()
    return {
        M.vim_mode,
        icon = '',
        color = M.highlight(),
        condition = M.components_enabled
    }
end

return M
