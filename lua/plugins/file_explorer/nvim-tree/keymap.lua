

local keymap = vim.keymap.set
local options = {noremap = true, silent = true}

local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then 
    return 
end



keymap('n', '<LEADER>w', ':NvimTreeToggle<CR>', options)
keymap('n', '<LEADER>e', ':NvimTreeFindFile<CR>', options)


