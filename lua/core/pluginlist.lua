

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

local env_var  = require("environment").variable
local packer_bootstrap = ensure_packer()

-- Performance on neovim startup time
pcall(require, "impatient")

return require("packer").startup ({
    config = {
        git = {
            depth = 1,
            clone_timeout = 600,
        },
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end
        },
    },

    function(use)
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- Packer can manage itself as an optional plugin
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use {
            "wbthomason/packer.nvim",
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━❰ performance ❱━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- Speed up loading Lua modules in Neovim to improve startup time.
        use {
            "lewis6991/impatient.nvim"
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━❰ file_expxplorer ❱━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- A File Explorer For Neovim Written In Lua
        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons",
            },
            config = function()
                require("plugins.file_explorer.nvim-tree.config")
                require("plugins.file_explorer.nvim-tree.keymap")
            end
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━❰ tab_line ❱━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua.
        use {
            "akinsho/bufferline.nvim",
            requires = {
                "kyazdani42/nvim-web-devicons",
            },
            config = function()
                require("plugins.tab_line.bufferline.config")
                require("plugins.tab_line.bufferline.keymap")
            end
        }

        -- ━━━━━━━━━━━━━━━━━━━━❰ indent ❱━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- This plugin adds indentation guides to all lines (including empty lines)
        use {
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
            config = function()
                require("plugins.indent.indent-blankline.config")
                require("plugins.indent.indent-blankline.keymap")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━❰ formatting ❱━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- A simple, easy-to-use Vim alignment plugin.
        use {
            "junegunn/vim-easy-align",
            config = function()
                require("plugins.formatting.vim-easy-align.config")
                require("plugins.formatting.vim-easy-align.keymap")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━❰ syntax ❱━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- nvim-treesitter
        use {
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
                require("plugins.syntax.nvim-treesiter.config")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━❰ fuzzy_finder ❱━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- Gaze deeply into unknown regions using the power of the moon.
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                {'nvim-lua/plenary.nvim' },
                {'nvim-lua/popup.nvim'   },
            },
            config = function()
                require("plugins.fuzzy_finder.telescope.config")
                require("plugins.fuzzy_finder.telescope.keymap")
            end,
        }

        use {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = env_var.is_windows and
            "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
            or "make",
            after = "telescope.nvim",
            config = function()
                require("plugins.fuzzy_finder.telescope.extension.telescope-fzf-native")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━❰ LSP ❱━━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- LSP server side
        use {
            "williamboman/mason.nvim",
            requires = {
                {"williamboman/mason-lspconfig.nvim",},
                {"WhoIsSethDaniel/mason-tool-installer.nvim",},
            },
            config = function()
                require("plugins.lsp.server.config")
            end,
        }

        -- LSP client side
        use {
			"neovim/nvim-lspconfig",
            event = "BufReadPre",
            config = function()
                require("plugins.lsp.client.config")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━❰ completion ❱━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- A completion engine plugin for neovim written in Lua. 
        use {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
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
            },
            config = function()
                require("plugins.completion.nvim-cmp.config")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━❰ snippet ❱━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- Snippet Engine for Neovim written in Lua.
        use {
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
        -- ━━━━━━━━━━━━━━━━━━━❰ comment ❱━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ⚡Smart and Powerful commenting plugin for neovim ⚡
        use {
            "numToStr/Comment.nvim",
            config = function()
                require("plugins.comment.comment.config")
            end
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━❰ git ❱━━━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- Super fast git decorations implemented purely in lua/teal.
        use {
            'lewis6991/gitsigns.nvim',
            config = function()
                require("plugins.git.gitsigns.config")
            end
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━❰ terminal ❱━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- A neovim plugin to persist and toggle multiple terminals during an editing session
        use {
            "akinsho/toggleterm.nvim",
            config = function ()
                require("plugins.terminal.toggleterm.config")
                require("plugins.terminal.toggleterm.keymap")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━❰ quickfixj ❱━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- The goal of nvim-bqf is to make Neovim's quickfix window better.
        use {
            "kevinhwang91/nvim-bqf",
            config = function ()
                require("plugins.quickfix.nvim-bqf.config")
            end,
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━❰ motion ❱━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- Hop is an EasyMotion-like plugin allowing you to jump anywhere
        use {
            "phaazon/hop.nvim",
            tag = 'v2.0.2',
            config = function()
                require("plugins.motion.hop.config")
                require("plugins.motion.hop.keymap")
            end
        }

        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━❰ utility ❱━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --





        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━❰ colorscheme ❱━━━━━━━━━━━━━━━━ --
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        -- A One Dark Theme for Neovim 0.5 written in Lua based on Atom's One Dark Theme.
        use {
            "navarasu/onedark.nvim",
            config = function()
                require("plugins.colorscheme.onedark")
            end,
        }
        -- Dracula colorscheme for NEOVIM written in Lua
        use {
            "Mofiqul/dracula.nvim",
            config = function()
                require("plugins.colorscheme.dracula")
            end,
        }
        -- A Lua port of vim-code-dark colorscheme for Neovim with vscode light and dark theme.
        use {
            "Mofiqul/vscode.nvim",
            config = function()
                require("plugins.colorscheme.vscode")
            end,
        }
        -- Neovim theme based off of the Nord Color Palette.
        use {
            "shaunsingh/nord.nvim",
            config = function()
                require("plugins.colorscheme.nord")
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
