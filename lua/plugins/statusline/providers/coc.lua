

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
    return {
        fg = colors.dark.bg,
        bg = colors.dark.magenta,
        style = 'bold'
    }
end

function M.current_function.components_enabled()
    return vim.b.coc_current_function ~= '' and
    vim.fn.exists('b:coc_current_function') ~= 0 and
    ENV.status_show_current_func
end

function M.current_function.component_opts()
    return {
        M.current_function.provider,
        color = M.current_function.highlight(),
        condition = M.current_function.components_enabled
    }
end

---------- coc diagnostics information ------------
function M.diagnostics.provider()
    -- check table is empty
    -- local icon = '⚡'
    -- local diagnostics = {}
    local diagnostics = vim.b.coc_diagnostic_info
    local error   = diagnostics['error']
    local warning = diagnostics['warning']
    return string.format("E:%d W:%d", error, warning)
end

function M.diagnostics.highlight()
    return {
        fg = colors.dark.black,
        bg = colors.dark.red,
        gui = 'bold'
    }
end

function M.diagnostics.components_enabled()
    return type(vim.b.coc_diagnostic_info) ~= 'nil' and
    utils.buffer_not_empty() and
    utils.check_width()
end

function M.diagnostics.component_opts()
    return {
        M.diagnostics.provider,
        icon = '⚡',
        color = M.diagnostics.highlight(),
        condition = M.diagnostics.components_enabled
    }
end

return M
