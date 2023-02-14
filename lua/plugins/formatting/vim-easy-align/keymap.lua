

local module_key = require("environment").keys.module.easy_aling

local status_ok, wk = pcall(require, "which-key")
if status_ok then
    wk.register({
        [module_key.prefix.lhs] = {
            name               = module_key.prefix.desc,
            [module_key.align.lhs] = {"<plug>(EasyAlign)", module_key.align.desc},
        },
    },{mode = "n"})

    wk.register({
        [module_key.prefix.lhs] = {
            name                    = "[E]asy-align",
            [module_key.align.lhs]      = {"<plug>(EasyAlign)", module_key.align.desc },
            [module_key.live_align.lhs] = {"<plug>(LiveEasyAlign)", module_key.live_align.desc },
        },
    }, {mode = "x"})
else
    local keymap = require("utils").keymap
    keymap('n', module_key.prefix.lhs .. module_key.align.lhs     , '<plug>(EasyAlign)'    , {desc = module_key.align.desc })
    keymap('x', module_key.prefix.lhs .. module_key.align.lhs     , '<plug>(EasyAlign)'    , {desc = module_key.align.desc })
    keymap('x', module_key.prefix.lhs .. module_key.live_align.lhs, '<plug>(LiveEasyAlign)', {desc = module_key.live_align.desc })
end


