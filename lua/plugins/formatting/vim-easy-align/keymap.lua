

local keymap = vim.keymap.set
local options = {noremap = true, silent = true}

keymap("n", "ea", "<plug>(EasyAlign)", options)
keymap("x", "ea", "<plug>(EasyAlign)", options)
keymap("x", "<Leader>ea", "<Plug>(LiveEasyAlign)", options)
