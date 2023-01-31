
local status_ok, spectre = pcall(require, "spectre")
if not status_ok then
    return
end

local keymap = require("utils").keymap

keymap(
    "n",
    "<Leader>sw",
    function()
        spectre.open_visual({
            select_word = true,
            is_insert_mode = false,
        })
    end,
    {desc = "search select word"}
)

keymap(
    "n",
    "<Leader>so",
    function()
        spectre.open({
            select_word = false,
            is_insert_mode = true,
        })
    end,
    {desc = "entering serach mode"}
)
