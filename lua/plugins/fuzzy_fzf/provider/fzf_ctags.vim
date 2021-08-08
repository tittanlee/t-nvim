

let s:fzf_ctags_fields = {
            \ 'separator' : ' ',
            \ 'file_name' : 0,
            \ 'line_start_no' : 1,
            \ 'highlight_line' : 2,
            \ }

let s:fzf_ctags_opts = [
            \ '--with-nth=1',
            \ '-d " " ',
            \ '--prompt="Ctags_Jump > " '
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

    let ctags_source_list = map (
                \ relevant_fields, 
                \ 'join(v:val, s:fzf_ctags_fields["separator"])'
                \ )

    let l:fzf_run_opts = s:fzf_run_ctags_opts()

    call fzf#run({
                \ 'source'  : ctags_source_list,
                \ 'window'  : g:fzf_layout['window'],
                \ 'sink*'   : function('s:sink_ctags_select_callback', [a:identifier]),
                \ 'options' : l:fzf_run_opts
                \ })
endfunction


function! s:tag_to_string(index, tag_dict)
    let components = []

    if has_key(a:tag_dict, 'filename')
        call add(components, (a:tag_dict['filename']))
    endif

    if has_key(a:tag_dict, 'line')
        let highlight_line = a:tag_dict['line']

        " line start no
        if (highlight_line > 10)
            call add(components, highlight_line - 10)
        else
            call add(components, 0)
        endif

        " highlight_line_no
        call add(components, highlight_line)
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
    let line_rng_start  = s:fzf_ctags_fields['line_start_no']
    let highlight_line = s:fzf_ctags_fields['highlight_line']

    let selected_with_key = a:selection[0]
    let selected_text = a:selection[1]

    " Open new split or tab.
    if has_key(g:fzf_action, selected_with_key)
        execute 'silent' g:fzf_action[selected_with_key]
    endif

    let file_name = split(selected_text, separator)[file_name_section]
    let line_no   = split(selected_text, separator)[highlight_line]

    let cmd = printf('silent edit +%d %s', line_no, file_name)
    silent execute cmd
endfunction



function! s:fzf_run_ctags_opts()
    let l:expect_action_key = join(keys(g:fzf_action), ",")
    let opts = printf("%s %s --expect=%s",
                \ $FZF_DEFAULT_OPTS,
                \ join(s:fzf_ctags_opts, " "),
                \ l:expect_action_key
                \ )
    let l:preview_cmd = printf("--preview=\"%s --line-range {%d}: --highlight-line {%d} {%d}\"",
                \ join(g:fzf_preview_cmd, " "),
                \ s:fzf_ctags_fields['line_start_no'] + 1,
                \ s:fzf_ctags_fields['highlight_line'] + 1,
                \ s:fzf_ctags_fields['file_name'] + 1
                \ )
    let l:preview_window_opt = printf("--preview-window=\"%s\"", join(g:fzf_preview_window, " "))
    return opts . " " . l:preview_cmd . " " . l:preview_window_opt
endfunction







command! -nargs=+ -bang FzfCtagsJump call fzf_ctags#jump(<f-args>)

