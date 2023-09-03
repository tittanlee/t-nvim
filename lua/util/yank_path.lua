
local M = {}

local put_selection_reg = function (contents)
    vim.fn.setreg("+", contents)
end


 -- vim.fn.setreg("+", path)
-- vim.notify('Copied "' .. path .. '" to the clipboard!')


M.yank_relative_path = function ()
    local path = vim.fn.expand("%")
    put_selection_reg(path)
    vim.notify("yank_relative_path")
end

M.yank_absolute_path = function ()
    local path = vim.fn.expand("%:p")
    put_selection_reg(path)
    vim.notify("yank_absolute_path")
end

M.yank_directory_path = function ()
    local path = vim.fn.expand("%:p:h")
    put_selection_reg(path)
    vim.notify("yank_directory_path")
end

M.yank_file_name = function ()
    local path = vim.fn.expand("%:t")
    put_selection_reg(path)
    vim.notify("yank_file_name")
end

M.yank_cwd_path = function ()
    local path = vim.loop.cwd()
    put_selection_reg(path)
    vim.notify("yank_cur_working_directory")
end

return M
