

vim.api.nvim_set_keymap("n", "<Leader>rw", ":Grepper -cword<CR> <CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>ra", ":Grepper -cword -append<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>ro", ":Grepper<CR>", {noremap = true})
