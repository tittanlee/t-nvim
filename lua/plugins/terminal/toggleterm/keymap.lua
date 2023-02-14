

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end


local keymap = require("utils").keymap
local module_key = require("environment").keys.module.toggle_term

local status_ok, wk = pcall(require, "which-key")
if status_ok then
    wk.register({
        [module_key.prefix] = {
            name = module_key.prefix.desc,
            [module_key.toggle] = {"<cmd>ToggleTerm<CR>", module_key.toggle.desc},
        },
    })
else
    local keymap = require("utils").keymap
    keymap("n", module_key.prefix.lhs .. module_key.toggle.lhs, fzf_cmd_files, {desc = module_key.toggle.desc})
end

