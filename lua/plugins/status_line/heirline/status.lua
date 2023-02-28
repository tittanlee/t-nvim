
local conditions = require("heirline.conditions")

local separator    = require("plugins.status_line.heirline.provider.separator")
local vim_mode     = require("plugins.status_line.heirline.provider.vim_mode")
local file_name    = require("plugins.status_line.heirline.provider.file_name")
local git          = require("plugins.status_line.heirline.provider.git")
local diagnostics  = require("plugins.status_line.heirline.provider.diagnostics")
local lsp          = require("plugins.status_line.heirline.provider.lsp")
local search_count = require("plugins.status_line.heirline.provider.search_count")
local gutentags    = require("plugins.status_line.heirline.provider.gutentags")
local file_type    = require("plugins.status_line.heirline.provider.file_type")
local file_enc     = require("plugins.status_line.heirline.provider.file_enc")
local file_fmt     = require("plugins.status_line.heirline.provider.file_fmt")
local cursor_pos   = require("plugins.status_line.heirline.provider.cursor_pos")
local help_tag     = require("plugins.status_line.heirline.provider.help_tag")


local default_status_line = {
    vim_mode(separator.empty, separator.right.rounded.filled, "gray"),

    git(separator.left.rounded.filled, separator.right.rounded.filled, "gray"),

    file_name(separator.left.rounded.filled, separator.right.rounded.filled, "gray"),

    separator.insert_delimiter(separator.align),

    lsp (separator.left.rounded.filled, separator.right.rounded.filled, "gray"),
    diagnostics(separator.left.rounded.filled, separator.right.rounded.filled, "gray"),

    separator.insert_delimiter(separator.align),

    search_count(separator.left.rounded.filled, separator.right.rounded.filled, "gray"),

    gutentags(separator.left.rounded.filled, separator.right.rounded.filled, "gray"),

    file_fmt(separator.left.rounded.filled, separator.right.rounded.filled, "gray"),

    file_enc(separator.left.rounded.filled, separator.right.rounded.filled, "gray"),

    file_type(separator.left.rounded.filled, separator.right.rounded.filled, "gray"),

    cursor_pos(separator.left.rounded.filled, separator.right.rounded.filled, "gray"),
}

local special_status_line = {
    condition = function()
        return conditions.buffer_matches({
            buftype = { "nofile", "prompt", "help", "quickfix" },
            filetype = { "^git.*", "fugitive", "NvimTree" },
        })
    end,

    file_type(separator.left.rounded.filled, separator.right.rounded.filled, "gray"),
    help_tag(separator.left.rounded.filled, separator.right.rounded.filled, "gray"),
}

local inactive_status_line = {
    condition = conditions.is_not_active,

    file_name(separator.left.rounded.filled, separator.right.rounded.filled, "gray"),
    separator.insert_delimiter(separator.align),
    file_type(separator.left.rounded.filled, separator.right.rounded.filled, "gray"),
}

local status = {
    hl = function()
        if conditions.is_active() then
            return "StatusLine"
        else
            return "StatusLineNC"
        end
    end,

    -- the first statusline with no condition, or which condition returns true is used.
    -- think of it as a switch case with breaks to stop fallthrough.
    fallthrough = false,

    special_status_line,
    inactive_status_line,
    default_status_line,
}

return status
