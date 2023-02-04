
local status_ok, hop = pcall(require, "hop")
if not status_ok then
    return
end

local module_key = require("environment").keys.module.hop
local keymap = require("utils").keymap
local directions = require('hop.hint').HintDirection

local status_ok, wk = pcall(require, "which-key")
if status_ok then
    wk.register ({
        [module_key.prefix] = {
            name = "[S]earch",
            [module_key.two_words] = {function() hop.hint_char2() end   , "hop two word[S]" },
            [module_key.patterns]  = {function() hop.hint_patterns() end, "hop [P]atterns"  },
        },
    })
else
    keymap('n', module_key.prefix .. module_key.two_words, function() hop.hint_char2() end, {desc = "hop two word[S]"})
    keymap('n', module_key.prefix .. module_key.patterns , function() hop.hint_char2() end, {desc = "hop [P]atterns"})
end



keymap(
    {'n', 'v', 'x'},
    'f',
    function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
    end,
    {remap=true}
)

keymap(
    {'n', 'v', 'x'},
    'F',
    function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
    end,
    {remap=true}
)

keymap(
    {'n', 'v', 'x'},
    't',
    function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
    end,
    {remap=true}
)

keymap(
    {'n', 'v', 'x'},
    'T',
    function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
    end,
    {remap=true}
)
