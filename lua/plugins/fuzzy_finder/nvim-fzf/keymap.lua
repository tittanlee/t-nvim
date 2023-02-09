
local status_ok, fzf = pcall(require, "fzf")
if not status_ok then
    return
end

local fzf_cmd_files  = require("plugins.fuzzy_finder.nvim-fzf.fzf-command.files")
local fzf_ctags_jump = require("plugins.fuzzy_finder.nvim-fzf.fzf-command.ctags")
local fzf_gtags      = require("plugins.fuzzy_finder.nvim-fzf.fzf-command.gtags")


local module_key = require("environment").keys.module.fzf

local status_ok, wk = pcall(require, "which-key")
if status_ok then
    wk.register({
        [module_key.prefix] = {
            name                          = "[F]zf",
            [module_key.find_files]       = {fzf_cmd_files, "[F]iles"},
            [module_key.ctags_jump]       = {fzf_ctags_jump, "ctags [J]ump"},

            [module_key.gtags_definition] = {fzf_gtags.definition, "gtags [D]efintion"},
            [module_key.gtags_reference]  = {fzf_gtags.reference, "gtags [R]eference"},
            [module_key.gtags_symbol]     = {fzf_gtags.symbol, "gtags [S]ymbol"},
            [module_key.gtags_grepper]    = {fzf_gtags.grepper, "gtags [G]repper"},
        },
    })
else
    local keymap = require("utils").keymap
    keymap("n", module_key.prefix .. module_key.find_files, fzf_cmd_files, {desc = "[F]iles"})
    keymap("n", module_key.prefix .. module_key.ctags_jump, fzf_ctags_jump, {desc = "ctags [J]ump"})

    keymap("n", module_key.prefix .. module_key.gtags_definition, fzf_gtags.definition, {desc = "gtags [D]efintion"})
    keymap("n", module_key.prefix .. module_key.gtags_reference, fzf_gtags.reference, {desc = "gtags [R]eference"})
    keymap("n", module_key.prefix .. module_key.gtags_symbol, fzf_gtags.symbol, {desc = "gtags [S]ymbol"})
    keymap("n", module_key.prefix .. module_key.gtags_grepper, fzf_gtags.grepper, {desc = "gtags [G]repper"})
end
