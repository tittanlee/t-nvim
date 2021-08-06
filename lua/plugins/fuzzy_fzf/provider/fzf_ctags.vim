

let g:fzf_ctags_fields = {
            \ 'separator' : '|',
            \ 'file_name' : 0,
            \ 'focus_line' : 1,
            \ 'line_range_start' : 2,
            \ }


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

    let ctags_source_list = map (relevant_fields, 'join(v:val, g:fzf_ctags_fields["separator"])')
    call fzf#run({
                \ 'source'  : ctags_source_list,
                \ 'window'  : g:fzf_layout['window'],
                \ 'sink*'   : function('s:sink_ctags_select_callback', [a:identifier]),
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

    let separator = g:fzf_ctags_fields['separator']
    let file_name_section = g:fzf_ctags_fields['file_name']
    let line_no_section = g:fzf_ctags_fields['focus_line']
    let line_rng_start  = g:fzf_ctags_fields['line_range_start']


    let select_text = a:selection[0]

    let file_name = split(select_text, separator)[file_name_section]
    let line_no   = split(select_text, separator)[line_no_section]

    let cmd = printf('silent edit +%d %s', line_no, file_name)
    silent execute cmd

endfunction

function! s:fzf_ctags_opts(options)
    let opts = 

endfunction
