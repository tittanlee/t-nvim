
local status_ok, heirline = pcall(require, "heirline")
if not status_ok then
    return
end


local colors = require("plugins.status_line.heirline.colors")
local status  = require("plugins.status_line.heirline.status")
local winbar  = require("plugins.status_line.heirline.winbar")
local tabline = require("plugins.status_line.heirline.tabline")


heirline.load_colors(colors.default)

heirline.setup({
    statusline = status,
    winbar     = winbar,
    -- tabline    = tabline,
    -- statuscolumn = {},
})

