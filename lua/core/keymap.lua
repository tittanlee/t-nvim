

local keymap = require("utils").keymap
local generic_keys = require("environment").keys.generic



-- better window movement
keymap('n', generic_keys.mv_win_up.lhs   , '<C-w>k', { desc = generic_keys.mv_win_up.desc    })
keymap('n', generic_keys.mv_win_down.lhs , '<C-w>j', { desc = generic_keys.mv_win_down.desc  })
keymap('n', generic_keys.mv_win_left.lhs , '<C-w>h', { desc = generic_keys.mv_win_left.desc  })
keymap('n', generic_keys.mv_win_right.lhs, '<C-w>l', { desc = generic_keys.mv_win_right.desc })

-- buffer ontrol - switch and wipe - instead of nvim_bufferline plugin
local status_ok, _ = pcall(require, "bufferline")
if not status_ok then
    keymap('n', generic_keys.buf_next.lhs, ':bnext<CR>'    , { silent = false, desc = generic_keys.buf_next.desc })
    keymap('n', generic_keys.buf_prev.lhs, ':bprevious<CR>', { silent = false, desc = generic_keys.buf_prev.desc })
end

-- bdelete instead of bufdelete plugin
local status_ok, _ = pcall(require, "bufdelete")
if not status_ok then
    keymap('n', generic_keys.buf_wipe.lhs, ':bdelete<CR>' , { desc = generic_keys.buf_wipe.desc})
end

-- jk mapping to <ESC> return normal mode
keymap({ 'i', 'v' }, generic_keys.remapping_esc.lhs, '<ESC>', { desc = generic_keys.remapping_esc.lhs .. generic_keys.remapping_esc.desc })

-- Move current line / block with Alt-j/k ala vscode.
keymap('n', generic_keys.mv_line_blk_down.lhs, ':m .+1<CR>=='       , { desc = generic_keys.mv_line_blk_down.desc })
keymap('n', generic_keys.mv_line_blk_up.lhs  , ':m .-2<CR>=='       , { desc = generic_keys.mv_line_blk_up.desc   })
keymap('i', generic_keys.mv_line_blk_down.lhs, '<Esc>:m .+1<CR>==gi', { desc = generic_keys.mv_line_blk_down.desc })
keymap('i', generic_keys.mv_line_blk_up.lhs  , '<Esc>:m .-2<CR>==gi', { desc =  generic_keys.mv_line_blk_up.desc  })
keymap('x', generic_keys.mv_line_blk_down.lhs, ":m '>+1<CR>gv-gv"   , { desc = generic_keys.mv_line_blk_down.desc })
keymap('x', generic_keys.mv_line_blk_up.lhs  , ":m '<-2<CR>gv-gv"   , { desc =  generic_keys.mv_line_blk_up.desc  })

-- neovim paste remapping to shift+insert {{{
keymap({ 'i', 'c', 't' }, generic_keys.paste.lhs, '<C-R>+', { desc = generic_keys.paste.desc })

-- directly entering command mode instead of ;
keymap('n', generic_keys.remapping_colon.lhs, ':', { desc = generic_keys.remapping_colon.desc, silent = false })

-- open / source vimrc file quickly
keymap('n', generic_keys.so_vimrc.lhs, ':luafile $MYVIMRC <CR>', { desc = generic_keys.so_vimrc.desc, silent = false })
keymap('n', generic_keys.ed_vimrc.lhs, ':edit $MYVIMRC <CR>'   , { desc = generic_keys.ed_vimrc.desc })

-- split or close the window
keymap('n', generic_keys.split_vert_wn.lhs, '<C-w>v', { desc = generic_keys.split_vert_wn.desc })
keymap('n', generic_keys.split_horz_wn.lhs, '<C-w>s', { desc = generic_keys.split_horz_wn.desc })
keymap("n", generic_keys.close_wn.lhs     , "<C-w>c", { desc = generic_keys.close_wn.desc      })

-- terminal insert/normal mode switch
-- keymap('t', '<ESC><ESC>', '<C-\\><C-n>',  { desc = "terminal i/n mode switch" })

-- folding level customized
keymap('n', generic_keys.fold_level_0.lhs, ':set foldlevel=0<CR>', { desc = generic_keys.fold_level_0.desc })
keymap('n', generic_keys.fold_level_1.lhs, ':set foldlevel=1<CR>', { desc = generic_keys.fold_level_1.desc })
keymap('n', generic_keys.fold_level_2.lhs, ':set foldlevel=2<CR>', { desc = generic_keys.fold_level_2.desc })
keymap('n', generic_keys.fold_level_3.lhs, ':set foldlevel=3<CR>', { desc = generic_keys.fold_level_3.desc })
keymap('n', generic_keys.fold_level_4.lhs, ':set foldlevel=4<CR>', { desc = generic_keys.fold_level_4.desc })
keymap('n', generic_keys.fold_level_5.lhs, ':set foldlevel=5<CR>', { desc = generic_keys.fold_level_5.desc })
keymap('n', generic_keys.fold_level_6.lhs, ':set foldlevel=6<CR>', { desc = generic_keys.fold_level_6.desc })
keymap('n', generic_keys.fold_level_7.lhs, ':set foldlevel=7<CR>', { desc = generic_keys.fold_level_7.desc })
keymap('n', generic_keys.fold_level_8.lhs, ':set foldlevel=8<CR>', { desc = generic_keys.fold_level_8.desc })
keymap('n', generic_keys.fold_level_9.lhs, ':set foldlevel=9<CR>', { desc = generic_keys.fold_level_9.desc })

-- easier moving of code blocks
keymap('v', generic_keys.indent_right.lhs, '<gv', { desc = generic_keys.indent_right.desc })
keymap('v', generic_keys.indent_left.lhs , '>gv', { desc = generic_keys.indent_left.desc  })

-- only paste without copy in visual mode
keymap("v", "p", '"_dP', { desc = "paste without copy in visual"})


-- F2 save
keymap('n', generic_keys.save_file.lhs, ':w! <CR>'     , { silent = false, desc = generic_keys.save_file.desc})
keymap('i', generic_keys.save_file.lhs, '<ESC>:w! <CR>', { silent = false, desc = generic_keys.save_file.desc})

-- F3 reload script
keymap('n', generic_keys.source_cur_file.lhs, ':so % <CR>'     , { silent = false, desc = generic_keys.source_cur_file.desc })
keymap('i', generic_keys.source_cur_file.lhs, '<ESC>:so % <CR>', { silent = false, desc = generic_keys.source_cur_file.desc })

-- F4 quit
keymap('n', generic_keys.quit.lhs, ':quit! <CR>'     , { silent = true, desc= generic_keys.quit.desc })
keymap('i', generic_keys.quit.lhs, '<ESC>:quit! <CR>', { silent = true, desc= generic_keys.quit.desc })

-- F6 to switch absolute or relative file path
-- keymap('n', '<F6>', ':lua file_path_lib.fname_switch()<CR>', { silent = true})

-- F7 toggle git related information
-- keymap('n', '<F7>', ':lua ENV.status_show_git_info = not ENV.status_show_git_info<CR>', { silent = true })

-- F8 toggle current function in status line
-- keymap('n', '<F8>', ':lua ENV.status_show_current_func = not ENV.status_show_current_func<CR>', { silent = true })

-- F12 strip trailing white space
keymap('n', generic_keys.strip_tail_white.lhs, function() vim.cmd[[ %s/\s\+$//e ]] end, { desc = generic_keys.strip_tail_white.desc})
