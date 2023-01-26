

local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
    return
end

local keymap = vim.keymap.set
local options = {noremap = true, silent = true}

keymap("n", "<Leader>il", ":IndentBlanklineToggle! <CR>", options)
