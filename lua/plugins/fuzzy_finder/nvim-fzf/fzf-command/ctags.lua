
local status_ok, fzf = pcall(require, 'fzf')
if not status_ok then
    return
end

local on_create = function()
    local bufid = vim.api.nvim_get_current_buf()
    local winid = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_option(winid, "winblend", 10)
end


local fzf_opts = table.concat({
    '--with-nth=1',
    '--delimiter=" "',
    '-x',
    -- '--ansi',
    '--multi',
    '--marker="#"',
    '--info=inline',
    '--pointer="->"',
    '--expect=ctrl-x,ctrl-t,ctrl-v',
    '--prompt="Tag Jump > "',

    '--bind=?:toggle-preview',
    '--bind=ctrl-d:preview-page-down',
    '--bind=ctrl-u:preview-page-up',

    '--preview="bat --number --color always --theme Dracula --line-range {2}: --highlight-line {3} {1}"',
    '--preview-window=up:50%:border-horizontal',
}, ' ')


local tags_fields = {
    file_name  = 1,
    start_line = 2,
    focus_line = 3,
    kind       = 4,
}

-- delimiter field = " " (Space)
-- output = {
-- "filename | start_line | focus_line | kind",
-- }
local function tag_to_string(tag_list)
    local result = {}

    for _, body in ipairs(tag_list) do
        local filename = body.filename
        local line     = body.line
        local kind     = body.kind

        local start_line = 0
        if tonumber(line) > 10 then
            start_line = line - 10
        end

        local candiate = table.concat({
            filename,
            tostring(start_line),
            line,
            kind,
        }, " ")

        table.insert(result, candiate)
    end

    return result
end


local ctags_jump = function()
    local identifier = vim.fn.expand("<cword>")
    local tag_list = vim.fn.taglist("^" .. identifier .. "$")
    local ctags_content = tag_to_string(tag_list)

    if not next(ctags_content) then
        -- Table is empty
        vim.notify("ctags jump #" .. identifier .. "# empty" )
        return
    end

    coroutine.wrap(function()
        local result, exit_code = fzf.fzf(
            ctags_content,
            fzf_opts,
            { border = true, window_on_create = on_create}
        )

        if not result then
            return
        end

        local vimcmd

        -- result is a list of lines that fzf returns, if the user has chosen
        if result[1] == 'ctrl-v' then
            vimcmd = 'vsplit'
        elseif result[1] == 'ctrl-x' then
            vimcmd = 'split'
        else
            vimcmd = 'edit'
        end

        for i=2,#result do
            local tags_table = vim.fn.split(result[i], " ")
            local filename   = tags_table[tags_fields.file_name]
            local focus_line = tags_table[tags_fields.focus_line]
            local edit_cmd   = string.format("%s +%d %s", vimcmd, focus_line, vim.fn.fnameescape(filename))
            vim.cmd(edit_cmd)

            -- center the window
            vim.cmd("normal! zz")
        end
    end)()
end

return ctags_jump
