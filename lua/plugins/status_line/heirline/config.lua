



local status_ok, heirline = pcall(require, "heirline")
if not status_ok then
    return
end



local status  = require("plugins.status_line.heirline.status")
local winbar  = require("plugins.status_line.heirline.winbar")


-- 0: never
-- 1: only if there are at least two windows
-- 2: always
-- 3: always and ONLY the last window
vim.opt.laststatus = 3

heirline.setup(
    status,
    winbar
)
