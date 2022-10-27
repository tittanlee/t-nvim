




vim.api.nvim_create_autocmd('FileType', {
    desc = 'toggle term filetype key mapping',
    pattern = 'toggleterm',
    group = vim.api.nvim_create_augroup('toggleterm_ft', { clear = true }),
    callback = function (opts)
        local opts = {noremap = false, silent = true}
        -- vim.api.nvim_buf_set_keymap(0, "t", "<ESC>", [[<C-\><C-n>]],       opts)
        vim.api.nvim_buf_set_keymap(0, "t", "jk",    [[<C-\><C-n>]],       opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)

    end,
})
