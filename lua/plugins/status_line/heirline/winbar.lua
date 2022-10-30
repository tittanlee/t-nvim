
local file_enc= require("plugins.status_line.heirline.provider.file_enc")
local file_name = require("plugins.status_line.heirline.provider.file_name")
local file_size = require("plugins.status_line.heirline.provider.file_size")
local file_fmt = require("plugins.status_line.heirline.provider.file_fmt")
local file_type = require("plugins.status_line.heirline.provider.file_type")
local file_mod = require("plugins.status_line.heirline.provider.file_modified")

local separator = require("plugins.status_line.heirline.provider.separator")



return {
    separator.Align,

    file_name,
    separator.Space,

    file_mod,
    separator.Space,

    file_enc,
    separator.Space,

    file_fmt,
    separator.Space,

    file_type,
    separator.Space,

    file_size,

    separator.Align,
}
