

local status_ok, telescope_gtags = pcall(require, 'telescope-gtags')
if not status_ok then
    return
end

local keymap = vim.keymap.set
local options = {noremap = true, silent = true}


keymap(
    "n",
    "<C-\\>d",
    function()
        telescope_gtags.showDefinition()
    end,
    options
)

keymap(
    "n",
    "<C-\\>c",
    function()
        telescope_gtags.showReference()
    end,
    options
)

keymap(
    "n",
    "<C-\\>t",
    function()
        telescope_gtags.showCurrentFileTags()
    end,
    options
)


