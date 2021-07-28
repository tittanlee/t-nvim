

" Defines whether Gutentags should be enabled
let g:gutentags_enabled = 0

" Defines some advanced commands like
" |GutentagsToggleEnabled| and |GutentagsUnlock|
let g:gutentags_define_advanced_commands = 1

" GTAGSLABEL 告诉 gtags 默认 C/C++/Java 等六种原生支持的代码直接使用 gtags 本地分析器，而其他语言使用 pygments 模块
" pip install Pygments
" let $GTAGSLABEL = 'native-pygments'
let $GTAGSLABEL = 'native'

" 环境变量必须设置，否则会找不到 native-pygments 和 language map 的定义,
" Windows 下面在 gtags/share/gtags/gtags.conf，Linux 下要到 /usr/local/share/gtags 里找，
" 也可以把它拷贝成 ~/.globalrc ，Vim 配置的时候方便点。
if (has('win32') || has('win64'))
   let $GTAGSCONF = 'C:/utility_tools/share/gtags/gtags.conf'
else
   let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
endif

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
" let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project', 'MdePkg']
" let g:gutentags_add_default_project_roots = ['.root', '.svn', '.git', '.hg', '.project', 'MdePkg']
function! Gutentags_project_root_finder_hook_func(path)
    return getcwd()
endfunction
let g:gutentags_project_root_finder = 'Gutentags_project_root_finder_hook_func'

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 默认生成的数据文件集中到 ~/.cache/tags 避免污染项目目录，好清理
"let g:gutentags_cache_dir = expand('D:/Tools/vim/vim_8.2.2129/vimfiles/cache/tags')
lua << EOF
    vim.g.gutentags_cache_dir = DATA_PATH .. ENV.path_sep .. "cache_tags"
EOF
" let g:gutentags_cache_dir = g:gtags_cache_dir

" 默认禁用自动生成
let g:gutentags_modules = []

" 如果有 ctags 可执行就允许动态生成 ctags 文件
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif

" 如果有 gtags 可执行就允许动态生成 gtags 数据库
if executable('gtags') && executable('gtags-cscope')
    let g:gutentags_modules += ['gtags_cscope']
endif

let g:gutentags_resolve_symlinks = 1
let g:gutentags_file_list_command = "rg --files --no-hidden --no-ignore"

" 设置 ctags 的参数
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args += ['-R']
let g:gutentags_ctags_extra_args += ['--sort=foldcase']
"let g:gutentags_ctags_extra_args += ['--excmd=combine']
" let g:gutentags_ctags_extra_args += ['--exclude=Build']

" $ ctags --list-kinds=C
" d  macro definitions
" e  enumerators (values inside an enumeration)
" f  function definitions
" g  enumeration names
" h  included header files
" l  local variables [off]
" m  struct, and union members
" p  function prototypes [off]
" s  structure names
" t  typedefs
" u  union names
" v  variable definitions
" x  external and forward variable declarations [off]
" z  function parameters inside function definitions [off]
" L  goto labels [off]
" let g:gutentags_ctags_extra_args += ['--C-kinds=+defghlmpstuvxz']
let g:gutentags_ctags_extra_args += ['--C-kinds=+pxzL']
let g:gutentags_ctags_extra_args += ['--C++-kinds=+px']

" $ ctags --list-extras
" #LETTER NAME              ENABLED LANGUAGE FIXED DESCRIPTION
" -       anonymous         yes     NONE     no    Include tags for non-named objects like lambda
" -       subword           no      NONE     no    Include tags for subwords generated by splitting the original tag (only for ctags development)
" F       fileScope         yes     NONE     no    Include tags of file scope
" f       inputFile         no      NONE     no    Include an entry for the base file name of every input file
" g       guest             no      NONE     no    Include tags generated by guest parsers
" p       pseudo            yes     NONE     no    Include pseudo tags
" q       qualified         no      NONE     no    Include an extra class-qualified tag entry for each tag
" r       reference         no      NONE     no    Include reference tags
" s       subparser         yes     NONE     no    Include tags generated by subparsers
" -       funcmap           yes     QemuHX   no    Include mapping SQMP to C function name
" -       whitespaceSwapped yes     Robot    no    Include tags swapping whitespace and underscore chars
let g:gutentags_ctags_extra_args += ['--extras=+fq']

" $ ctags --list-fields
" #LETTER NAME           ENABLED LANGUAGE         JSTYPE FIXED DESCRIPTION
" N       name           yes     NONE             s--    yes   tag name
" F       input          yes     NONE             s--    yes   input file
" P       pattern        yes     NONE             s-b    yes   pattern
" C       compact        no      NONE             s--    no    compact input line (used only in xref output)
" E       extras         no      NONE             s--    no    Extra tag type information
" K       NONE           no      NONE             s--    no    Kind of tag as full name
" R       NONE           no      NONE             s--    no    Marker (R or D) representing whether tag is definition or reference
" S       signature      no      NONE             s--    no    Signature of routine (e.g. prototype or parameter list)
" Z       scope          no      NONE             s--    no    Include the "scope:" key in scope field (use s) in tags output, scope name in xref output
" a       access         no      NONE             s--    no    Access (or export) of class members
" e       end            no      NONE             -i-    no    end lines of various items
" f       file           yes     NONE             --b    no    File-restricted scoping
" i       inherits       no      NONE             s-b    no    Inheritance information
" k       NONE           yes     NONE             s--    no    Kind of tag as a single letter
" l       language       no      NONE             s--    no    Language of input file containing tag
" m       implementation no      NONE             s--    no    Implementation information
" n       line           no      NONE             -i-    no    Line number of tag definition
" p       scopeKind      no      NONE             s--    no    Kind of scope as full name
" r       roles          no      NONE             s--    no    Roles
" s       NONE           yes     NONE             s--    no    Scope of tag definition (`p' can be used for printing its kind)
" t       typeref        yes     NONE             s--    no    Type and name of a variable or typedef
" x       xpath          no      NONE             s--    no    xpath for the tag
" z       kind           no      NONE             s--    no    Include the "kind:" key in kind field (use k or K) in tags output, kind full name in xref output
" -       properties     no      C                s--    no    properties (static, inline, mutable,...)
" -       captures       no      C++              s--    no    lambda capture list
" -       name           yes     C++              s--    no    aliased names
" -       properties     no      C++              s--    no    properties (static, inline, mutable,...)
" -       template       no      C++              s--    no    template parameters
" -       properties     no      CUDA             s--    no    properties (static, inline, mutable,...)
" -       assignment     yes     LdScript         s--    no    how a value is assigned to the symbol
" -       sectionMarker  no      Markdown         s--    no    character used for declaring section(#, ##, =, or -)
" -       version        no      Maven2           s--    no    version of artifact
" -       home           yes     Passwd           s--    no    home directory
" -       shell          yes     Passwd           s--    no    login shell
" -       decorators     no      Python           s--    no    decorators on functions and classes
" -       sectionMarker  no      ReStructuredText s--    no    character used for declaring section
let g:gutentags_ctags_extra_args += ['--fields=+niazS']

" 使用 universal-ctags 的话需要下面这行，请反注释
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁止 gutentags 自动链接 gtags 数据库
let g:gutentags_auto_add_gtags_cscope = 1

