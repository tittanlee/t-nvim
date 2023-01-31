

local keymap = vim.keymap.set
local options = {noremap = true, silent = true}

keymap("n", "<Leader>ea", "<plug>(EasyAlign)", options)
keymap("x", "<Leader>ea", "<plug>(EasyAlign)", options)
keymap("x", "<Leader>ela", "<Plug>(LiveEasyAlign)", options)
