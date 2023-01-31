

local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
    return
end

local module_key = require("environment").keys.module.indent_blankline

local status_ok, wk = pcall(require, "which-key")
if status_ok then
    wk.register({
        [module_key.prefix] = {
            name = "indent blank line",
            [module_key.toggle] = {"<cmd>IndentBlanklineToggle<CR>", "IndentBlank toggle"},
        },
    })
else
    local keymap = require("utils").keymap
    keymap('n', module_key.prefix .. module_key.toggle, ':IndentBlanklineToggle<CR>', {desc = "IndentBlank toggle"})
end


