
vim.g.interestingWordsGUIColors = {
    '#8CCBEA',
    '#A4E57E',
    '#FFDB72',
    '#FF7272',
    '#FFB3FF',
    '#9999FF',
    '#FF3FfF',
    '#8F3F4F',
}

-- to disable default mapping
vim.g.interestingWordsDefaultMappings = 0

-- randomise the colors
vim.g.interestingWordsRandomiseColors = 1

vim.api.nvim_set_keymap("n", "<Leader>k", ":call InterestingWords('n')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Leader>k", ":call InterestingWords('v')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>K", ":call UncolorAllWords()<CR>",     { noremap = true, silent = true })


vim.api.nvim_set_keymap("n", "n", ":call WordNavigation(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", ":call WordNavigation(0)<CR>", { noremap = true, silent = true })

