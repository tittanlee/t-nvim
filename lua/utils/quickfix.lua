
local M = {}


function M.toggle()
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
        if win["quickfix"] == 1 then
            qf_exists = true
            break
        end
    end

    if qf_exists == true then
        vim.cmd "cclose"
    else
        vim.cmd "copen"
    end
    -- if qf_exists == true then
    --     vim.cmd "cclose"
    --     return
    -- end
    -- if not vim.tbl_isempty(vim.fn.getqflist()) then
    --     vim.cmd "copen"
    -- end
end


return M