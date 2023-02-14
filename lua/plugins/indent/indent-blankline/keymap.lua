

local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
    return
end

local module_key = require("environment").keys.module.indent_blankline

local status_ok, wk = pcall(require, "which-key")
if status_ok then
    wk.register({
        [module_key.prefix.lhs] = {
            name = module_key.prefix.desc,
            [module_key.toggle.lhs] = {"<cmd>IndentBlanklineToggle<CR>", module_key.toggle.desc }
        },
    })
else
    local keymap = require("utils").keymap
    keymap('n', module_key.prefix.lhs .. module_key.toggle.lhs, ':IndentBlanklineToggle<CR>', {desc = module_key.toggle.desc})
end


