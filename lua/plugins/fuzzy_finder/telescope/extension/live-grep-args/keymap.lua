
local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    return
end

local keymap = vim.keymap.set
local options = {noremap = true, silent = true}

keymap(
    "n",
    "<leader>fgg", 
    function()
        telescope.extensions.live_grep_args.live_grep_args()
    end,
    options
)
