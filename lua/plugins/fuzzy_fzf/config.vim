
let $FZF_DEFAULT_OPTS    = '
            \ --multi
            \ --info=inline
            \ --pointer="->"
            \ --marker="#"
            \ --layout=default
            \ --border=none
            \ --bind="ctrl-d:preview-page-down"
            \ --bind="ctrl-u:preview-page-up"
            \ --bind="?:toggle-preview"
            \ --bind="ctrl-f:page-up"
            \ --bind="ctrl-n:page-down"
            \'

let $FZF_DEFAULT_COMMAND = "rg --files --no-follow --hidden --no-ignore -g !.git/ -g !.repo"


function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction


let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
let g:fzf_preview_window = [ "right:50%:border-vertical:hidden" ]

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
