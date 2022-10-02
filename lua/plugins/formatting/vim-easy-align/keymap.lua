

local keymap = vim.keymap.set
local options = {noremap = true, silent = true}

keymap("n", "ga", "<plug>(EasyAlign)", options)
keymap("x", "ga", "<plug>(EasyAlign)", options)
