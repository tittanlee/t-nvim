
local opt = vim.opt

------------------------------------------------------------------------------
-- disable nvim built-in plugin
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin", -- 'man',
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    -- 'matchit', 'matchparen', 'shada_plugin',
}
for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
------------------------------------------------------------------------------


-- glbal key mapping
vim.g.mapleader = ENV.leader_key


-- multi-byte characters
opt.fileencoding  = "utf-8"
opt.fileencodings = "ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1,utf-16le,cp1252,iso-8859-15"

-- moving around, searching and patterns
opt.autochdir  = false
opt.ignorecase = true
opt.smartcase  = true
opt.incsearch  = true

-- displaying text
opt.number         = true
opt.relativenumber = true
opt.cmdheight      = 1
opt.list           = true
-- opt.listchars      = { tab = ">>>", trail = "·", precedes = "←", extends = "→",eol = "↲", nbsp = "␣" }
opt.listchars      = { tab = "».", trail = "•", precedes = "❮", extends = "❯", nbsp = "␣" }
opt.showbreak      = "↪"

-- syntax, highlighting and spelling
opt.hlsearch   = true
opt.cursorline = true

-- multiple windows
opt.laststatus = 2
opt.splitright = true
opt.splitbelow = true
opt.hidden     = true

-- multiple tab pages
opt.showtabline = 0

-- terminal
opt.termguicolors = true

-- using the mouse
opt.mouse = "a"

-- selecting text
opt.clipboard = "unnamed,unnamedplus"

-- editing text
opt.showmatch = true
opt.completeopt = "menuone,noselect"
opt.diffopt     = 'internal,filler,closeoff,internal,algorithm:patience'

-- tabs and indenting
opt.tabstop     = 4
opt.shiftwidth  = 4
opt.softtabstop = 4
opt.smarttab    = true
opt.expandtab   = true
opt.smartindent = true

-- reading and writing files
opt.fileformat  = "unix"
opt.fileformats = "unix,mac,dos"
opt.writebackup = false
opt.backup      = false
opt.swapfile    = false
opt.undofile    = false

-- mapping peroid
opt.timeoutlen = 500

-- various
opt.signcolumn = "auto"
opt.updatetime = 300
