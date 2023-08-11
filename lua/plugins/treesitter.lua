


local treesiter_config = function()
    local status_ok, ts_configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
        return
    end

    ts_configs.setup {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = {
            'bash',
            'c',
            'cmake',
            'c_sharp',
            'cpp',
            'css',
            'go',
            'html',
            'java',
            'javascript',
            'json',
            'lua',
            'python',
            'rust',
            'toml',
            'typescript',
            'vim',
            'yaml',
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = true,

        -- Automatically install missing parsers when entering buffer
        auto_install = true,

        indent = {
            enable = true,
            disable = {
                -- 'python'
            }
        },

        highlight = {
            enable = true
        },

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection    = "<cr>",
                node_incremental  = "<cr>",
                node_decremental  = "<tab>",
                scope_incremental = "<s-cr>"
            },
        },

        textobjects = {
            select = {
                enable = true,
                lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ['aa'] = '@parameter.outer',
                    ['ia'] = '@parameter.inner',
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['ac'] = '@class.outer',
                    ['ic'] = '@class.inner',
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    [']m'] = '@function.outer',
                    [']]'] = '@class.outer',
                },
                goto_next_end = {
                    [']M'] = '@function.outer',
                    [']['] = '@class.outer',
                },
                goto_previous_start = {
                    ['[m'] = '@function.outer',
                    ['[['] = '@class.outer',
                },
                goto_previous_end = {
                    ['[M'] = '@function.outer',
                    ['[]'] = '@class.outer',
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ['<leader>a'] = '@parameter.inner',
                },
                swap_previous = {
                    ['<leader>A'] = '@parameter.inner',
                },
            },
        },
    }
end




return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    event = {
        "BufReadPost",
        "BufNewFile"
    },
    cmd = {
        "TSInstall",
        "TSUninstall",
        "TSUpdate",
        "TSUpdateSync",
        "TSInstallInfo",
        "TSInstallSync",
        "TSInstallFromGrammar",
    },
    config = treesiter_config,
}
