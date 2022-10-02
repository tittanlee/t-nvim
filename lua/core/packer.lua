

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
        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        -- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
        if packer_bootstrap then
            require("packer").sync()
        end
    end
})
