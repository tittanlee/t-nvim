

local status_ok, fzf = pcall(require, 'fzf')
if not status_ok then
    return
end


local keymap = vim.keymap.set
local options = {noremap = true, silent = true}
local fzf_cmd_files = require("plugins.fuzzy_finder.nvim-fzf.fzf-command.files")

keymap(
    "n",
    "<LEADER>ff",
    fzf_cmd_files,
    options
)

