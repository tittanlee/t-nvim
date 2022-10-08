



local status_ok, spectre = pcall(require, "spectre")
if not status_ok then
    return
end

local keymap = vim.keymap.set
local options = {noremap = true, silent = true}

keymap(
    "n",
    "<Leader>sw",
    function()
        spectre.open_visual({
            select_word = true,
            is_insert_mode = false,
        })
    end,
    options
)

--[[ 
keymap(
    "v",
    "<Leader>rr",
    function()
        spectre.open_visual({
            select_word = false,
            is_insert_mode = false,
        })
    end,
    options
)
 ]]

keymap(
    "n",
    "<Leader>so",
    function()
        spectre.open({
            select_word = false,
            is_insert_mode = true,
        })
    end,
    options
)
