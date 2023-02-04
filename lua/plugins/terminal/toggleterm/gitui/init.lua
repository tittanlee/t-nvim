


local env_var  = require("environment").variable

-- test if gitui execute binary exists.
if vim.fn.executable("gitui") == 0 or env_var.gitui_support == false then
    return
end


local Terminal  = require('toggleterm.terminal').Terminal
local gitui = Terminal:new({
    cmd       = "gitui",
    hidden    = true,
    direction = "float",

    float_opts = {
        border = "double",
        winblend = 15,
        width    = math.floor(vim.o.columns * 0.9),
        height   = math.floor(vim.o.lines * 0.9),
        highlights = {
            border = "Normal",
            background = "Normal",
        }
    },

    -- function to run on opening the terminal
    -- on_open = function(term)
    --     vim.cmd("startinsert!")
    --     vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", options)
    -- end,

    -- function to run on closing the terminal
    -- on_close = function(term)
    --     vim.cmd("startinsert!")
    -- end,
})


local keymap = require("utils").keymap
local module_key = require("environment").keys.module.toggle_term
local status_ok, wk = pcall(require, "which-key")

if status_ok then
    wk.register({
        [module_key.prefix .. module_key.cmd_git] = {function() gitui:toggle() end, "[G]titui toggle"},
    })
else
    keymap(
        "n",
        module_key.cmd_git,
        function() gitui:toggle() end,
        {desc = "[G]itui toggle"}
    )
end
