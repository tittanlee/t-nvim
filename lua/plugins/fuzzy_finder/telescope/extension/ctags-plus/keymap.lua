

local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    return
end

local keymap = vim.keymap.set
local options = {noremap = true, silent = true}

keymap(
    "n",
    "<Leader>fj",
    function()
        telescope.extensions.ctags_plus.jump_to_tag({
            layout_strategy = "vertical",
        })
    end,
    options
)
