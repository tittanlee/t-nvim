

local status_ok, bufferline= pcall(require, "bufferline")
if not status_ok then 
    return
end

local keymap = vim.keymap.set
local options = {noremap = true, silent = true}

-- These commands will navigate through buffers in order
keymap("n", "<M-h>", ":BufferLineCyclePrev <CR>", options)
keymap("i", "<M-h>", "<ESC> :BufferLineCyclePrev <CR>", options)
keymap("n", "<M-l>", ":BufferLineCycleNext <CR>", options)
keymap("i", "<M-l>", "<ESC> :BufferLineCycleNext <CR>", options)


-- These commands will move the current buffer backwards or forwards in the bufferline
keymap("n", "<C-1>", ":BufferLineMovePrev <CR>", options)
keymap("i", "<C-1>", "<ESC> :BufferLineMovePrev <CR>", options)
keymap("n", "<C-2>", ":BufferLineMoveNext <CR>", options)
keymap("i", "<C-2>", "<ESC> :BufferLineMoveNext <CR>", options)

-- pick the buffer
keymap("n", "<LEADER>b", ":BufferLinePick <CR>", options)

