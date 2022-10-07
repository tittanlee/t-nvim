

local env_var  = require("environment").variable

-- test if gitui execute binary exists.
if vim.fn.executable("gitui") == 0 or env_var.gitui_support == false then
    return
end


local options = {noremap = true, silent = true}
local Terminal  = require('toggleterm.terminal').Terminal


local gitui = Terminal:new({
    cmd       = "gitui",
    hidden    = true,
    direction = "float",

    float_opts = {
        border = "double",
        winblend = 15,
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

function _gitui_toggle()
    gitui:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _gitui_toggle()<CR>", options)

