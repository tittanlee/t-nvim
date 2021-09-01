
local colors = require('plugins.statusline.colors')
local icons = require('plugins.statusline.icons')
local utils = require('plugins.statusline.utils')

M = {}

function M.branch_name()
    local gsd = vim.b.gitsigns_status_dict
    return gsd['head']
end

function M.status()
    local add_icon, rmv_icon, chg_icon = '  ', '  ', '  '
    local gsd = vim.b.gitsigns_status_dict
    local add_num = gsd['added']
    local rmv_num = gsd['removed']
    local chg_num = gsd['changed']
    if (add_num == 0 and rmv_num == 0 and chg_num == 0) then
        return ''
    end
    return add_icon .. tostring(add_num) ..
    rmv_icon .. tostring(rmv_num) ..
    chg_icon .. tostring(chg_num)
end

function M.highlight()
    local hl_val = {}
    hl_val.fg = colors.dark.yellow
    hl_val.bg = colors.dark.oceanblue
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
        fg = colors.dark.oceanblue
    }
    return sep
end

function M.components_enabled()
    return type(vim.b.gitsigns_status_dict) ~= 'nil' and
    utils.buffer_not_empty() and
    utils.check_width()
end

function M.component_opts()

    local git_provider = function()
        return M.branch_name() .. M.status()
    end

    local hl        = function() return M.highlight() end
    local left_sep  = function() return M.separators('left') end
    local right_sep = function() return M.separators('right') end
    local enabled   = function() return M.components_enabled() end

    local component_opts = {}
    component_opts.provider  = git_provider
    component_opts.hl        = hl
    component_opts.left_sep  = left_sep
    component_opts.right_sep = right_sep
    component_opts.enabled   = enabled
    component_opts.icon      = ' '
    return component_opts
end


return M
