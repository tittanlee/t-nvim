

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
        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        if packer_bootstrap then
            require("packer").sync()
        end
    end
})
