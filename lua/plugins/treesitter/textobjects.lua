



local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["<Leader><Leader>ab"] = "@block.outer"      ,
                ["<Leader><Leader>ib"] = "@block.inner"      ,
                ["<Leader><Leader>aC"] = "@call.outer"       ,
                ["<Leader><Leader>iC"] = "@call.inner"       ,
                ["<Leader><Leader>ao"] = "@class.outer"      ,
                ["<Leader><Leader>io"] = "@class.inner"      ,
                ["<Leader><Leader>at"] = "@comment.outer"    ,
                ["<Leader><Leader>ac"] = "@conditional.outer",
                ["<Leader><Leader>ic"] = "@conditional.inner",
                ["<Leader><Leader>af"] = "@function.outer"   ,
                ["<Leader><Leader>if"] = "@function.inner"   ,
                ["<Leader><Leader>al"] = "@loop.outer"       ,
                ["<Leader><Leader>il"] = "@loop.inner"       ,
                ["<Leader><Leader>ap"] = "@parameter.outer"  ,
                ["<Leader><Leader>ip"] = "@parameter.inner"  ,
                ["<Leader><Leader>is"] = "@scopename.inner"  ,
                ["<Leader><Leader>as"] = "@statement.outer"  ,
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
    },

}
