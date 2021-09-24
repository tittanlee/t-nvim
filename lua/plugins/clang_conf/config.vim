


let g:gencconf_ignore_dirs = ['__pycache__', 'out', 'lib',
    \ 'cache', 'doc', 'docs']

let g:gencconf_root_markers = ['.root', '.git', '.svn', '.hg', '.repo']

let g:gencconf_suffix_list = { 'c': ['c'], 'cpp': ['cc', 'cpp'], 'h': ['h', 'hh']}

let g:gencconf_default_options = {'c': ['clang', '-c', '-std=c11'], 'cpp': ['g++', '-c', '-std=c++14']}

let g:gencconf_conf_name = 'compile_flags.txt'

let g:gencconf_load_tags = 0

let g:gencconf_storein_rootmarker = 0
