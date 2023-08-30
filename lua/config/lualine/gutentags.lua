


local M = {}

M.progress = function()
    local tag_progress = vim.fn['gutentags#inprogress']()
    local ctags = tag_progress[1]
    local gtags = tag_progress[2]
    local msg = {}
    if type(ctags) ~= 'nil' then
        -- msg = msg .. '⏳' .. ctags
        table.insert(msg, string.format("%s ⏳", ctags))
    end
    if type(gtags) ~= 'nil' then
        -- msg = msg .. '⏳' .. gtags
        table.insert(msg, string.format("%s ⏳", gtags))
    end

    -- return msg
    return table.concat(msg, "|")
end

return M
