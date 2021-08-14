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
    -- use { "norcalli/nvim_utils" }

    -- The goal of nvim-bqf is to make Neovim's quickfix window better.
    use {
        "kevinhwang91/nvim-bqf",
        config = function ()
            require("plugins.quickfix.bqfconfig")
        end,
    }

    -- Use your favorite grep tool to start an asynchronous search.
    -- All matches will be put in a quickfix or location list.
    -- (ag, ack, git grep, ripgrep, pt, sift, findstr, grep)
    use {
        "mhinz/vim-grepper",
        config = function ()
            require("plugins.ripgrep.config")
        end,
    }

    -- Gutentags is a plugin that takes care of the much needed management of tags files in Vim.
    use {
        "ludovicchabant/vim-gutentags",
        config = function()
            vim.cmd("source " .. CONFIG_PATH .. "/lua/plugins/gutentags/config.vim")
        end,
    }

    use {
        "junegunn/fzf",
        requires = {
            -- { "junegunn/fzf.vim" },
            -- { "atn34/vim-fzf-sources" },
            -- { "zackhsi/fzf-tags" },
            -- { "roosta/fzfolds.vim" },
        },
        config = function()
            vim.cmd("source " .. CONFIG_PATH .. "/lua/plugins/fuzzy_fzf/config.vim")
            vim.cmd("source " .. CONFIG_PATH .. "/lua/plugins/fuzzy_fzf/keymap.vim")
        end,
    }

    -- use {
    --     'camspiers/snap',
    --     config = function ()
    --         require("plugins.snap.config")
    --     end,
    -- }


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
        end,

        -- Treesitter - rainbow, refector, textobjects, commentstring
        requires = {
            use {
                "p00f/nvim-ts-rainbow",
                config = function ()
                    require("plugins.treesitter.rainbow")
                end,
            },

            use {
                "nvim-treesitter/nvim-treesitter-refactor",
                config = function ()
                    require("plugins.treesitter.refactor")
                end,
            },

            use {
                "nvim-treesitter/nvim-treesitter-textobjects",
                config = function ()
                    require("plugins.treesitter.textobjects")
                end,
            },

            -- use {
            -- "JoosepAlviste/nvim-ts-context-commentstring"
            -- }
        },
    }

    -- Coc - Make your Vim/Neovim as smart as VSCode.
    use {
        "neoclide/coc.nvim",

        branch = "release",

        config = function()
            -- require("plugins.coc.config")
            vim.cmd("source " .. CONFIG_PATH .. "/lua/plugins/coc/config.vim")
            vim.cmd("source " .. CONFIG_PATH .. "/lua/plugins/coc/keymap.vim")
        end,

        requires = {
            "honza/vim-snippets",
            "rafamadriz/friendly-snippets",
        },
    }


    use {
        "fcying/gen_clang_conf.vim",
        config = function ()
            vim.cmd("source " .. CONFIG_PATH .. "/lua/plugins/clang_conf/config.vim")
        end
    }

    -- A collection of common configurations for Neovim's built-in language server client.
--     use {
--         "neovim/nvim-lspconfig",
--         -- 'kabouzeid/nvim-lspinstall',
--         event = "VimEnter",
--         config = function()
--             require("plugins.lsp.config")
--             require("plugins.lsp.keymap")
--         end,
--
--         disalbe = true,
--     }

    -- Auto completion plugin for nvim
--     use {
--         "hrsh7th/nvim-compe",
--         config = function()
--             require("plugins.compe.config")
--             require("plugins.compe.keymap")
--         end,
--         requires = {
--             {"hrsh7th/vim-vsnip", event = "InsertEnter"},
--             {"rafamadriz/friendly-snippets", event = "InsertEnter"}
--         }
--     }

    -- A tree like view for symbols in Neovim using the Language Server Protocol. Supports all your favourite languages.
    -- use {
    --     'simrat39/symbols-outline.nvim',
    --     config = function()
    --         require("plugins.outline.config")
    --         require("plugins.outline.keymap")
    --     end
    -- }

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
        end,
        disalbe = true,
    }

    -- A snazzy 💅 buffer line (with minimal tab integration) for Neovim built using lua
    use {
        "akinsho/nvim-bufferline.lua",

        config = function()
            require("plugins.bufferline.config")
            require("plugins.bufferline.keymap")
        end
    }

    -- A minimal, stylish and customizable statusline for Neovim written in Lua
    use {
        "Famiu/feline.nvim",

        config = function()
            require("plugins.statusline.felineconfig")
        end,

        requires = {
            -- Super fast git decorations implemented purely in lua/teal.
            use {
                "lewis6991/gitsigns.nvim",

                requires = {
                    'nvim-lua/plenary.nvim'
                },

                config = function()
                    require("plugins.git.config")
                end,
            }
        },
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

    -- A high-performance color highlighter for Neovim which has no external dependencies! Written in performant Luajit.
    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require 'colorizer'.setup {
                "css";
                "vim";
                lua = {
                    mode = "background",
                    names = true,
                };
            }
        end,

        cmd = { "ColorizerToggle" },
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
        "glepnir/zephyr-nvim",
        "rafamadriz/neon",
    }

    -- This plugin provides the same icons as well as colors for each icon.
    use "kyazdani42/nvim-web-devicons"
end)
