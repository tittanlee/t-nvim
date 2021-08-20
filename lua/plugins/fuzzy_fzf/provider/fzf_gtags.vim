
let s:fzf_gtags_fields = {
            \ 'separator' : ' ',
            \ 'file_name' : 0,
            \ 'line_start_no' : 1,
            \ 'highlight_line' : 2,
            \ }

let s:fzf_gtags_interface_opts = [
            \ '--with-nth=1',
            \ '-d " "',
            \ '--prompt="Gtags_Jump > " '
            \ ]

function! fzf_gtags#jump(identifier, param)
    let l:gtags_cmd_fmt = "global %s %s --result=cscope"
    let l:gtags_command = printf(l:gtags_cmd_fmt, a:param, a:identifier)

    let l:gtags_result_list = split (system(l:gtags_command), "\n")
    if empty(l:gtags_result_list)
        echo 'Gtag not found : ' . a:identifier
        return
    endif

    let l:gtags_result_lines = map(
                \ l:gtags_result_list,
                \ function('s:trim_gtags_list')
                \ )

    let l:fzf_run_opts = s:fzf_run_gtags_opts()

    call fzf#run({
                \ 'source'  : l:gtags_result_lines,
                \ 'window'  : g:fzf_layout['window'],
                \ 'sink*'   : function('s:sink_gtags_select_callback', [a:identifier]),
                \ 'options' : l:fzf_run_opts
                \ })
endfunction


function! s:trim_gtags_list(index, item_list)
    "                          0         1        2       3
    " result=gtags -> fields = file_name tag_name line_no content
    let l:file_name = split(a:item_list, " ")[0]
    " let l:tags_name = split(a:item_list, " ")[1]
    let l:line_no   = split(a:item_list, " ")[2]

    "result=gtags line list field = file_name | start_line_no | highlight_line_no
    return printf("%s %d %d",
                \ l:file_name,
                \ l:line_no > 10 ? l:line_no - 10 : 0,
                \ l:line_no
                \ )
endfunction

function! s:sink_gtags_select_callback(identifier, selection)
    " avoid the null list selected
    if empty(a:selection)
        return
    endif

    let separator = s:fzf_gtags_fields['separator']
    let file_name_section = s:fzf_gtags_fields['file_name']
    let line_rng_start  = s:fzf_gtags_fields['line_start_no']
    let highlight_line = s:fzf_gtags_fields['highlight_line']

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

function! s:fzf_run_gtags_opts()
    let opts = []

    for l:interface_opts in s:fzf_gtags_interface_opts
        let opts += [l:interface_opts]
    endfor

    let opts += ['--expect', join(keys(g:fzf_action), ",")] 

    let l:preview_cmd = printf("%s --line-range {%d}: --highlight-line {%d} {%d}",
                \ join(g:fzf_preview_cmd, " "),
                \ s:fzf_gtags_fields['line_start_no'] + 1,
                \ s:fzf_gtags_fields['highlight_line'] + 1,
                \ s:fzf_gtags_fields['file_name'] + 1
                \ )
    let opts += ['--preview', l:preview_cmd]

    let opts += ['--preview-window', g:fzf_preview_window[0]]

    return opts
endfunction


command! -nargs=+ -bang FzfGtagsJump call fzf_gtags#jump(<f-args>)
