
" Verbose mode to echo some message.
let g:gen_tags#verbose = 1


" universal-ctags support
if (has('win32') || has('win64'))
   let $GTAGSCONF = 'C:/utility_tools/share/gtags/gtags.conf'
else
   let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
endif
let $GTAGSLABEL = 'native'
" let $GTAGSLABEL = 'new-ctags'


" Set ctags options. The `-R` is set by default,
let g:gen_tags#ctags_opts = [
            \ '--sort=foldcase',
            \ '--c++-kinds=+pxzL',
            \ '--c-kinds=+px',
            \ '--extras=+fq',
            \ '--fields=+niazS',
            \ '--output-format=e-ctags'
            \ ]

" Set gtags options. The database path is the default.
let g:gen_tags#gtags_opts = [
            \ '--incremental',
            \ '--skip-symlink',
            \ '--skip-unreadable',
            \ ]

"Auto update ctags / gtags
let g:gen_tags#ctags_auto_update = 0
let g:gen_tags#gtags_auto_update = 0

" A list to set the blacklist
let g:gen_tags#blacklist = [
      \ ]

" Assign root path to set the project root.
let g:gen_tags#root_path = expand(getcwd())


" This option allow to specify your own cache dir.
let g:gen_tags#use_cache_dir = 1
let g:gen_tags#cache_dir = '$HOME/.cache/tags_dir/'

" Disable default mappings
let g:gen_tags#gtags_default_map = 0

" Enable/Disable statusline feature.
let g:gen_tags#statusline = 1
