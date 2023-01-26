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
                return require("packer.util").float({ border = "single" })
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
        -- ❰ completion ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- A completion engine plugin for neovim written in Lua.
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
        -- ❰ fuzzy_finder fzf ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use { -- An asynchronous Lua API for using fzf in Neovim
            "vijaymarupudi/nvim-fzf",
            config = function()
                require("plugins.fuzzy_finder.nvim-fzf.keymap")
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
        -- ❰ colorscheme ❱
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        use {
            "catppuccin/nvim",
            as = "catppuccin",
            config = function()
                require("plugins.colorscheme.catppuccin")
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
