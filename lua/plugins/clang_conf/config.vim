
let g:gen_clang_conf#ignore_dirs = [
            \ '__pycache__', 
            \ 'doc', 
            \ 'docs'
            \ ]

let g:gen_clang_conf#scm_list = ['.root', '.git', '.svn', '.hg', '.repo']

let g:gen_clang_conf#suffix_list = ['.c', '.cc', '.cpp', '.h', '.hh']

let g:gen_clang_conf#default_conf = ['%c -std=c11', '%cpp -std=c++14']

let g:gen_clang_conf#conf_name = 'compile_flags.txt'
