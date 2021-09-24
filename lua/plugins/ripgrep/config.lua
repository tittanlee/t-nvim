

vim.g.grepper = {
    buffer = 0,
    buffers = 0,
    open = 1,
    quickfix = 1,
    searchreg = 1,
    highlight = 0,
    jump = 0,
    prompt = 1,
    tools = { "rg" },
    rg = {
        grepprg = "rg -H --no-heading --vimgrep --smart-case $* .",
        -- grepformat = "%f:%l:%c: %m"
    }
}


vim.api.nvim_set_keymap("n", "<Leader>ro", "<plug>(GrepperOperator)", {})
vim.api.nvim_set_keymap("x", "<Leader>ro", "<plug>(GrepperOperator)", {})

vim.api.nvim_set_keymap("n", "<Leader>rw", ":Grepper -cword<CR> <CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>ra", ":Grepper -cword -append<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>rg", ":Grepper<CR>", {noremap = true})
