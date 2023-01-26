

local status_ok, bufdelete = pcall(require, "bufdelete")
if not status_ok then
    return
end

local keymap = vim.keymap.set
local options = {noremap = true, silent = true}

-- Forcibly delete current buffer
keymap(
    "n",
    "<M-w>",
    function()
        bufdelete.bufdelete(0, true)
    end,
    options
)
