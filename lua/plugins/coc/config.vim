

" Disable file with size > 1MB
autocmd BufAdd * if getfsize(expand('<afile>')) > 1024*1024 |
            \ let b:coc_enabled=0 |
            \ endif

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" Use `complete_info` if your (Neo)Vim version supports it.
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Start or refresh completion at current cursor position
inoremap <silent><expr> <C-SPACE> coc#refresh()

" show the document under the current cursor word
nnoremap <Leader>h :call <SID>show_documentation()<CR>

" diagnostic toggle dynamically
nnoremap <Leader>dt :call CocAction('diagnosticToggle')<CR>
nnoremap <Leader>di <plug>(coc-diagnostic-info)<CR>
nnoremap ]d <plug>(coc-diagnostic-next)<CR>
nnoremap [d <plug>(coc-diagnostic-prev)<CR>

" list all files by fuzzy search selected
nnoremap <Leader>cf :CocList files<CR>
nnoremap <Leader>ch :CocList helptags<CR>


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)


" coc-translator
nmap <Leader>tt <Plug>(coc-translator-p)
vmap <Leader>tt <Plug>(coc-translator-pv)

" coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

