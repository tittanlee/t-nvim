


return {
    "max397574/better-escape.nvim",

    lazy = true,

    event = { "CursorHold", "CursorHoldI" },

    config = function()
        local generic_key = require("environment").generic_key

        require("better_escape").setup({
            mapping           = { generic_key.remapping_esc.lhs }, -- a table with mappings to use
            timeout           = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
            clear_empty_lines = true, -- clear line after escaping if there is only whitespace
            keys              = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
            -- example(recommended)
            -- keys = function()
            --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<Esc>l' or '<Esc>'
            -- end,
        })
    end,
}
