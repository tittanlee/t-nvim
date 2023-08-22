

local bqf_config = function()
    require("bqf").setup ({
        auto_enable = true,
        auto_resize_height = true, -- highly recommended enable
        preview = {
            auto_preview = true,
            win_height   = 15,
            win_vheight  = 15,
            delay_syntax = 300,
            border_chars = {"┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█"},
            should_preview_cb = function(bufnr, qwinid)
                local ret = true
                local bufname = vim.api.nvim_buf_get_name(bufnr)
                local fsize = vim.fn.getfsize(bufname)
                if fsize > (1024 * 1024) then
                    -- skip file size greater than 300k
                    ret = false
                elseif bufname:match("^fugitive://") then
                    -- skip fugitive buffer
                    ret = false
                end
                return ret
            end,
        },

        func_map = {
            ptogglemode = "z,",
            pscrollup   = "<C-u>",
            pscrolldown = "<C-d>",
        },

        filter = {
            fzf = {
                action_for = {
                    ["ctrl-v"] = "vsplit",
                },
                extra_opts = {
                    "--bind",
                    "ctrl-o:toggle-all",
                    "--prompt", "> ",
                }
            }
        }
    })
end




return {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = bqf_config,
}
