


vim.g.grepper = {
    -- Grep the current buffer.
    buffer              = 0,

    -- Grep all loaded buffers.
    buffers             = 0,

    -- Highlight found matches. This implies |g:grepper.searchreg|.
    highlight           = 1,

    -- Use the quickfix list for the matches or the location list otherwise.
    quickfix            = 1,

    -- Open the quickfix/location window after the grep tool finished running.
    open                = 1,

    -- When the quickfix/location window opens, switch to it.
    switch              = 0,

    -- Automatically jump to the first match.
    jump                = 0,

    -- To prompt or not to prompt!
    prompt              = 1,

    -- The text the prompt displays. It knows two specifiers:
    prompt_text         = "$c>",

    -- 1    Quote the query automatically.
    -- 2    Populate the prompt with single quotes and put cursor in between.
    -- 3    Populate the prompt with double quotes and put cursor in between.
    prompt_quote        = 0,

    --  cwd
    --     Use the current working directory as reported by |:pwd|.
    --
    --  file
    --     Change to the directory of the current buffer.
    --
    --  filecwd
    --     Change to the directory of the current buffer, but only, if that directory
    --     isn't below the current working directory already.
    --
    --  repo
    --     Start searching for any directory or file from |g:grepper.repo| from the
    --     current directory upwards. If there is a match, switch to its directory.
    --
    --     Exception: If git is used, we first try `git rev-parse --show-toplevel`,
    --     since submodules don't have an own .git directory.
    --
    -- You can specify multiple values:
    --
    --     let g:grepper.dir = 'repo,file'
    dir                 = "cwd",

    -- The directories or files to search for when using |g:grepper.dir| with `repo`.
    repo                = {".git", ".repo", ".svn"},

    -- Open a new window and show matches with surrounding context.
    side                = 0,

    -- The command used for opening the side window. See |grepper-side| for details.
    side_cmd            = "vnew",

    -- let g:grepper.tools = ['git', 'ag', 'ack', 'ack-grep', 'grep', 'findstr', 'rg', 'pt', 'sift']
    tools               = {
        "rg"
    },

    rg = {
        grepprg = "rg -H --no-heading --vimgrep --smart-case $* ",
    },

    -- The prompt uses this mapping to toggle the |:Grepper-tool| flag.
    -- let g:grepper.prompt_mapping_tool = '<tab>'
    prompt_mapping_tool = "<tab>",

    -- The prompt uses this mapping to toggle the |:Grepper-dir| flag.
    -- let g:grepper.prompt_mapping_dir = '<c-d>'
    prompt_mapping_dir  = "<c-d>",

    -- The prompt uses this mapping to toggle the |:Grepper-side| flag.
    -- let g:grepper.prompt_mapping_side = '<c-s>'
    prompt_mapping_side = "<c-s>",

    -- This limits the number of matches for asynchronous searches.
    stop                = 0,

    -- Append matches to the current quickfix or location list.
    append              = 0,

    -- The query, after changed to a Vim regexp, is added to the last search register
    -- (|quote/|) and search |history|.
    searchreg           = 0,
}



vim.g.grepper = {
    buffer = 0,
    buffers = 0,
    open = 1,
    quickfix = 1,
    searchreg = 1,
    highlight = 0,
    jump = 0,
    prompt = 1,
    tools = { "rg" },
    rg = {
        grepprg = "rg -H --no-heading --vimgrep --smart-case $* ",
        -- grepformat = "%f:%l:%c: %m"
    }
}
