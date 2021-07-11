



-- These commands will navigate through buffers in order
vim.api.nvim_set_keymap("n", "<M-1>", ":BufferLineCyclePrev <CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-1>", "<ESC> :BufferLineCyclePrev <CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-2>", ":BufferLineCycleNext <CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-2>", "<ESC> :BufferLineCycleNext <CR>", { noremap = true, silent = true })


-- These commands will move the current buffer backwards or forwards in the bufferline
vim.api.nvim_set_keymap("n", "<C-1>", ":BufferLineMovePrev <CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-1>", "<ESC> :BufferLineMovePrev <CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-2>", ":BufferLineMoveNext <CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-2>", "<ESC> :BufferLineMoveNext <CR>", { noremap = true, silent = true })

-- pick the buffer
vim.api.nvim_set_keymap("n", "<LEADER>b", ":BufferLinePick <CR>", { noremap = true, silent = true })
