

local module_key = require("environment").keys.module.easy_aling

local status_ok, wk = pcall(require, "which-key")
if status_ok then
    wk.register({
        [module_key.prefix] = {
            name               = "easy-align",
            [module_key.align] = {"<plug>(EasyAlign)", "easy align"},
        },
    },{mode = "n"})

    wk.register({
        [module_key.prefix] = {
            name                    = "easy-align",
            [module_key.align]      = {"<plug>(EasyAlign)", "easy align"          },
            [module_key.live_align] = {"<plug>(LiveEasyAlign)", "easy align live" },
        },
    }, {mode = "x"})
else
    local keymap = require("utils").keymap
    keymap('n', module_key.prefix .. module_key.align     , '<plug>(EasyAlign)'    , {desc = "easy align"      })
    keymap('x', module_key.prefix .. module_key.align     , '<plug>(EasyAlign)'    , {desc = "easy align"      })
    keymap('x', module_key.prefix .. module_key.live_align, '<plug>(LiveEasyAlign)', {desc = "easy align live" })
end


