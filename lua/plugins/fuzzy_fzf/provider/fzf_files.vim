
let s:fzf_file_list_interface_opts = [
            \ '--with-nth', '1',
            \ '-d', '\|',
            \ '--prompt="File_List > " '
            \ ]


function! fzf_files#provider(identifier)

    if empty(a:identifier)
        let l:file_list_cmd = printf("%s", $FZF_DEFAULT_COMMAND)
    else
        let l:file_list_cmd = printf("%s %s", $FZF_DEFAULT_COMMAND, a:identifier)
    endif

    let l:files_list = split(system(l:file_list_cmd), "\n")
    let l:fzf_run_opts = s:fzf_run_file_list_opts()
    call fzf#run({
                \ 'source'  : l:files_list,
                \ 'window'  : g:fzf_layout['window'],
                \ 'sink*'   : function('s:sink_file_list_callback', [a:identifier]),
                \ 'options' : l:fzf_run_opts
                \ })
endfunction


function! s:sink_file_list_callback(identifier, selection)
    " avoid the null list selected
    if empty(a:selection)
        return
    endif

    let selected_with_key = a:selection[0]
    let selected_text = a:selection[1]

    " Open new split or tab.
    if has_key(g:fzf_action, selected_with_key)
        execute 'silent' g:fzf_action[selected_with_key]
    endif

    let cmd = printf('silent edit %s', selected_text)
    execute cmd
endfunction


function! s:fzf_run_file_list_opts()
    let opts = []

    for l:interface_opts in s:fzf_file_list_interface_opts
        let opts += [l:interface_opts]
    endfor

    let opts += ['--expect', join(keys(g:fzf_action), ",")] 

    let l:preview_cmd = printf("%s --line-range %d: {%d}",
                \ join(g:fzf_preview_cmd, " "),
                \ 1,
                \ 1
                \ )
    let opts += ['--preview', l:preview_cmd]

    let opts += ['--preview-window', g:fzf_preview_window[0]]

    return opts
endfunction
















command! -nargs=? -bang FzfFilesProvider call fzf_files#provider(<q-args>)

