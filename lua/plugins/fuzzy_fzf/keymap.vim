











nnoremap <Leader>ff   :FzfFilesProvider <CR>
nnoremap <Leader>fvim :FzfFilesProvider <C-R>=stdpath("config")<CR><CR>

nnoremap <Leader>fj :FzfCtagsJump <C-R>=expand('<cword>')<CR><CR>


nnoremap <C-\>d :FzfGtagsJump <C-R>=expand('<cword>')<CR> -d<CR>
nnoremap <C-\>g :FzfGtagsJump <C-R>=expand('<cword>')<CR> -g<CR>
nnoremap <C-\>r :FzfGtagsJump <C-R>=expand('<cword>')<CR> -r<CR>
nnoremap <C-\>s :FzfGtagsJump <C-R>=expand('<cword>')<CR> -s<CR>


" nnoremap <LEADER>ff :<C-u>Files<CR>
" nnoremap <LEADER>fvim :<C-u>Files <C-R>=stdpath("config")<CR><CR>
" 
" nnoremap <LEADER>fr :<C-u>Colors<CR>
" 
" nnoremap <LEADER>fl :<C-u>BLines<CR>
" 
" nnoremap <LEADER>fh :<C-u>Helptags<CR>
" 
" nnoremap <LEADER>fb :<C-u>Buffers<CR>
" 
" 
" nnoremap <LEADER>ft :<C-u>BTags<CR>
" nnoremap <LEADER>fT :<C-u>Tags<CR>
