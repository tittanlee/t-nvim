

local ensure_packer = function()
    local fn           = vim.fn
    local std_path     = require("environment").std_path
    local packer_path = std_path.data .. "/site/pack/packer/start/packer.nvim"

    if fn.empty(fn.glob(packer_path)) > 0 then
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end

    return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup({
    config = {
        git = {
            depth = 1,
            clone_timeout = 600,
        },
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "rounded" })
            end,
        },
    },

    function(use)

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ packer manager ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- Packer can manage itself as an optional plugin
            "wbthomason/packer.nvim",
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ performance ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- Speed up loading Lua modules in Neovim to improve startup time.
            "lewis6991/impatient.nvim"
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ cursor ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- Multiple cursors plugin for vim/neovim
            "mg979/vim-visual-multi",
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ completion ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- A completion engine plugin for neovim written in Lua.
            "hrsh7th/nvim-cmp",
            requires = {
                {"hrsh7th/cmp-nvim-lsp",           after = "nvim-cmp" }, -- A nvim-cmp source for Neovim builtin LSP client.
                {"hrsh7th/cmp-path",               after = "nvim-cmp" }, -- A nvim-cmp source for filesystem paths.
                {"hrsh7th/cmp-git",                after = "nvim-cmp" }, -- A nvim-cmp source for Git.
                {"hrsh7th/cmp-buffer",             after = "nvim-cmp" }, -- A nvim-cmp source for buffer words.
                {"hrsh7th/cmp-nvim-lua",           after = "nvim-cmp" }, -- A nvim-cmp source for the Neovim Lua API.
                {"hrsh7th/cmp-cmdline",            after = "nvim-cmp" }, -- A nvim-cmp source for vim's cmdline.
                {"f3fora/cmp-spell",               after = "nvim-cmp" }, -- A nvim-cmp source for vim's spellsuggest.
                {"saadparwaiz1/cmp_luasnip",       after = "nvim-cmp" }, -- A nvim-cmp source for luasnip.
                {"quangnguyen30192/cmp-nvim-tags", after = "nvim-cmp" }, -- tags completion source for nvim-cmp
                {"lukas-reineke/cmp-rg",           after = "nvim-cmp" }, -- ripgrep source for nvim-cmp
            },
            config = function()
                require("plugins.completion.nvim-cmp.config")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ comment ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- ⚡Smart and Powerful commenting plugin for neovim ⚡
            "numToStr/Comment.nvim",
            config = function()
                require("plugins.comment.comment.config")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ file_expxplorer ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- A File Explorer For Neovim Written In Lua
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons",
            },
            config = function()
                require("plugins.file_explorer.nvim-tree.config")
                require("plugins.file_explorer.nvim-tree.keymap")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ formatting ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- A simple, easy-to-use Vim alignment plugin.
            "junegunn/vim-easy-align",
            config = function()
                require("plugins.formatting.vim-easy-align.config")
                require("plugins.formatting.vim-easy-align.keymap")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ fuzzy_finder fzf ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- An asynchronous Lua API for using fzf in Neovim
            "vijaymarupudi/nvim-fzf",
            config = function()
                require("plugins.fuzzy_finder.nvim-fzf.keymap")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ git ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- Super fast git decorations implemented purely in lua/teal.
            'lewis6991/gitsigns.nvim',
            config = function()
                require("plugins.git.gitsigns.config")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ indent ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- This plugin adds indentation guides to all lines (including empty lines)
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
            config = function()
                require("plugins.indent.indent-blankline.config")
                require("plugins.indent.indent-blankline.keymap")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ key_binding ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use {
            "folke/which-key.nvim",
            config = function()
                require("plugins.key_binding.which-key.config")
            end
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ lsp ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- LSP Configuration & Plugins
            'neovim/nvim-lspconfig',
            event = "BufRead",
            requires = {
                -- Automatically install LSPs to stdpath for neovim
                {'williamboman/mason.nvim'},
                {'williamboman/mason-lspconfig.nvim'},

                -- Useful status updates for LSP
                {'j-hui/fidget.nvim'},

                -- Additional lua configuration, makes nvim stuff amazing
                {'folke/neodev.nvim'},

                -- A Neovim Lua plugin providing access to the SchemaStore catalog.
                {"b0o/SchemaStore.nvim"},
            },
            config = function()
                require("plugins.lsp.config")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ quickfix ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- The goal of nvim-bqf is to make Neovim's quickfix window better.
        use {
            "kevinhwang91/nvim-bqf",
            config = function ()
                require("plugins.quickfix.nvim-bqf.config")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━❰ search ❱━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- Spectre find the enemy and replace them with dark power.
            "nvim-pack/nvim-spectre",
            requires = {
                {"nvim-lua/plenary.nvim", }
            },
            config = function()
                require("plugins.search.nvim-spectre.config")
                require("plugins.search.nvim-spectre.keymap")
            end,
        }

        use { -- Hop is an EasyMotion-like plugin allowing you to jump anywhere
            "phaazon/hop.nvim",
            tag = 'v2.0.3',
            config = function()
                require("plugins.search.hop.config")
                require("plugins.search.hop.keymap")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ syntax ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- treeistter Highlight, edit, and navigate code
            "nvim-treesitter/nvim-treesitter",
            cmd = {
                "TSInstall",
                "TSInstallInfo",
                "TSInstallSync",
                "TSUninstall",
                "TSUpdate",
                "TSUpdateSync",
                "TSDisableAll",
                "TSEnableAll",
            },
            run = ":TSUpdate",
            event = { "BufRead", "BufNewFile" },
            config = function()
                require("plugins.syntax.nvim-treesitter.config")
            end,
        }

        use { -- Additional text objects via treesitter
            'nvim-treesitter/nvim-treesitter-textobjects',
            after = 'nvim-treesitter',
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ snippet ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- Snippet Engine for Neovim written in Lua.
            "L3MON4D3/LuaSnip",
            requires = {
                -- Snippets collection for a set of different programming languages for faster development0.
                "rafamadriz/friendly-snippets"
            },
            config = function ()
                require("plugins.snippet.luasnip.config")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ tab_line ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua.
            "akinsho/bufferline.nvim",
            requires = {
                "kyazdani42/nvim-web-devicons",
            },
            config = function()
                require("plugins.tab_line.bufferline.config")
                require("plugins.tab_line.bufferline.keymap")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ terminal ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- A neovim plugin to persist and toggle multiple terminals during an editing session
            "akinsho/toggleterm.nvim",
            config = function ()
                require("plugins.terminal.toggleterm.config")
                require("plugins.terminal.toggleterm.keymap")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ utility ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- Gutentags is a plugin that takes care of the much needed management of tags files in Vim.
            "ludovicchabant/vim-gutentags",
            -- commit = "50705e8",
            config = function()
                local std_path = require("environment").std_path
                vim.cmd("source " .. std_path.config .. "/lua/plugins/utility/vim-gutentags/config.vim")
            end,
        }

        use { -- Asynchronous translating plugin for Vim/Neovim
            "voldikss/vim-translator",
            event = "BufRead",
        }

        use {
            "tittanlee/vim-uefi",
            ft = {
                "asl",
                "uefidec",
                "uefifdf",
                "uefidsc",
                "uefiuni",
                "uefivfr",
                "uefiinf",
            },
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ window ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- Delete Neovim buffers without losing your window layout.
            "famiu/bufdelete.nvim",
            config = function()
                require("plugins.window.bufdelete.keymap")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ❰ colorscheme ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- Soothing pastel theme for Neovim
            "catppuccin/nvim",
            as = "catppuccin",
            config = function()
                require("plugins.colorscheme.catppuccin")
            end,
        }

        use { -- A One Dark Theme for Neovim 0.5 written in Lua based on Atom's One Dark Theme.
            "navarasu/onedark.nvim",
            config = function()
                require("plugins.colorscheme.onedark")
            end,
        }

        use { -- Neovim theme based off of the Nord Color Palette.
            "shaunsingh/nord.nvim",
            config = function()
                require("plugins.colorscheme.nord")
            end,
        }

        use { -- NeoVim dark colorscheme inspired by the colors of the famous painting by Katsushika Hokusai.
            "rebelot/kanagawa.nvim",
            config = function()
                require("plugins.colorscheme.kanagawa")
            end,
        }

        use { -- A clean, dark Neovim theme
            "folke/tokyonight.nvim",
            config = function()
                require("plugins.colorscheme.tokyonight")
            end,
        }

        use { -- Dracula colorscheme for NEOVIM written in Lua
            "Mofiqul/dracula.nvim",
            config = function()
                require("plugins.colorscheme.dracula")
            end,
        }

        use { -- A Lua port of vim-code-dark colorscheme for Neovim with vscode light and dark theme.
            "Mofiqul/vscode.nvim",
            config = function()
                require("plugins.colorscheme.vscode")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        if packer_bootstrap then
            require("packer").sync()
        end
    end
})
