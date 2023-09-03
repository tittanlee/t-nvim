
local util = require("util")
local keymap = require("util.keymap")
local yank_path = require("util.yank_path")
local generic_key = require("environment").generic_key


-- better window movement {{{
keymap('n', generic_key.mv_win_up.lhs   , "<C-w>k", { desc = generic_key.mv_win_up.desc    })
keymap('n', generic_key.mv_win_down.lhs , "<C-w>j", { desc = generic_key.mv_win_down.desc  })
keymap('n', generic_key.mv_win_left.lhs , "<C-w>h", { desc = generic_key.mv_win_left.desc  })
keymap('n', generic_key.mv_win_right.lhs, "<C-w>l", { desc = generic_key.mv_win_right.desc })
-- }}}

-- move cursor in wrapline paragraph {{{
keymap('n', "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap('n', "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
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

-- easier indent of code blocks {{{
keymap('v', generic_key.indent_right.lhs, '<gv', { desc = generic_key.indent_right.desc })
keymap('v', generic_key.indent_left.lhs , '>gv', { desc = generic_key.indent_left.desc  })
-- }}}

-- Move current line / block with Alt-j/k ala vscode {{{
keymap('n', generic_key.mv_line_blk_down.lhs, ':m .+1<CR>=='       , { desc = generic_key.mv_line_blk_down.desc })
keymap('n', generic_key.mv_line_blk_up.lhs  , ':m .-2<CR>=='       , { desc = generic_key.mv_line_blk_up.desc   })
keymap('i', generic_key.mv_line_blk_down.lhs, '<Esc>:m .+1<CR>==gi', { desc = generic_key.mv_line_blk_down.desc })
keymap('i', generic_key.mv_line_blk_up.lhs  , '<Esc>:m .-2<CR>==gi', { desc = generic_key.mv_line_blk_up.desc   })
keymap('x', generic_key.mv_line_blk_down.lhs, ":m '>+1<CR>gv-gv"   , { desc = generic_key.mv_line_blk_down.desc })
keymap('x', generic_key.mv_line_blk_up.lhs  , ":m '<-2<CR>gv-gv"   , { desc = generic_key.mv_line_blk_up.desc   })
-- }}}


-- open / source vimrc file quickly {{{
keymap('n', generic_key.so_vimrc.lhs, ':luafile $MYVIMRC <CR>', { desc = generic_key.so_vimrc.desc, silent = false })
keymap('n', generic_key.ed_vimrc.lhs, ':edit $MYVIMRC <CR>'   , { desc = generic_key.ed_vimrc.desc })
-- }}}

-- jk mapping to <ESC> return normal mode {{{
-- keymap({ 'i', 'v' }, generic_key.remapping_esc.lhs, '<ESC>', { desc = generic_key.remapping_esc.lhs .. generic_key.remapping_esc.desc })
-- }}}

-- directly entering command mode instead of ; {{{
keymap({'n', 'x'}, generic_key.remapping_colon.lhs, ':', { desc = generic_key.remapping_colon.desc, silent = false })
-- }}}

-- resize with arrows {{{
keymap('n', generic_key.resize_up.lhs   , ':resize -2<CR>'         , { desc = generic_key.resize_up.desc    })
keymap('n', generic_key.resize_down.lhs , ':resize +2<CR>'         , { desc = generic_key.resize_down.desc  })
keymap('n', generic_key.resize_left.lhs , ':vertical resize -2<CR>', { desc = generic_key.resize_left.desc  })
keymap('n', generic_key.resize_right.lhs, ':vertical resize +2<CR>', { desc = generic_key.resize_right.desc })
-- }}}

-- yank file path {{{
keymap('n', generic_key.yank_abs_file_path.lhs , yank_path.yank_absolute_path , { silent = false, desc = generic_key.yank_abs_file_path.desc  })
keymap('n', generic_key.yank_rel_file_path.lhs , yank_path.yank_relative_path , { silent = false, desc = generic_key.yank_rel_file_path.desc  })
keymap('n', generic_key.yank_file_name.lhs     , yank_path.yank_file_name     , { silent = false, desc = generic_key.yank_file_name.desc      })
keymap('n', generic_key.yank_directory_path.lhs, yank_path.yank_directory_path, { silent = false, desc = generic_key.yank_directory_path.desc })
keymap('n', generic_key.yank_cwd_path.lhs      , yank_path.yank_cwd_path      , { silent = false, desc = generic_key.yank_cwd_path.desc       })
-- }}}


-- explorer directory {{{
keymap('n', generic_key.open_explorer.lhs ,
    function ()
        util.system_open(vim.fn.expand("%:p:h"))
    end,
    { silent = false, desc = generic_key.open_explorer.desc }
)
-- }}}


-- F2 save {{{
keymap('n', generic_key.save_file.lhs, ":w! <CR>"       , { silent = true, desc = generic_key.save_file.desc })
keymap('i', generic_key.save_file.lhs, "<ESC> :w! <CR>" , { silent = true, desc = generic_key.save_file.desc })
-- }}}

-- F3 reload {{{
keymap('n', generic_key.source_file.lhs, ":so % <CR>"       , { silent = true, desc = generic_key.source_file.desc })
keymap('i', generic_key.source_file.lhs, "<ESC> :so %<CR>"  , { silent = true, desc = generic_key.source_file.desc })
-- }}}

-- F4 quit {{{
keymap('n', generic_key.quit.lhs, ":quit! <CR>"       , { silent = true, desc = generic_key.quit.desc})
keymap('i', generic_key.quit.lhs, "<ESC> :quit! <CR>" , { silent = true, desc = generic_key.quit.desc})
-- }}}

-- F12 strip trailing white space {{{
keymap('n', generic_key.strip_tail_white.lhs, function() vim.cmd[[ %s/\s\+$//e ]] end, { desc = generic_key.strip_tail_white.desc})
-- }}}
--
