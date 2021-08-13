
" call coc#config('git', {
"             \ 'enableGutters' : 'false',
"             \ 'branchCharacter' : '',
"             \ 'addGBlameToBufferVar' : 'false',
"             \ 'addGBlameToVirtualText' : 'false',
"             \ 'virtualTextPrefix' : ' ❯❯❯ ',
"             \ 'addedSign' : { 'text': '➕' },
"             \ 'changedSign' : { 'text': 'Ⓜ️' },
"             \ 'removedSign' : { 'text': '➖' },
"             \ 'topRemovedSign' : { 'text': '⚠️' },
"             \ 'changeRemovedSign' : { 'text': '⚡️'}
"             \ })

nnoremap <Leader>gt :CocCommand git.toggleGutters <CR>

" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
