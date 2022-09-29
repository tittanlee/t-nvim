
local icons  = require('resource.icons')
local colors = require('plugins.statusline.colors')
local utils  = require('plugins.statusline.utils')

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
    return {
        fg = colors.dark.yellow,
        bg = colors.dark.oceanblue,
        gui = 'bold'
    }
end

function M.components_enabled()
    return type(vim.b.gitsigns_status_dict) ~= 'nil' and
    utils.buffer_not_empty() and
    utils.check_width() and
    ENV.status_show_git_info
end

function M.component_opts()
    return {
        function()
            return M.branch_name() .. M.status()
        end,
        icon  = icons.git.branch,
        color = M.highlight(),
        cond  = M.components_enabled
    }
end


return M
