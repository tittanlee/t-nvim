

qf_lib   = require('library.quick_fix')
file_path_lib = require('library.file_path')

-- better window movement
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { silent = true })

-- buffer ontrol - switch and wipe - instead of nvim_bufferline plugin
-- vim.api.nvim_set_keymap("n", "<M-h>", ":bnext<CR>"    , { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<M-l>", ":bprevious<CR>", { noremap = true, silent = true })

-- bdelete instead of bufdelete plugin
-- vim.api.nvim_set_keymap("n", "<M-w>", ":bdelete<CR>"  , { noremap = true, silent = true })

-- jk mapping to <ESC> return normal mode
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { silent = true })
vim.api.nvim_set_keymap("v", "jk", "<ESC>", { silent = true })

-- Move current line / block with Alt-j/k ala vscode.
vim.api.nvim_set_keymap("n", "<M-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<M-j>", ":m '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<M-k>", ":m '<-2<CR>gv-gv", { noremap = true, silent = true })

-- neovim paste remapping to shift+insert {{{
vim.api.nvim_set_keymap("i", "<S-Insert>", "<C-R>+", { noremap = true })
vim.api.nvim_set_keymap("c", "<S-Insert>", "<C-R>+", { noremap = true })
vim.api.nvim_set_keymap("t", "<S-Insert>", "<C-R>+", { noremap = true })

-- directly entering command mode instead of ;
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })

-- open / source vimrc file quickly
vim.api.nvim_set_keymap("n", "<LEADER>rv", ":luafile $MYVIMRC <CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<LEADER>ev", ":edit $MYVIMRC <CR>"   , { noremap = true, silent = false })

-- split the windo
vim.api.nvim_set_keymap("n", "<LEADER>sv", ":vsplit <CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LEADER>sh", ":split  <CR>",  { noremap = true, silent = true })

-- terminal insert/normal mode switch
vim.api.nvim_set_keymap("t", "<C-\\><C-\\>", "<C-\\><C-n>",  { noremap = true, silent = true })

-- folding level customized
vim.api.nvim_set_keymap("n", "z0", ":set foldlevel=0<CR>",  { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "z1", ":set foldlevel=1<CR>",  { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "z2", ":set foldlevel=2<CR>",  { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "z3", ":set foldlevel=3<CR>",  { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "z4", ":set foldlevel=4<CR>",  { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "z5", ":set foldlevel=5<CR>",  { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "z6", ":set foldlevel=6<CR>",  { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "z7", ":set foldlevel=7<CR>",  { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "z8", ":set foldlevel=8<CR>",  { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "z9", ":set foldlevel=9<CR>",  { noremap = true, silent = false })


-- F2 save
vim.api.nvim_set_keymap("n", "<F2>", ":w! <CR>", { silent = false })
vim.api.nvim_set_keymap("i", "<F2>", "<ESC> :w! <CR>", { silent = false })

-- F3 reload script
vim.api.nvim_set_keymap("n", "<F3>", ":so % <CR>", { silent = false })
vim.api.nvim_set_keymap("i", "<F3>", "<ESC> :so % <CR>", { silent = false })

-- F4 quit
vim.api.nvim_set_keymap("n", "<F4>", ":quit! <CR>", { silent = true })
vim.api.nvim_set_keymap("i", "<F4>", "<ESC> :quit! <CR>", { silent = true })

-- F5 toggle quickfix window
vim.api.nvim_set_keymap("n", "<F5>", ":lua qf_lib.toggle()<CR>", { silent = true })

-- F6 to switch absolute or relative file path
vim.api.nvim_set_keymap("n", "<F6>", ":lua file_path_lib.fname_switch()<CR>", { silent = true})

-- F7 toggle git related information
vim.api.nvim_set_keymap("n", "<F7>", ":lua ENV.status_show_git_info = not ENV.status_show_git_info<CR>", { silent = true })

-- F8 toggle current function in status line
vim.api.nvim_set_keymap("n", "<F8>", ":lua ENV.status_show_current_func = not ENV.status_show_current_func<CR>", { silent = true })

