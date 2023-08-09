

local g   = vim.g
local opt = vim.opt
local env_var = require("environment").env_var
local builtin_feature = require("environment").builtin_feature

-- glbal key mapping {{{
g.mapleader      = env_var.leader_key
g.maplocalleader = env_var.local_leader_key
-- }}}


-- multi-byte characters {{{
opt.fileencoding  = "utf-8"
opt.fileencodings = "ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1,utf-16le,cp1252,iso-8859-15"
-- }}}

-- Tabs {{{
opt.shiftwidth  = 4                 -- Set amount of space characters, when we press "<" or ">"
opt.tabstop     = 4                 -- 1 tab equal 2 spaces
opt.softtabstop = 4
opt.expandtab   = true              -- Use spaces by default
opt.smartindent = true              -- Turn on smart indentation. See in the docs for more info
opt.autoindent  = true
opt.shiftround  = true
-- }}}


-- Clipboard {{{
opt.clipboard = "unnamed,unnamedplus" -- Use system clipboard
opt.fixeol = false -- Turn off appending new line in the end of a file
-- }}}

-- Folding {{{
opt.foldmethod = 'syntax'
-- }}}

-- Search {{{
opt.ignorecase = true               -- Ignore case if all characters in lower case
opt.joinspaces = false              -- Join multiple spaces in search
opt.smartcase = true                -- When there is a one capital letter search for exact match
opt.showmatch = true                -- Highlight search instances
-- }}}

-- Window {{{
opt.hidden     = true
opt.laststatus = 2
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new vertical splits to right
-- }}}

-- Wild Menu {{{
opt.wildmenu = true
opt.wildmode = "longest:full,full"
-- }}}

-- syntax, highlighting and spelling {{{
opt.hlsearch   = true
opt.cursorline = true
--- }}}

-- reading and writing files {{{
opt.fileformat  = "unix"
opt.fileformats = "unix,mac,dos"
opt.writebackup = false
opt.backup      = false
opt.swapfile    = false
opt.undofile    = false
-- }}}

-- displaying text {{{
opt.number         = true
opt.relativenumber = true
opt.cmdheight      = 1
opt.showbreak      = "↪"
opt.list           = true
opt.listchars      = {
    tab            = "».",
    trail          = "•",
    precedes       = "",
    extends        = "",
    nbsp           = "×",
--    space          = "·",
--    eol         = "↴",
}
opt.fillchars      = {
    diff           = "∙", -- BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
    eob            = " ", -- NO-BREAK SPACE (U+00A0, UTF-8: C2 A0) to suppress ~ at EndOfBuffer
    fold           = "·", -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
    vert           = "│", -- window border when window splits vertically ─ ┴ ┬ ┤ ├ ┼
}
-- }}}

-- various {{{
opt.signcolumn = "auto:2"
opt.autochdir  = false
-- }}}


-- Default Plugins {{{
for plugin, value in pairs(builtin_feature) do
    vim.g["loaded_" .. plugin] = value
end
-- }}}

