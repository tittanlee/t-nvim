-- [[ Setting options ]]
-- See `:help vim.o`

local g, opt  = vim.g, vim.opt
local env_var = require("environment").variable
local builtin_feature = require("environment").default_builtin_plugin


for plugin, value in pairs(builtin_feature) do
    vim.g["loaded_" .. plugin] = value
end


-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- glbal key mapping
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
g.mapleader      = env_var.leader_key
g.maplocalleader = env_var.local_leader_key

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- multi-byte characters
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
opt.fileencoding  = "utf-8"
opt.fileencodings = "ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1,utf-16le,cp1252,iso-8859-15"

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- moving around, searching and patterns
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
opt.autochdir  = false
opt.ignorecase = true
opt.smartcase  = true
opt.incsearch  = true

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- displaying text
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
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
    space          = "·",
    -- eol         = "↴",
}
opt.fillchars      = {
    diff           = "∙", -- BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
    eob            = " ", -- NO-BREAK SPACE (U+00A0, UTF-8: C2 A0) to suppress ~ at EndOfBuffer
    fold           = "·", -- MIDDLE DOT (U+00B7, UTF-8: C2 B7)
    vert           = "│", -- window border when window splits vertically ─ ┴ ┬ ┤ ├ ┼
}
opt.pumheight      = math.floor(vim.o.lines / 2)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- syntax, highlighting and spelling
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
opt.hlsearch   = true
opt.cursorline = true

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- multiple windows
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
opt.laststatus = 2
opt.splitright = true
opt.splitbelow = true
opt.hidden     = true

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- multiple tab pages
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
opt.showtabline = 0

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- terminal
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
opt.termguicolors = true

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- using the mouse
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
opt.mouse = "a"

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- selecting text
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
opt.clipboard = "unnamed,unnamedplus"

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- editing text
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
opt.showmatch   = true
opt.completeopt = {
    -- "menu",
    "menuone",
    "noselect",
    -- "longest",
}
opt.diffopt     = {
    "filler",
    "iwhite",
    "internal",
    "algorithm:patience"
}

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- tabs and indenting
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
opt.autoindent  = true
opt.tabstop     = 4
opt.shiftwidth  = 4
opt.softtabstop = 4
opt.smarttab    = true
opt.expandtab   = true
opt.smartindent = true
opt.shiftround  = true

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- reading and writing files
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
opt.fileformat  = "unix"
opt.fileformats = "unix,mac,dos"
opt.writebackup = false
opt.backup      = false
opt.swapfile    = false
opt.undofile    = false

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- mapping peroid
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
opt.timeoutlen = 500

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- various
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
opt.signcolumn = "yes:2"
opt.updatetime = 500

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- scroll options
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
opt.scrolloff = 5

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- folding configuration
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
opt.foldmethod = "indent"
opt.foldlevel = 99
