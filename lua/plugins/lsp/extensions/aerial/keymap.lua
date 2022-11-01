
local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
    return
end

local keymap = vim.keymap.set
local options = {noremap = true, silent = true}

keymap("n", "<Leader>t", "<cmd>AerialToggle<CR>", options)
