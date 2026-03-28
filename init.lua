-- Set the leader keys before loading any plugins
-- This ensures that plugin mappings use the correct leader key
vim.g.mapleader = ' ' -- space as leader key
vim.g.maplocalleader = ','

-- 1. Load basic editor options (UI, Indentation, etc.)
require('core.options')

-- 2. Initialize the plugin manager (Lazy.nvim)
require('core.lazy')

-- 3. Load global keybindings
require('core.keymaps')

-- 4. Load autocmd
require('core.autocmd')
