
let s:coc_config_root = fnamemodify(expand('<sfile>'), ':h')

call coc#add_extension(
            \ "coc-yank",
            \ "coc-marketplace",
            \ "coc-translator",
            \ "coc-snippets",
            \ "coc-ultisnips",
            \ "coc-terminal",
            \ "coc-json",
            \ "coc-tsserver",
            \ "coc-clangd",
            \ "coc-vimlsp",
            \ "coc-pyright",
            \ "coc-sh",
            \ "coc-sumneko-lua",
            \)
            " \ "coc-explorer",

" Disable file with size > 1MB
autocmd BufAdd * if getfsize(expand('<afile>')) > 1024*1024 |
            \ let b:coc_enabled=0 |
            \ endif

"
" source coc extensions confiuration
"
exec "source " . s:coc_config_root . "/coc-diagnostic/config.vim"

if (index(g:coc_global_extensions, "coc-translator") >= 0)
    exec "source " . s:coc_config_root . "/coc-translator/config.vim"
endif

if (index(g:coc_global_extensions, "coc-snippets") >= 0)
    exec "source " . s:coc_config_root . "/coc-snippets/config.vim"
endif

if (index(g:coc_global_extensions, "coc-explorer") >= 0)
    exec "source " . s:coc_config_root . "/coc-explorer/config.vim"
endif

if (index(g:coc_global_extensions, "coc-git") >= 0)
    exec "source " . s:coc_config_root . "/coc-git/config.vim"
endif
