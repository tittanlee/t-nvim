

local M = {}

M.current_context = function()
    local f = require'nvim-treesitter'.statusline({
        indicator_size = 80,
        type_patterns = {"class", "function", "method", "interface", "type_spec", "table", "if_statement", "for_statement", "for_in_statement"},
        transform_fn = function(line, _node) return line:gsub('%s*[%[%(%{]*%s*$', '') end,
    })
    local context = string.format("%s", f) -- convert to string, it may be a empty ts node

    if context == "vim.NIL" then
        return " "
    end
    return " " .. context
end

return M
