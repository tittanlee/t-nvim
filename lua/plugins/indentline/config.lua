

vim.g.indent_blankline_filetype_exclude = {
    "help",
    "terminal",
    "dashboard",
    "startify",
    "packer",
    "neogitstatus",
    "NvimTree",
}
vim.g.indent_blankline_buftype_exclude = {
    "terminal"
}

--vim.g.indent_blankline_char_highlight_list = {
--    "Function",
--}

vim.g.indent_blankline_space_char                     = ' '
-- vim.g.indent_blankline_char                           = "|"
vim.g.indent_blankline_char                           = '▏'
vim.g.indentLine_enabled                              = true
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level        = true
vim.g.indent_blankline_show_end_of_line               = true
vim.g.indent_blankline_show_current_context           = false
vim.g.indent_blankline_use_treesitter                 = true
