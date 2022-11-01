
local vi_mode   = require("plugins.status_line.heirline.provider.vi_mode")
-- local file_name = require("plugins.status_line.heirline.provider.file_name")
local separator = require("plugins.status_line.heirline.provider.separator")
local git       = require("plugins.status_line.heirline.provider.git")
local lsp       = require("plugins.status_line.heirline.provider.lsp")
local diag      = require("plugins.status_line.heirline.provider.diagnostics")

local cursor_pos = require("plugins.status_line.heirline.provider.cursor_pos")





return {
    vi_mode,
    separator.Space,

    git,
    separator.Space,


    separator.Align,
    lsp.lsp_active,
    separator.Space,
    diag,
    separator.Space,
    separator.Align,

    cursor_pos.Ruler,
    separator.Space,

    cursor_pos.ScrollBar,
}
