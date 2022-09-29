

local api = vim.api
local colors = require('plugins.statusline.colors')
local icons  = require('resource.icons')

local M = {}

function M.position(_, winid)
    return string.format('%3d:%-2d', unpack(api.nvim_win_get_cursor(winid)))
end

function M.line_percentage(_, winid)
    local curr_line = api.nvim_win_get_cursor(winid)[1]
    local lines = api.nvim_buf_line_count(api.nvim_win_get_buf(winid))

    if curr_line == 1 then
        return "Top"
    elseif curr_line == lines then
        return "Bot"
    else
        return string.format('%2d%%%%', math.ceil(curr_line / lines * 99))
    end
end

function M.scroll_bar(_, winid)
    local blocks =  {
        icons.dingbats.block_1, icons.dingbats.block_2,
        icons.dingbats.block_3, icons.dingbats.block_4,
        icons.dingbats.block_5, icons.dingbats.block_6,
        icons.dingbats.block_7, icons.dingbats.block_8,
    }
    local width = 2

    local curr_line = api.nvim_win_get_cursor(winid)[1]
    local lines = api.nvim_buf_line_count(api.nvim_win_get_buf(winid))

    local index = math.floor(curr_line / lines * (#blocks - 1)) + 1

    return string.rep(blocks[index], width)
end

function M.highlight()
    return {
        fg = colors.dark.black,
        bg = colors.dark.cyan,
        gui = 'bold'
    }
end

function M.components_enabled()
    return true
end

function M.component_opts()
    return {
        function()
            return M.line_percentage(_,0) .. M.position(_,0) .. M.scroll_bar(_,0)
        end,
        icon  = icons.dingbats.line_nu,
        color = M.highlight(),
        cond  = M.components_enabled
    }
end

return M
