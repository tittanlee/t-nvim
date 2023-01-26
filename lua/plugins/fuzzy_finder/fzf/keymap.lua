
local keymap = vim.keymap.set
local options = {noremap = true, silent = true}
local fzf_cmd_files = require("plugins.fuzzy_finder.fzf.fzf-command.files")


keymap(
    "n",
    "<LEADER>ff",
    fzf_cmd_files,
    options
)

