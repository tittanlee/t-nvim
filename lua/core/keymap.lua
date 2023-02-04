

local keymap = require("utils").keymap
local generic_keys = require("environment").keys.generic



-- better window movement
keymap('n', generic_keys.mv_win_up   , '<C-w>k', { desc = "move win up"    })
keymap('n', generic_keys.mv_win_down , '<C-w>j', { desc = "move win down"  })
keymap('n', generic_keys.mv_win_left , '<C-w>h', { desc = "move win left"  })
keymap('n', generic_keys.mv_win_right, '<C-w>l', { desc = "move win right" })

-- buffer ontrol - switch and wipe - instead of nvim_bufferline plugin
local status_ok, _ = pcall(require, "bufferline")
if not status_ok then
    keymap('n', generic_keys.buf_next, ':bnext<CR>'    , { silent = false, desc = "buffer cycle next" })
    keymap('n', generic_keys.buf_prev, ':bprevious<CR>', { silent = false, desc = "buffer cycle prev" })
end

-- bdelete instead of bufdelete plugin
local status_ok, _ = pcall(require, "bufdelete")
if not status_ok then
    keymap('n', generic_keys.buf_wipe, ':bdelete<CR>'  , { desc = "buffer wipe" })
end

-- jk mapping to <ESC> return normal mode
keymap({ 'i', 'v' }, generic_keys.remapping_esc, '<ESC>', { desc = generic_keys.remapping_esc .. " remappign ESC"})

-- Move current line / block with Alt-j/k ala vscode.
keymap('n', generic_keys.mv_line_blk_down, ':m .+1<CR>=='       , { desc = "mv line blk down" })
keymap('n', generic_keys.mv_line_blk_up  , ':m .-2<CR>=='       , { desc = "mv line blk up"   })
keymap('i', generic_keys.mv_line_blk_down, '<Esc>:m .+1<CR>==gi', { desc = "mv line blk down" })
keymap('i', generic_keys.mv_line_blk_up  , '<Esc>:m .-2<CR>==gi', { desc = "mv line blk up"   })
keymap('x', generic_keys.mv_line_blk_down, ":m '>+1<CR>gv-gv"   , { desc = "mv line blk down" })
keymap('x', generic_keys.mv_line_blk_up  , ":m '<-2<CR>gv-gv"   , { desc = "mv line blk up"   })

-- neovim paste remapping to shift+insert {{{
keymap({ 'i', 'c', 't' }, generic_keys.paste, '<C-R>+', { desc = "paste" })

-- directly entering command mode instead of ;
keymap('n', generic_keys.remapping_colon, ':', { silent = false, desc = "remapping colon" })

-- open / source vimrc file quickly
keymap('n', generic_keys.so_vimrc, ':luafile $MYVIMRC <CR>', { desc = "source $MYVIMRC", silent = false })
keymap('n', generic_keys.ed_vimrc, ':edit $MYVIMRC <CR>'   , { desc = "edit $MYVIMRC"   })

-- split or close the window
keymap('n', generic_keys.split_vert_wn, '<C-w>v', { desc = "split vert win"    })
keymap('n', generic_keys.split_horz_wn, '<C-w>s', { desc = "split horz win"    })
keymap("n", generic_keys.close_wn     , "<C-w>c", { desc = "close current win" })

-- terminal insert/normal mode switch
-- keymap('t', '<ESC><ESC>', '<C-\\><C-n>',  { desc = "terminal i/n mode switch" })

-- folding level customized
keymap('n', generic_keys.fold_level_0, ':set foldlevel=0<CR>', { desc = "set fold level = 0" })
keymap('n', generic_keys.fold_level_1, ':set foldlevel=1<CR>', { desc = "set fold level = 1" })
keymap('n', generic_keys.fold_level_2, ':set foldlevel=2<CR>', { desc = "set fold level = 2" })
keymap('n', generic_keys.fold_level_3, ':set foldlevel=3<CR>', { desc = "set fold level = 3" })
keymap('n', generic_keys.fold_level_4, ':set foldlevel=4<CR>', { desc = "set fold level = 4" })
keymap('n', generic_keys.fold_level_5, ':set foldlevel=5<CR>', { desc = "set fold level = 5" })
keymap('n', generic_keys.fold_level_6, ':set foldlevel=6<CR>', { desc = "set fold level = 6" })
keymap('n', generic_keys.fold_level_7, ':set foldlevel=7<CR>', { desc = "set fold level = 7" })
keymap('n', generic_keys.fold_level_8, ':set foldlevel=8<CR>', { desc = "set fold level = 8" })
keymap('n', generic_keys.fold_level_9, ':set foldlevel=9<CR>', { desc = "set fold level = 9" })

-- easier moving of code blocks
keymap('v', generic_keys.indent_right, '<gv', { desc = "indent right" })
keymap('v', generic_keys.indent_left , '>gv', { desc = "indent left"  })

-- only paste without copy in visual mode
keymap("v", "p", '"_dP', { desc = "paste without copy in visual"})


-- F2 save
keymap('n', generic_keys.save_file, ':w! <CR>'     , { silent = false, desc = "save file" })
keymap('i', generic_keys.save_file, '<ESC>:w! <CR>', { silent = false, desc = "save file" })

-- F3 reload script
keymap('n', generic_keys.source_cur_file, ':so % <CR>'     , { silent = false, desc = "source current file" })
keymap('i', generic_keys.source_cur_file, '<ESC>:so % <CR>', { silent = false, desc = "source current file" })

-- F4 quit
keymap('n', generic_keys.quit, ':quit! <CR>'     , { silent = true, desc= "quit (neo)vim" })
keymap('i', generic_keys.quit, '<ESC>:quit! <CR>', { silent = true, desc= "quit (neo)vim" })

-- F6 to switch absolute or relative file path
-- keymap('n', '<F6>', ':lua file_path_lib.fname_switch()<CR>', { silent = true})

-- F7 toggle git related information
-- keymap('n', '<F7>', ':lua ENV.status_show_git_info = not ENV.status_show_git_info<CR>', { silent = true })

-- F8 toggle current function in status line
-- keymap('n', '<F8>', ':lua ENV.status_show_current_func = not ENV.status_show_current_func<CR>', { silent = true })

-- F12 strip trailing white space
keymap('n', generic_keys.strip_tail_white, function() vim.cmd[[ %s/\s\+$//e ]] end, { desc = "strip tail white space"})
