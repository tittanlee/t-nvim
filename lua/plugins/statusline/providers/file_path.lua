
local colors = require('plugins.statusline.colors')
local icons  = require('resource.icons')
local utils  = require('plugins.statusline.utils')


local M = {}

function M.file_path()
    local file_path_array = {
        ['absolute'] = vim.fn.expand('%:p'),
        ['relative'] = vim.fn.expand('%:~:.'),
        ['tail']     = vim.fn.expand('%:t')
    }
    return file_path_array[ENV.status_show_file_path]
end

function M.highlight()
    return {
        fg = colors.dark.yellow,
        bg = colors.dark.darkgray,
        gui = 'bold'
    }
end

function M.components_enabled()
    return utils.buffer_not_empty()
end

function M.components_icon()
    local filename  = vim.fn.expand("%")
    local extension = vim.fn.expand("%:e")
    local file_icon = require("nvim-web-devicons").get_icon(filename, extension, { default = true })
    return file_icon
end

function M.component_opts()
    return {
        M.file_path,
        icon  = M.components_icon(),
        color = M.highlight(),
        cond  = M.components_enabled
    }
end

return M
