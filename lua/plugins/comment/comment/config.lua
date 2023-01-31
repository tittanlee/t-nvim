

local status_ok, comment = pcall(require, 'Comment')
if not status_ok then
    return
end

local module_key = require("environment").keys.module.comment

comment.setup({

    ---Add a space b/w comment and the line
    padding = true,

    ---Whether the cursor should stay at its position
    sticky  = true,
    ---Lines to be ignored while (un)comment

    ignore  = "^$",
    ---LHS of toggle mappings in NORMAL mode

    toggler = {
        ---Line-comment toggle keymap
        line  = module_key.toggler_line,
        ---Block-comment toggle keymap
        block = module_key.toggler_block,
    },

    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = module_key.op_line,
        ---Block-comment keymap
        block = module_key.op_block,
    },

    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = module_key.ex_above,
        ---Add comment on the line below
        below = module_key.ex_below,
        ---Add comment at the end of line
        eol   = module_key.ex_eol,
    },

    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic    = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra    = true,
        ---Extended mapping; `g>` `g<` `g>[count]{motion}` `g<[count]{motion}`
        extended = false,
    },

    ---Function to call before (un)comment
    pre_hook  = nil,

    ---Function to call after (un)comment
    post_hook = nil,
})
