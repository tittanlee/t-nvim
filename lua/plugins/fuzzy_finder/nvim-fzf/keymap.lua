
local status_ok, fzf = pcall(require, "fzf")
if not status_ok then
    return
end

local fzf_cmd_files = require("plugins.fuzzy_finder.nvim-fzf.fzf-command.files")
local fzf_ctags_jump = require("plugins.fuzzy_finder.nvim-fzf.fzf-command.ctags")
local module_key = require("environment").keys.module.fzf

local status_ok, wk = pcall(require, "which-key")
if status_ok then
    wk.register({
        [module_key.prefix] = {
            name                    = "[F]zf",
            [module_key.find_files] = {fzf_cmd_files, "[F]iles"},
            [module_key.ctags_jump] = {fzf_ctags_jump, "ctags [J]ump"},
        },
    })
else
    local keymap = require("utils").keymap
    keymap("n", module_key.prefix .. module_key.find_files, fzf_cmd_files, {desc = "[F]iles"})
end
