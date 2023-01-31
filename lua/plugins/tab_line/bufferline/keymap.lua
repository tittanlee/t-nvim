

local status_ok, bufferline= pcall(require, "bufferline")
if not status_ok then
    return
end

local module_key = require("environment").keys.module.bufferline

local status_ok, wk = pcall(require, "which-key")
if status_ok then
    wk.register({
        [module_key.cycle_prev] = {":BufferLineCyclePrev<CR>", "buf prev"      },
        [module_key.cycle_next] = {":BufferLineCycleNext<CR>", "buf next"      },
        [module_key.move_prev]  = {":BufferLineMovePrev<CR>" , "move buf prev" },
        [module_key.move_next]  = {":BufferLineMoveNext<CR>" , "move buf next" },
        [module_key.pick]       = {":BufferLinePick<CR>"     , "buf pick"      },
    })
else
    local keymap = require("utils").keymap
    keymap("n", module_key.cycle_prev, ":BufferLineCyclePrev<CR>", {desc = "buf prev"      })
    keymap("n", module_key.cycle_next, ":BufferLineCycleNext<CR>", {desc = "buf next"      })
    keymap("n", module_key.move_prev , ":BufferLineMovePrev <CR>", {desc = "move buf prev" })
    keymap("n", module_key.move_next , ":BufferLineMoveNext <CR>", {desc = "move buf next" })
    keymap("n", module_key.pick      , ":BufferLinePick <CR>"    , {desc = "buf pick"      })
end
