
" diagnostic toggle dynamically
nnoremap <Leader>dt :call CocAction('diagnosticToggle')<CR>

"Show diagnostic message of current position by
nnoremap <Leader>di <plug>(coc-diagnostic-info)<CR>

" Open vim's location-list with diagnostics of current buffer.
nnoremap <Leader>dd :CocDiagnostics<CR>

" Jump to previous / next diagnostic position.
nmap ]d <plug>(coc-diagnostic-next)
nmap [d <plug>(coc-diagnostic-prev)


