

local status_ok, hop = pcall(require, "hop")
if not status_ok then
    return
end


local keymap = vim.keymap.set
local options = {noremap = true, silent = true}
local hint = require("hop.hint")


-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- search one word in current line after cusor
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
keymap(
    "n",
    "f",
    function()
        hop.hint_char1({
            direction = hint.HintDirection.AFTER_CURSOR,
            current_line_only = true,
        })
    end,
    options
)

keymap(
    "o",
    "f",
    function()
        hop.hint_char1({
            direction = hint.HintDirection.AFTER_CURSOR,
            current_line_only = false,
        })
    end,
    options
)

keymap(
    "x",
    "f",
    function()
        hop.hint_char1({
            direction = hint.HintDirection.AFTER_CURSOR,
            current_line_only = false,
        })
    end,
    options
)


-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- search one word in current line
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
keymap(
    "n",
    "F",
    function()
        hop.hint_char1({
            direction = hint.HintDirection.BEFORE_CURSOR,
            current_line_only = true,
        })
    end,
    options
)

keymap(
    "o",
    "F",
    function()
        hop.hint_char1({
            direction = hint.HintDirection.BEFORE_CURSOR,
            current_line_only = false,
        })
    end,
    options
)

keymap(
    "x",
    "F",
    function()
        hop.hint_char1({
            direction = hint.HintDirection.BEFORE_CURSOR,
            current_line_only = false,
        })
    end,
    options
)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- search two words at current buffer
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
keymap(
    "n",
    "<leader>ss",
    function()
        hop.hint_char2()
    end,
    options
)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- search parttens at current buffer
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
keymap(
    "n",
    "<leader>sp",
    function()
        op.hint_patterns()
    end,
    options
)
