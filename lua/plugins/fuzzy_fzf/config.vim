
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

let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

let g:fzf_preview_window = ["up:50%:border-horizontal:nohidden"]

let g:fzf_preview_cmd = [
            \ "bat",
            \ "--number",
            \ "--color always",
            \ "--theme Dracula",
            \ ]

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'
  \ }


function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, float2nr(&columns * 0.9)])])
    let height = min([&lines - 4, max([20, float2nr(&lines * 0.9)])])
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
    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    call nvim_win_set_option(win, "winblend", 10)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction






let s:fzf_config_root = fnamemodify(expand('<sfile>'), ':h')

exec "source " . s:fzf_config_root . "/provider/fzf_ctags.vim"
exec "source " . s:fzf_config_root . "/provider/fzf_files.vim"
exec "source " . s:fzf_config_root . "/provider/fzf_gtags.vim"

