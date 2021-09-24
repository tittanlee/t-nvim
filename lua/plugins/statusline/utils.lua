local M = {}

function M.buffer_not_empty()
    if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
        return true
    end
    return false
end

function M.check_width()
    local squeeze_width = vim.fn.winwidth(0)
    if squeeze_width > 100 then
        return true
    end
    return false
end

return M
