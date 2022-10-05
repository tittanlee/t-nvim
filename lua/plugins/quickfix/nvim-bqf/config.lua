
local status_ok, bqf = pcall(require, "bqf")
if not status_ok then
    return
end


bqf.setup ({
    auto_enable = true,
    preview = {
        auto_preview = true,
        win_height   = 15,
        win_vheight  = 15,
        delay_syntax = 300,
        border_chars = {'┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█'},
        should_preview_cb = function(bufnr, qwinid)
            local ret = true
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            local fsize = vim.fn.getfsize(bufname)
            if fsize > 300 * 1024 then
                -- skip file size greater than 300k
                ret = false
            elseif bufname:match('^fugitive://') then
                -- skip fugitive buffer
                ret = false
            end
            return ret
        end,
    },

    func_map = {
        ptogglemode = 'z,',
        pscrollup   = '<C-u>',
        pscrolldown = '<C-d>',
    },

    filter = {
        fzf = {
            action_for = {
                ['ctrl-v'] = 'vsplit',
            },
            extra_opts = {
                '--bind',
                'ctrl-o:toggle-all',
                '--prompt', '> ',
            }
        }
    }
})
