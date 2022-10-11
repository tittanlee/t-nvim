

-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
local qf = require('utils.quickfix')



-- better window movement
keymap('n', '<C-h>', '<C-w>h', { silent = true })
keymap('n', '<C-j>', '<C-w>j', { silent = true })
keymap('n', '<C-k>', '<C-w>k', { silent = true })
keymap('n', '<C-l>', '<C-w>l', { silent = true })

-- buffer ontrol - switch and wipe - instead of nvim_bufferline plugin
keymap('n', '<M-h>', ':bnext<CR>'    , { noremap = true, silent = true })
keymap('n', '<M-l>', ':bprevious<CR>', { noremap = true, silent = true })

-- bdelete instead of bufdelete plugin
keymap('n', '<M-w>', ':bdelete<CR>'  , { noremap = true, silent = true })

-- jk mapping to <ESC> return normal mode
keymap('i', 'jk', '<ESC>', { silent = true })
keymap('v', 'jk', '<ESC>', { silent = true })

-- Move current line / block with Alt-j/k ala vscode.
keymap('n', '<M-j>', ':m .+1<CR>==', { noremap = true, silent = true })
keymap('n', '<M-k>', ':m .-2<CR>==', { noremap = true, silent = true })
keymap('i', '<M-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
keymap('i', '<M-k>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })
keymap('x', '<M-j>', ":m '>+1<CR>gv-gv", { noremap = true, silent = true })
keymap('x', '<M-k>', ":m '<-2<CR>gv-gv", { noremap = true, silent = true })

-- neovim paste remapping to shift+insert {{{
keymap('i', '<S-Insert>', '<C-R>+', { noremap = true })
keymap('c', '<S-Insert>', '<C-R>+', { noremap = true })
keymap('t', '<S-Insert>', '<C-R>+', { noremap = true })

-- directly entering command mode instead of ;
keymap('n', ';', ':', { noremap = true })

-- open / source vimrc file quickly
keymap('n', '<LEADER>rv', ':luafile $MYVIMRC <CR>', { noremap = true, silent = false })
keymap('n', '<LEADER>ev', ':edit $MYVIMRC <CR>'   , { noremap = true, silent = false })

-- split the windo
keymap('n', '<LEADER>sv', ':vsplit <CR>', { noremap = true, silent = true })
keymap('n', '<LEADER>sh', ':split  <CR>', { noremap = true, silent = true })

-- terminal insert/normal mode switch
keymap('t', '<ESC><ESC>', '<C-\\><C-n>',  { noremap = true, silent = true })

-- folding level customized
keymap('n', 'z0', ':set foldlevel=0<CR>',  { noremap = true, silent = false })
keymap('n', 'z1', ':set foldlevel=1<CR>',  { noremap = true, silent = false })
keymap('n', 'z2', ':set foldlevel=2<CR>',  { noremap = true, silent = false })
keymap('n', 'z3', ':set foldlevel=3<CR>',  { noremap = true, silent = false })
keymap('n', 'z4', ':set foldlevel=4<CR>',  { noremap = true, silent = false })
keymap('n', 'z5', ':set foldlevel=5<CR>',  { noremap = true, silent = false })
keymap('n', 'z6', ':set foldlevel=6<CR>',  { noremap = true, silent = false })
keymap('n', 'z7', ':set foldlevel=7<CR>',  { noremap = true, silent = false })
keymap('n', 'z8', ':set foldlevel=8<CR>',  { noremap = true, silent = false })
keymap('n', 'z9', ':set foldlevel=9<CR>',  { noremap = true, silent = false })

-- easier moving of code blocks
keymap('v', '<', '<gv', { noremap = true, silent = false })
keymap('v', '>', '>gv', { noremap = true, silent = false })

-- toggle quickfix window
keymap('n', '<M-q>',  qf.toggle, { silent = true })









-- F2 save
keymap('n', '<F2>', ':w! <CR>', { silent = false })
keymap('i', '<F2>', '<ESC> :w! <CR>', { silent = false })

-- F3 reload script
keymap('n', '<F3>', ':so % <CR>', { silent = false })
keymap('i', '<F3>', '<ESC> :so % <CR>', { silent = false })

-- F4 quit
keymap('n', '<F4>', ':quit! <CR>', { silent = true })
keymap('i', '<F4>', '<ESC> :quit! <CR>', { silent = true })

-- F6 to switch absolute or relative file path
keymap('n', '<F6>', ':lua file_path_lib.fname_switch()<CR>', { silent = true})

-- F7 toggle git related information
keymap('n', '<F7>', ':lua ENV.status_show_git_info = not ENV.status_show_git_info<CR>', { silent = true })

-- F8 toggle current function in status line
keymap('n', '<F8>', ':lua ENV.status_show_current_func = not ENV.status_show_current_func<CR>', { silent = true })

-- F12 strip trailing white space
keymap('n', '<F12>', function() vim.cmd[[ %s/\s\+$//e ]] end, { noremap=true, silent = true })


