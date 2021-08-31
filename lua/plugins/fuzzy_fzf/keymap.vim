





nnoremap <Leader>fF  :<C-u>Filetypes<CR>
nnoremap <Leader>fb  :<C-u>Buffers<CR>
nnoremap <Leader>fr  :<C-u>Colors<CR>
nnoremap <Leader>fl  :<C-u>BLines<CR>
nnoremap <Leader>fL  :<C-u>Lines<CR>
nnoremap <Leader>ft  :<C-u>BTags<CR>
nnoremap <Leader>fT  :<C-u>Tags<CR>
nnoremap <Leader>fM  :<C-u>Marks<CR>
nnoremap <Leader>fm  :<C-u>Maps<CR>
nnoremap <Leader>fh  :<C-u>Helptags<CR>
nnoremap <Leader>fn  :<C-u>Snippets<CR>
nnoremap <Leader>fw  :<C-u>Windows<CR>
nnoremap <Leader>fgc :<C-u>Commits<CR>



" fzf provider file selection
nnoremap <Leader>ff    :FzfFilesProvider <CR>
nnoremap <Leader>fvim  :FzfFilesProvider <C-R>=stdpath("config")<CR><CR>

" fzf provider ctags jump
nnoremap <Leader>fj  :FzfCtagsJump <C-R>=expand('<cword>')<CR><CR>

" fzf provider gtags jump
nnoremap <C-\>d  :FzfGtagsJump <C-R>=expand('<cword>')<CR> -d<CR>
nnoremap <C-\>g  :FzfGtagsJump <C-R>=expand('<cword>')<CR> -g<CR>
nnoremap <C-\>r  :FzfGtagsJump <C-R>=expand('<cword>')<CR> -r<CR>
nnoremap <C-\>s  :FzfGtagsJump <C-R>=expand('<cword>')<CR> -s<CR>

