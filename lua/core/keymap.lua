
local keymap = require("util.keymap")
local generic_key = require("environment").generic_key


-- better window movement {{{
keymap('n', generic_key.mv_win_up.lhs , "<C-w>k", { desc = generic_key.mv_win_up.desc    })
keymap('n', generic_key.mv_win_down.lhs , "<C-w>j", { desc = generic_key.mv_win_down.desc  })
keymap('n', generic_key.mv_win_left.lhs , "<C-w>h", { desc = generic_key.mv_win_left.desc  })
keymap('n', generic_key.mv_win_right.lhs , "<C-w>l", { desc = generic_key.mv_win_right.desc })
-- }}}


-- buffer ontrol - switch and wipe - instead of nvim_bufferline plugin {{{
keymap('n', generic_key.buf_next.lhs, ':bnext<CR>'    , { silent = false, desc = generic_key.buf_next.desc })
keymap('n', generic_key.buf_prev.lhs, ':bprevious<CR>', { silent = false, desc = generic_key.buf_prev.desc })
-- }}}
keymap('n', generic_key.buf_wipe.lhs, ':bdelete<CR>' , { desc = generic_key.buf_wipe.desc})


-- split or close the window {{{
keymap('n', generic_key.split_vert_wn.lhs, '<C-w>v', { desc = generic_key.split_vert_wn.desc })
keymap('n', generic_key.split_horz_wn.lhs, '<C-w>s', { desc = generic_key.split_horz_wn.desc })
keymap("n", generic_key.close_wn.lhs     , "<C-w>c", { desc = generic_key.close_wn.desc      })
-- }}}

-- easier moving of code blocks {{{
keymap('v', generic_key.indent_right.lhs, '<gv', { desc = generic_key.indent_right.desc })
keymap('v', generic_key.indent_left.lhs , '>gv', { desc = generic_key.indent_left.desc  })
-- }}}

-- open / source vimrc file quickly {{{
keymap('n', generic_key.so_vimrc.lhs, ':luafile $MYVIMRC <CR>', { desc = generic_key.so_vimrc.desc, silent = false })
keymap('n', generic_key.ed_vimrc.lhs, ':edit $MYVIMRC <CR>'   , { desc = generic_key.ed_vimrc.desc })
-- }}}

-- jk mapping to <ESC> return normal mode {{{
keymap({ 'i', 'v' }, generic_key.remapping_esc.lhs, '<ESC>', { desc = generic_key.remapping_esc.lhs .. generic_key.remapping_esc.desc })
-- }}}

-- directly entering command mode instead of ; {{{
keymap('n', generic_key.remapping_colon.lhs, ':', { desc = generic_key.remapping_colon.desc, silent = false })
-- }}}











-- F2 save {{{
keymap('n', generic_key.save_file.lhs, ":w! <CR>"       , { silent = false, desc = generic_key.save_file.desc })
keymap('i', generic_key.save_file.lhs, "<ESC> :w! <CR>" , { silent = false, desc = generic_key.save_file.desc })
-- }}}

-- F3 reload {{{
keymap('n', generic_key.source_file.lhs, ":so % <CR>"       , { silent = false, desc = generic_key.source_file.desc })
keymap('i', generic_key.source_file.lhs, "<ESC> :so %<CR>"  , { silent = false, desc = generic_key.source_file.desc})
-- }}}

-- F4 quit {{{
keymap('n', generic_key.quit.lhs, ":quit! <CR>"       , { silent = false, desc = generic_key.quit.desc})
keymap('i', generic_key.quit.lhs, "<ESC> :quit! <CR>" , { silent = false, desc = generic_key.quit.desc})
-- }}}


