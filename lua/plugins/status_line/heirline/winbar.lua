

local utils = require("heirline.utils")

local separator = require("plugins.status_line.heirline.provider.separator")
local work_dir = require("plugins.status_line.heirline.provider.work_dir")


local winbar = {

    condition = function()
        return vim.bo.buftype ~= "terminal"
    end,

    separator.insert_delimiter(separator.align),

    utils.surround(
        { separator.left.rounded.filled, separator.right.rounded.filled }, 
        "gray", 
        work_dir 
    ),

    utils.surround(
        { separator.left.rounded.filled, separator.right.rounded.filled }, 
        "gray", 
        {
            init = function(self)
                self.filename = vim.api.nvim_buf_get_name(0)
            end,

            provider = function(self)
                return vim.fn.fnamemodify(self.filename, ":.")
            end,

            hl = {
                fg = utils.get_highlight("Directory").fg,
                bold = true,
            },
        }
    ),

    separator.insert_delimiter(separator.align),
}


return winbar
