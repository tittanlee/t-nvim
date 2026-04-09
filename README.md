# Neovim Configuration

A modular Neovim configuration built around [lazy.nvim](https://github.com/folke/lazy.nvim), with a centralized keymap management system.

## Requirements

- Neovim >= 0.10
- [Nerd Font](https://www.nerdfonts.com/) (for icons)
- `git`, `make`, `gcc` (for treesitter parsers)
- `ripgrep` (for grep/search)
- `GNU Global` (optional, for gtags integration)
- Node.js / Python (optional, for LSP servers)

## Installation

```bash
git clone <your-repo-url> ~/.config/nvim
nvim
```

Lazy.nvim will bootstrap itself and install all plugins on first launch.

## Structure

```
nvim/
├── init.lua                        # Entry point
└── lua/
    ├── environment.lua             # Colorscheme & theme config
    ├── core/
    │   ├── options.lua             # Editor options
    │   ├── keymaps.lua             # Global keymaps
    │   ├── lazy.lua                # Plugin manager setup
    │   └── autocmd.lua             # Autocommands
    ├── config/
    │   ├── keymaps/                # Centralized keymap definitions
    │   │   ├── init.lua            # Prefix registry & helper functions
    │   │   ├── snacks.lua
    │   │   ├── gitsigns.lua
    │   │   ├── treesitter.lua
    │   │   └── ...                 # One file per plugin
    │   └── which-key/
    │       ├── init.lua            # Auto-registers all M.wk specs
    │       └── copy_path.lua
    ├── plugins/
    │   ├── ai/
    │   ├── coding/
    │   ├── completion/
    │   ├── editor/
    │   ├── lsp/
    │   ├── syntax/
    │   ├── tools/
    │   ├── treesitter/
    │   └── ui/
    └── utils/
```

## Keymap Architecture

All keymaps are defined in `lua/config/keymaps/<plugin>.lua` and referenced from plugin files. Each module exports:

- Named key/desc entries (e.g. `M.hunk.stage`)
- A `M.wk` table — automatically picked up by which-key at startup

```lua
-- Example: config/keymaps/gitsigns.lua
M.hunk = {
  prefix = '<leader>Gh',
  group  = '[gitsigns] Hunk',
  stage  = { key = 's', desc = 'Stage hunk' },
}

M.wk = {
  { M.hunk.prefix, group = M.hunk.group },
  { M.nav.next.key, desc = M.nav.next.desc },
}
```

To change any keybinding, edit only the relevant `config/keymaps/` file — the plugin file and which-key registration update automatically.

## Plugins

### UI

| Plugin | Role |
|--------|------|
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Default colorscheme (also: rose-pine, catppuccin, kanagawa, nightfox) |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Buffer tabs |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap hints |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Picker, explorer, git UI, notifications, zen mode, lazygit |

### Editor

| Plugin | Role |
|--------|------|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git hunk signs & actions |
| [flash.nvim](https://github.com/folke/flash.nvim) | Character jump navigation |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | Symbol outline sidebar |
| [yanky.nvim](https://github.com/gbprod/yanky.nvim) | Yank ring with history picker |
| [multicursors.nvim](https://github.com/smoka7/multicursors.nvim) | Multiple cursors |
| [mini.align](https://github.com/echasnovski/mini.align) | Text alignment |
| [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) | Better code folding |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Auto-formatting |

### Coding

| Plugin | Role |
|--------|------|
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Comment toggling |
| [better-escape.nvim](https://github.com/max397574/better-escape.nvim) | `jk` / `jj` → `<Esc>` |
| [hi-my-words.nvim](https://github.com/dvoytik/hi-my-words.nvim) | Persistent word highlighting |
| [gtags-snacks](lua/plugins/coding/gtags-snacks.lua) | GNU Global tag search via snacks picker |

### Completion

| Plugin | Role |
|--------|------|
| [blink.cmp](https://github.com/saghen/blink.cmp) | Completion engine |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Snippet collection |

### LSP

| Plugin | Role |
|--------|------|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client configuration |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/tool installer |

Configured servers: `bash`, `clangd` (C/C++), `html`, `jsonls`, `lua_ls`, `pyright`, `vimls`, `lemminx` (XML), `yamlls`

### Treesitter

| Plugin | Role |
|--------|------|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting, indentation, incremental selection |
| [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) | Function text objects & navigation |

### AI

| Plugin | Role |
|--------|------|
| [avante.nvim](https://github.com/yetone/avante.nvim) | AI coding assistant |

## Keymaps

Leader key: `<Space>`

### General

| Key | Action |
|-----|--------|
| `<F2>` | Save file |
| `<F3>` | Reload config |
| `<F4>` | Quit |
| `<F12>` | Strip trailing whitespace |
| `<C-h/j/k/l>` | Navigate windows |
| `<A-j/k>` | Move line / selection up or down |
| `<C-↑/↓/←/→>` | Resize window |
| `<leader>sv/sh/se/sx` | Split / equalize / close window |
| `;` | Enter command mode |
| `S` | Split line at cursor (reverse `J`) |
| `n / N` | Next / prev search result (centered) |

### Find & Search (`<leader>f` / `<leader>s`)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fb` | Buffers |
| `<leader>fr` | Resume last search |
| `<leader>fh` | Help pages |
| `<leader>fd` | Diagnostics |
| `<leader>fk` | Keymaps |
| `<leader>sg` | Live grep |
| `<leader>sw` | Grep word under cursor |
| `<leader>sl` | Buffer lines |
| `<leader>fjd` | Gtags definition |
| `<leader>fjr` | Gtags reference |
| `<leader>fjg` | Gtags grep |

### LSP (`<leader>l`)

| Key | Action |
|-----|--------|
| `<leader>ld` | Definitions |
| `<leader>lr` | References |
| `<leader>li` | Implementations |
| `<leader>ls` | Symbols |
| `<leader>lS` | Workspace symbols |
| `<leader>lc` | Incoming calls |
| `<leader>lo` | Outgoing calls |

### Git (`<leader>g` / `<leader>G`)

| Key | Action |
|-----|--------|
| `<leader>gs` | Git status |
| `<leader>gl` | Git log |
| `<leader>gb` | Git branches |
| `<leader>gd` | Git diff |
| `<leader>gg` | Lazygit |
| `<leader>Ghs` | Stage hunk |
| `<leader>Ghr` | Reset hunk |
| `<leader>GhS` | Stage buffer |
| `<leader>Ghu` | Undo stage hunk |
| `<leader>Ghp` | Preview hunk |
| `<leader>Ghb` | Blame line |
| `]g / [g` | Next / prev git hunk |

### Toggle (`<leader>t`)

| Key | Action |
|-----|--------|
| `<leader>td` | Diagnostics |
| `<leader>tl` | Inlay hints |
| `<leader>tz` | Zen mode |
| `<leader>tZ` | Zen zoom |
| `<leader>td` | Dim mode |
| `<leader>Gtl` | Toggle line highlight (gitsigns) |
| `<leader>Gtb` | Toggle line blame (gitsigns) |

### Navigation (flash.nvim)

| Key | Action |
|-----|--------|
| `f` | Flash jump backward |
| `F` | Flash jump forward |
| `t` | Treesitter search backward |
| `T` | Treesitter search forward |

### Treesitter

| Key | Action |
|-----|--------|
| `]m / [m` | Next / prev function start |
| `]M / [M` | Next / prev function end |
| `af` | Around function (text object) |
| `if` | Inner function (text object) |
| `<CR>` | Increment selection |
| `<Tab>` | Decrement selection |

### Buffer & UI

| Key | Action |
|-----|--------|
| `<M-h> / <M-l>` | Prev / next buffer |
| `<leader>bp` | Pick buffer (bufferline) |
| `<leader>O` | Toggle outline (aerial) |
| `<leader>m` | Multicursor start |
| `<leader>p` | Yank history picker |

### Highlight & Align

| Key | Action |
|-----|--------|
| `<leader>kk` | Toggle word highlight |
| `<leader>kK` | Clear all highlights |
| `<leader>ea` | Align |
| `<leader>eA` | Align with preview |

### Copy Path (`<leader>cp`)

| Key | Action |
|-----|--------|
| `<leader>cpp` | Copy absolute path |
| `<leader>cpr` | Copy relative path |
| `<leader>cpf` | Copy filename |
| `<leader>cpd` | Copy directory |

## Configuration

### Colorscheme

Edit `lua/environment.lua` to change the active colorscheme:

```lua
M.color_scheme = 'tokyonight'  -- or: 'rose-pine', 'catppuccin', 'kanagawa', 'nightfox'
M.lualine_theme = 'onedark'
```

### Adding a New Plugin Keymap

1. Create `lua/config/keymaps/<plugin>.lua` with `M.wk`
2. Register it in `lua/config/which-key/init.lua` under `km_modules`
3. Reference `km.*` in your plugin file

## License

MIT
