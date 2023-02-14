

local status_ok, bufferline= pcall(require, "bufferline")
if not status_ok then
    return
end

local module_key = require("environment").keys.module.bufferline

local status_ok, wk = pcall(require, "which-key")
if status_ok then
    wk.register({
        [module_key.cycle_prev.lhs]= {":BufferLineCyclePrev<CR>", module_key.cycle_prev.desc },
        [module_key.cycle_next.lhs]= {":BufferLineCycleNext<CR>", module_key.cycle_next.desc },
        [module_key.move_prev.lhs] = {":BufferLineMovePrev<CR>" , module_key.move_prev.desc  },
        [module_key.move_next.lhs] = {":BufferLineMoveNext<CR>" , module_key.move_next.desc  },
        [module_key.pick.lhs]      = {":BufferLinePick<CR>"     , module_key.pick.desc       },
    })
else
    local keymap = require("utils").keymap
    keymap("n", module_key.cycle_prev.lhs, ":BufferLineCyclePrev<CR>", {desc = module_key.cycle_prev.desc })
    keymap("n", module_key.cycle_next.lhs, ":BufferLineCycleNext<CR>", {desc = module_key.cycle_next.desc })
    keymap("n", module_key.move_prev.lhs , ":BufferLineMovePrev <CR>", {desc = module_key.move_prev.desc  })
    keymap("n", module_key.move_next.lhs , ":BufferLineMoveNext <CR>", {desc = module_key.move_next.desc  })
    keymap("n", module_key.pick.lhs      , ":BufferLinePick <CR>"    , {desc = module_key.pick.desc       })
end
