
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
        add          = {hl = 'GitSignsAdd'   , text = '➕',numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = 'Ⓜ️', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
        delete       = {hl = 'GitSignsDelete', text = '➖',numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
        topdelete    = {hl = 'GitSignsDelete', text = '⚠️', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
        changedelete = {hl = 'GitSignsChange', text = '⚡️', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    },

    numhl = false,
    linehl = false,
    signcolumn = false,

    current_line_blame = false,
    current_line_blame_delay = 300,
    current_line_blame_position = 'eol',
    current_line_blame_formatter = line_blame_formatter,

    watch_index = {
        interval = 1000,
        follow_files = true
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    word_diff = false,
    use_internal_diff = not ENV.is_windows,  -- If luajit is present


    keymaps = {
        -- Default keymap options
        noremap = true,

        -- ['n ]d'] = { expr = true, "&diff ? ']d' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
        -- ['n [d'] = { expr = true, "&diff ? '[d' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

        ['n ]g'] = '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>',
        ['n [g'] = '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>',

        -- diff this buffer with HEAD
        ['n <leader>gd']  = '<cmd>lua require"gitsigns".diffthis()<CR>',

        -- toggle signs quick keymap
        ['n <leader>gts'] = '<cmd>lua require"gitsigns".toggle_signs()<CR>',
        ['n <leader>gtn'] = '<cmd>lua require"gitsigns".toggle_numhl()<CR>',
        ['n <leader>gtl'] = '<cmd>lua require"gitsigns".toggle_linehl()<CR>',
        ['n <leader>gtb'] = '<cmd>lua require"gitsigns".toggle_current_line_blame()<CR>',

        -- ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        -- ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        -- ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        -- ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        -- ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        -- ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
        -- ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        -- ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

        -- Text objects
        -- ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
        -- ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
    },
}

