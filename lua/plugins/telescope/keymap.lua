
-- files fuzzy search 
vim.api.nvim_set_keymap("n", "<Leader>ff", ":lua require('telescope.builtin').find_files {} <CR>", {})

-- files manager
vim.api.nvim_set_keymap("n", "<Leader>fm", ":lua require('telescope.builtin').file_browser {} <CR>", {})

-- buffers list
vim.api.nvim_set_keymap("n", "<Leader>fb", ":lua require('telescope.builtin').buffers {} <CR>", {})

-- keymapping list
vim.api.nvim_set_keymap("n", "<Leader>fk", ":lua require('telescope.builtin').keymaps {} <CR>", {})

-- colorscheme list
vim.api.nvim_set_keymap("n", "<Leader>fc", ":lua require('telescope.builtin').colorscheme {} <CR>", {})

-- vim help tags
vim.api.nvim_set_keymap("n", "<Leader>fh", ":lua require('telescope.builtin').help_tags {} <CR>", {})
