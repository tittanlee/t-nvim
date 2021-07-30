local execute     = vim.api.nvim_command
local fn          = vim.fn
local packer_path = DATA_PATH .. "/site/pack/packer/start/packer.nvim"

-- check packer.nvim has been installed
if fn.empty(fn.glob(packer_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. packer_path)
    execute "packadd packer.nvim"
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
    return
end

packer.init {
    -- package_root = require("packer.util").join_paths(vim.fn.stdpath "data", "lvim", "pack"),
    -- compile_path = util.join_paths(DATA_PATH, 'plugin', 'packer_compiled.lua'),

    git = {
        clone_timeout = 1000,
    },
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end
    },
}

-- plugin list to install
return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    use { "wbthomason/packer.nvim" }
    use { "norcalli/nvim_utils" }

    use {
        "junegunn/fzf",
        requires = {
            { "junegunn/fzf.vim" },
            { "atn34/vim-fzf-sources" },
        },
        config = function()
            vim.cmd("source " .. CONFIG_PATH .. "/lua/plugins/fuzzy/config.vim")
            vim.cmd("source " .. CONFIG_PATH .. "/lua/plugins/fuzzy/keymap.vim")
        end,
    }

    use {
        "ludovicchabant/vim-gutentags",
        config = function()
            vim.cmd("source " .. CONFIG_PATH .. "/lua/plugins/gutentags/config.vim")
        end
    }

    -- telescope.nvim is a highly extendable fuzzy finder over lists.
    --use --{
        --"nvim-telescope/telescope.nvim",

        --requires = {
            --{"nvim-lua/popup.nvim"  },
            --{"nvim-lua/plenary.nvim"}
        --},

        --config = function()
            --require("plugins.telescope.config")
            --require("plugins.telescope.keymap")
        --end

    --}

    ---- telescop extensions
    --use {
        --"paopaol/telescope-ctags.nvim",
        --config = function()
            --require("plugins.telescope.extensions.ctags")
        --end,
    --}
 
    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("plugins.treesitter.config")
        end
    }
    -- Treesitter - rainbow, refector, textobjects, commentstring
    use {
        {
            "p00f/nvim-ts-rainbow",
            config = function ()
                require("plugins.treesitter.rainbow")
            end,
        },
        {
            "nvim-treesitter/nvim-treesitter-refactor",
            config = function ()
                require("plugins.treesitter.refactor")
            end,
        },
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            config = function ()
                require("plugins.treesitter.textobjects")
            end,
        },

        -- "JoosepAlviste/nvim-ts-context-commentstring"
    }

    -- A collection of common configurations for Neovim's built-in language server client.
    use {
        "neovim/nvim-lspconfig",
        -- 'kabouzeid/nvim-lspinstall',
        event = "VimEnter",
        config = function()
            require("plugins.lsp.config")
            require("plugins.lsp.keymap")
        end,
    }

    -- Auto completion plugin for nvim
    use {
        "hrsh7th/nvim-compe",
        config = function()
            require("plugins.compe.config")
            require("plugins.compe.keymap")
        end,
        requires = {
            {"hrsh7th/vim-vsnip", event = "InsertEnter"},
            {"rafamadriz/friendly-snippets", event = "InsertEnter"}
        }
    }

    -- A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite languages.
    use {
        'simrat39/symbols-outline.nvim',
        config = function()
            require("plugins.outline.config")
            require("plugins.outline.keymap")
        end
    }

    -- file managing , picker etc
    use {
        "kyazdani42/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
        setup = function()
            vim.api.nvim_set_keymap("n", "<LEADER>w", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<LEADER>e", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
        end,
        config = function()
            require("plugins.nvimtree.config")
            require("plugins.nvimtree.keymap")
        end
    }

    -- A snazzy 💅 buffer line (with minimal tab integration) for Neovim built using lua
    use {
        "akinsho/nvim-bufferline.lua",

        config = function()
            require("plugins.bufferline.config")
            require("plugins.bufferline.keymap")
        end
    }

    -- galaxyline is a light-weight and Super Fast statusline plugin. 
    use {
        "glepnir/galaxyline.nvim",

        config = function()
            require("plugins.statusline.config")
        end
    }

    -- Delete a buffer without messing up your window layout
    use {
        "famiu/bufdelete.nvim",

        config = function()
            require("plugins.bufdelete.keymap")
        end

    }

    -- This plugin adds indentation guides to all lines (including empty lines)
    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        setup = function()
            require("plugins.indentline.config")
            require("plugins.indentline.keymap")
        end
    }

    -- Toggle comments in Neovim
    use {
        "terrortylor/nvim-comment",

        -- cmd = "CommentToggle",

        config = function()
            require("plugins.comment.config")
            require("plugins.comment.keymap")
        end
    }

    -- next evolutionary step in the quest for making on-screen navigation
    use {
        "ggandor/lightspeed.nvim",

        config = function()
            require("plugins.lightspeed.config")
            -- require("plugins.lightspeed.keymap")
        end,
    }


    -- nvim color theme that support tree-sitter
    use {
        -- "projekt0n/github-nvim-theme",
        "mhartington/oceanic-next"    ,
        "folke/tokyonight.nvim"       ,
        "marko-cerovac/material.nvim" ,
        "navarasu/onedark.nvim"       ,
        "ishan9299/nvim-solarized-lua",
        "bluz71/vim-nightfly-guicolors",
        "Mofiqul/dracula.nvim",
        "glepnir/zephyr-nvim",
    }

    -- This plugin provides the same icons as well as colors for each icon.
    use "kyazdani42/nvim-web-devicons"
end)
