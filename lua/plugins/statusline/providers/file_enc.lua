
local fn = vim.fn
local bo = vim.bo
local api = vim.api

local colors   = require('plugins.statusline.colors')
local icons    = require('plugins.statusline.icons')
local utils    = require('plugins.statusline.utils')

local M = {}

function M.file_encoding()
    local bufnr = api.nvim_win_get_buf(winid)
    local enc = (bo[bufnr].fenc ~= '' and bo[bufnr].fenc) or vim.o.enc
    return enc:upper()
end

function M.highlight()
    return {
        fg = colors.dark.black,
        bg = colors.dark.yellow,
        gui = 'bold'
    }
end

function M.components_enabled()
    return utils.check_width() and utils.buffer_not_empty()
end

function M.component_opts()
    return {
        M.file_encoding,
        icon      = '👽',
        color     = M.highlight(),
        condition = M.components_enabled
    }
end

return M
