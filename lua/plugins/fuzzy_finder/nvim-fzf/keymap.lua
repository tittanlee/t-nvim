
local status_ok, fzf = pcall(require, "fzf")
if not status_ok then
    return
end

local fzf_cmd_files = require("plugins.fuzzy_finder.nvim-fzf.fzf-command.files")
local module_key = require("environment").keys.module.fzf

local status_ok, wk = pcall(require, "which-key")
if status_ok then
    wk.register({
        [module_key.prefix] = {
            name                    = "fzf",
            [module_key.find_files] = {fzf_cmd_files, "fzf find files"},
        },
    })
else
    local keymap = require("utils").keymap
    keymap("n", module_key.prefix .. module_key.find_files, fzf_cmd_files, {desc = "fzf find files"})
end
