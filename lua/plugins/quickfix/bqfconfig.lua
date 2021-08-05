


require('bqf').setup({
    auto_enable = true,
    preview = {
        auto_preview = true,
        win_height = 15,
        win_vheight = 15,
        delay_syntax = 250,
        border_chars = {'┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█'}
    },
    func_map = {
        ptogglemode = 'z,',
        pscrollup   = '<C-u>',
        pscrolldown = '<C-d>',
    },
    filter = {
        fzf = {
            action_for = {['ctrl-s'] = 'split'},
            extra_opts = {'--bind', 'ctrl-o:toggle-all', '--prompt', '> '}
        }
    }
})


-- BqfPreviewFloat: highlight floating window
-- BqfPreviewBorder: highlight border of floating window
-- BqfPreviewCursor: highlight the cursor format [lnum, col] in preview window
-- BqfPreviewRange: highlight the range format [lnum, col, range], pattern_hl and lsp_ranges_hl
-- BqfSign: highlight the sign in quickfix window
