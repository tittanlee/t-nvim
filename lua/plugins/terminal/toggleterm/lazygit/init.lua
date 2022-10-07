

local env_var  = require("environment").variable

-- test if lazygit execute binary exists.
if vim.fn.executable("lazygit") == 0 or env_var.gitui_support == false then
    return
end


local options = {noremap = true, silent = true}
local Terminal  = require('toggleterm.terminal').Terminal


local lazygit = Terminal:new({
    cmd       = "lazygit",
    hidden    = true,
    direction = "float",

    float_opts = {
        border = "double",
        winblend = 25,
        highlights = {
            border = "Normal",
            background = "Normal",
        }
    },

    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", options)
    end,

    -- function to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})

function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader><leader>tg", "<cmd>lua _lazygit_toggle()<CR>", options)

