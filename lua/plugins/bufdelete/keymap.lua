
bufdel = require("bufdelete").bufdelete

vim.api.nvim_set_keymap("n", "<M-w>", ":lua bufdel(0, true) <CR>", {noremap = true, silent = true})
