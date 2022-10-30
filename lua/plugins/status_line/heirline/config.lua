



local status_ok, heirline = pcall(require, "heirline")
if not status_ok then
    return
end



local status  = require("plugins.status_line.heirline.status")
local winbar  = require("plugins.status_line.heirline.winbar")

heirline.setup(
    status,
    winbar
)

