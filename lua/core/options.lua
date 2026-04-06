local opt = vim.opt

-- Appearance & UI
opt.number = true -- Show absolute line numbers
opt.relativenumber = true -- Show relative line numbers for easier jumping
opt.termguicolors = true -- Enable 24-bit RGB colors (Required for modern themes)
opt.cursorline = true -- Highlight the text line of the cursor
opt.scrolloff = 10 -- Minimum number of screen lines to keep above and below the cursor
opt.signcolumn = 'yes' -- Always show the sign column (prevents flickering with LSP/Git)
opt.mouse = 'a' -- Enable mouse support in all modes

-- displaying text
opt.number = true
opt.relativenumber = true
opt.cmdheight = 1
opt.showbreak = '↪'
opt.list = true
opt.listchars = {
  tab = '».',
  trail = '•',
  precedes = '',
  extends = '',
  nbsp = '×',
  --    space  = "·",
  --    eol    = "↴",
}

-- Indentation & Tabs (Standard 4-space indent)
opt.tabstop = 4 -- Number of spaces that a <Tab> counts for
opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
opt.softtabstop = 4 -- Number of spaces a <Tab> counts for while editing
opt.expandtab = true -- Use spaces instead of tabs
opt.autoindent = true -- Copy indent from current line when starting a new line
opt.smarttab = true -- Make tab insert spaces/tabs based on shiftwidth

-- Search Behavior
opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true -- Override 'ignorecase' if search pattern contains upper case characters
opt.hlsearch = true -- Turn off highlighting after search (cleaner UI)

-- Performance & System
opt.updatetime = 500 -- Faster completion and diagnostic display (default is 4000ms)
opt.timeoutlen = 500 -- Time to wait for a mapped sequence to complete

-- Code Folding (Optimized for nvim-ufo)
opt.foldcolumn = '1' -- Show fold column
opt.foldlevel = 99 -- Set high fold level to keep code expanded by default
opt.foldlevelstart = 99
opt.foldenable = true

-- Clipboard Configuration
-- Link Neovim's default register to the system clipboard
-- This allows using 'y' and 'p' directly with Windows apps
-- opt.clipboard = 'unnamed'

-- File Handling
opt.swapfile = false -- Disable swap files
opt.undofile = true -- Persistent undo (keeps history after closing Neovim)
opt.backup = false -- Disable backup files

-- Line Wrapping
opt.wrap = true -- Don't wrap long lines (critical for logs/kernel code)

-- Window Splitting
opt.splitbelow = true -- New horizontal splits appear below current window
opt.splitright = true -- New vertical splits appear to the right of current window

-- Encoding & File Formats
opt.encoding = 'utf-8' -- Internal string encoding
opt.fileencoding = 'utf-8' -- Encoding used for the file itself
opt.fileformats = 'unix,dos,mac' -- Detect Unix line endings before DOS

-- UI / UX Polish
opt.signcolumn = 'yes' -- Always show sign column (prevents flickering when LSP icons appear)
opt.laststatus = 3 -- Global statusline (only one statusline at the bottom for all splits)
opt.showmode = false -- Don't show mode (like -- INSERT --) because Lualine already shows it
opt.pumheight = 10 -- Maximum number of items in the completion menu (keeps it compact)
