local map = vim.keymap.set

-- General Editor Maps
map('n', '<F2>', '<cmd>w<cr>', { desc = 'Save file' })
map('n', '<F3>', '<cmd>source %<cr>', { desc = 'Reload current lua configuration' })
map('n', '<F4>', '<cmd>q<cr>', { desc = 'quit' })
map('n', '<F12>', function()
  vim.cmd([[ %s/\s\+$//e ]])
end, { desc = 'strip trailing white space' })

-- Window Navigation (Alt + hjkl)
map('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window' })

-- Move lines (Alt + jk in Visual/Normal mode) - Like VS Code
map('n', '<A-j>', '<cmd>m .+1<cr>== ', { desc = 'move line down' })
map('n', '<A-k>', '<cmd>m .-2<cr>== ', { desc = 'Move line up' })
map('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move selection down' })
map('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move selection up' })

-- Resize Windows (Control + Arrows)
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- Window Management (Splitting)
-- Use <leader> + s + v/h for intuitive splitting
map('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- Vertical split
map('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' }) -- Horizontal split
map('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' }) -- Reset sizes
map('n', '<leader>sx', '<cmd>close<cr>', { desc = 'Close current split' }) -- Close split

-- move cursor in wrapline paragraph
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- yank file path
map('n', '<leader>cd', '<cmd>let @+ = expand("%:p:h")<CR>', { desc = 'Copy absolute dir path' })
map('n', '<leader>cp', '<cmd>let @+ = expand("%:p")<CR>', { desc = 'Copy absolute path' })
map('n', '<leader>cP', '<cmd>let @+ = expand("%:.")<CR>', { desc = 'Copy relative path' })
map('n', '<leader>cf', '<cmd>let @+ = expand("%:t")<CR>', { desc = 'Copy file name' })

--  Split line
map('n', 'S', 'i<CR><Esc>', { desc = 'Split line at cursor (Reverse J)' })

map('n', ';', ':', { desc = 'shortcut entering command mode' })

-- enhance the yank and paste
-- YANK: Send selected text or current line to System Clipboard (Windows/Linux)
-- Use <leader>y for external sharing (Slack, Chrome, etc.)
-- map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })

-- PASTE: Retrieve text from System Clipboard (e.g., copied from Chrome)
-- Use <leader>p to avoid the latency of the default "p"
-- map({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- DELETE: Delete to Black Hole register (does not overwrite your current yank)
-- Useful when cleaning up code without losing what you just copied
-- map({ "n", "v" }, "d", '"_d', { desc = "Delete to black hole" })
