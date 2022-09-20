
local env, g, o = vim.env, vim.g, vim.o

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
    'matchit',
    'matchparen',
    'shada_plugin',
}
for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
------------------------------------------------------------------------------


-- glbal key mapping
g.mapleader      = ENV.leader_key
g.maplocalleader = ENV.local_leader_key


-- multi-byte characters
o.fileencoding  = "utf-8"
o.fileencodings = "ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1,utf-16le,cp1252,iso-8859-15"

-- moving around, searching and patterns
o.autochdir  = false
o.ignorecase = true
o.smartcase  = true
o.incsearch  = true

-- displaying text
o.number         = true
o.relativenumber = true
o.cmdheight      = 1
vim.opt.list     = true
vim.opt.listchars = {
    tab      = '». ',
    trail    = '•',
    precedes = '❮',
    extends  = '❯',
    nbsp     = '␣',
    -- eol      = "↴",
    space    = "⋅",
}
o.showbreak      = "↪"

-- syntax, highlighting and spelling
o.hlsearch   = true
o.cursorline = true

-- multiple windows
o.laststatus = 2
o.splitright = true
o.splitbelow = true
o.hidden     = true

-- multiple tab pages
o.showtabline = 0

-- terminal
o.termguicolors = true

-- using the mouse
o.mouse = "a"

-- selecting text
o.clipboard = "unnamed,unnamedplus"

-- editing text
o.showmatch   = true
o.completeopt = o.completeopt .. ',longest'
o.diffopt     = o.diffopt .. ',vertical,internal,algorithm:patience'

-- tabs and indenting
o.tabstop     = 4
o.shiftwidth  = 4
o.softtabstop = 4
o.smarttab    = true
o.expandtab   = true
o.smartindent = true

-- reading and writing files
o.fileformat  = "unix"
o.fileformats = "unix,mac,dos"
o.writebackup = false
o.backup      = false
o.swapfile    = false
o.undofile    = false

-- mapping peroid
o.timeoutlen = 500

-- various
o.signcolumn = "yes"
o.updatetime = 300

-- scroll options
o.scrolloff = 0

-- folding configuration
o.foldmethod = "indent"
o.foldlevel = 99
