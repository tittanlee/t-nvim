
local line_blame_formatter = function(name, blame_info, opts)
    local text
    local date_time

    if opts.relative_time then
        date_time = require('gitsigns.util').get_relative_time(tonumber(blame_info['author_time']))
    else
        date_time = os.date('%Y-%m-%d', tonumber(blame_info['author_time']))
    end

    text = string.format('%s|%s|%s|%s|%s',
        date_time,
        blame_info.abbrev_sha,
        blame_info.author,
        blame_info.summary,
        blame_info.filename
        )

    return {{' >>> '..text, 'Search'}}
end

require('gitsigns').setup {
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = '➕', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = 'Ⓜ️',  numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '➖', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '⚠️',  numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '⚡️', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    signcolumn = false,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = true, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        interval = 1000,
        follow_files = true
    },
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
    },
    current_line_blame_formatter = line_blame_formatter,
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    yadm = {
        enable = false
    },

    on_attach = function(bufnr)
        local function map(mode, lhs, rhs, opts)
            opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
            vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
        end

        -- Navigation
        map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
        map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

        -- Actions
        map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
        map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
        map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
        map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
        map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
        map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
        map('n', '<leader>gd', '<cmd>Gitsigns diffthis<CR>')
        map('n', '<leader>gD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
        map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

        -- Text object
        map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}
