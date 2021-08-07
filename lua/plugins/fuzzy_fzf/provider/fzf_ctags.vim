

let s:fzf_ctags_fields = {
            \ 'separator' : ' ',
            \ 'file_name' : 0,
            \ 'focus_line' : 1,
            \ 'line_range_start' : 2,
            \ }

let s:fzf_ctags_opts = [
            \ '--with-nth=1',
            \ '-d " " ',
            \ '--prompt="ctags_jump >" '
            \ ]

function! fzf_ctags#jump(identifier)
    let tag_list = taglist('^' . a:identifier . '$')
    if (len(tag_list) == 0)
        echohl WarningMsg
        echo 'Tag not found : ' . a:identifier
        echohl None
        return
    endif

    let relevant_fields = map(
                \   tag_list,
                \   function('s:tag_to_string')
                \ )

    let ctags_source_list = map (relevant_fields, 'join(v:val, s:fzf_ctags_fields["separator"])')

    let fzf_run_opts = s:fzf_ctags_parameter()

    call fzf#run({
                \ 'source'  : ctags_source_list,
                \ 'window'  : g:fzf_layout['window'],
                \ 'sink*'   : function('s:sink_ctags_select_callback', [a:identifier]),
                \ 'options' : fzf_run_opts
                \ })
endfunction


function! s:tag_to_string(index, tag_dict)
    let components = []

    if has_key(a:tag_dict, 'filename')
        call add(components, (a:tag_dict['filename']))
    endif

    if has_key(a:tag_dict, 'line')
        let highlight_line = a:tag_dict['line']
        call add(components, highlight_line)

        " line range start
        if (highlight_line > 10)
            call add(components, highlight_line - 10)
        else
            call add(components, 0)
        endif
    endif


    return components
endfunction

function! s:sink_ctags_select_callback(identifier, selection)
    " avoid the null list selected
    if empty(a:selection)
        return
    endif

    let separator = s:fzf_ctags_fields['separator']
    let file_name_section = s:fzf_ctags_fields['file_name']
    let line_no_section = s:fzf_ctags_fields['focus_line']
    let line_rng_start  = s:fzf_ctags_fields['line_range_start']

    let select_text = a:selection[0]
    let file_name = split(select_text, separator)[file_name_section]
    let line_no   = split(select_text, separator)[line_no_section]

    let cmd = printf('silent edit +%d %s', line_no, file_name)
    silent execute cmd
endfunction



function! s:fzf_ctags_parameter()
    return printf("%s %s", $FZF_DEFAULT_OPTS, join(s:fzf_ctags_opts, " "))
endfunction







command! -nargs=+ -bang FzfCtagsJump call fzf_ctags#jump(<f-args>)

nnoremap <Leader>fj :FzfCtagsJump <C-R>=expand('<cword>')<CR><CR>
