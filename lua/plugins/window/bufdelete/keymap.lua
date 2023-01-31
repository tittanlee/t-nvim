
local status_ok, bufdelete = pcall(require, "bufdelete")
if not status_ok then
    return
end

local module_key = require("environment").keys.module.bufdelete

local status_ok, wk = pcall(require, "which-key")
if status_ok then
    wk.register({
        [module_key.buf_del] = {function() bufdelete.bufdelete(0, true) end, "buf delete"},
    })
else
    local keymap = require("utils").keymap
    keymap(
        'n',
        module_key.buf_del,
        function() bufdelete.bufdelete(0, true) end,
        {desc = "buf delete"}
    )
end
