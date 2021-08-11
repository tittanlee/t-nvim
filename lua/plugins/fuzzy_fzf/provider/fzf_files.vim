
let s:fzf_file_list_opts = [
            \ '--prompt="File_List > " '
            \]


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
    let l:expect_action_key = join(keys(g:fzf_action), ",")
    let opts = printf("%s %s --expect=%s", 
                \ $FZF_DEFAULT_OPTS,
                \ join(s:fzf_file_list_opts, " "),
                \ l:expect_action_key
                \)
    let l:preview_cmd = printf("--preview=\"%s --line-range %d: {%d}\"",
                \ join(g:fzf_preview_cmd, " "),
                \ 1,
                \ 1
                \ )
    let l:preview_window_opt = printf("--preview-window=\"%s\"", join(g:fzf_preview_window, ":"))
    return opts . " " . l:preview_cmd . " " . l:preview_window_opt
endfunction
















command! -nargs=? -bang FzfFilesProvider call fzf_files#provider(<q-args>)

