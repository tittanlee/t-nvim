


return {
    "ojroques/nvim-bufdel",

    lazy = true,

    cmd = { "BufDel", "BufDelAll", "BufDelOthers" },

    init = function()
        local keymap = require("util.keymap")
        local generic_key = require("environment").generic_key

        keymap('n', generic_key.buf_wipe.lhs, '<cmd>BufDel<CR>' , { desc = generic_key.buf_wipe.desc})
    end,

    config = function()
        require('bufdel').setup {
            next = 'cycle',
            quit = false,  -- quit Neovim when last buffer is closed
        }
    end,
}
