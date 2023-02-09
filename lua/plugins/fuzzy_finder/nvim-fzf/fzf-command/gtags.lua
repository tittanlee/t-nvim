
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

local gtags_fields = {
    file_name  = 1,
    start_line = 2,
    focus_line = 3,
}

local function trim_gtags_result(result)
    local tags_table = {}

    local result_to_table = vim.fn.split(result, "\n") 
    for _, context in ipairs(result_to_table) do
        ctx_fields = vim.fn.split(context, " ")
        local filename = ctx_fields[1]
        local line_no  = ctx_fields[3]

        local start_line = 0
        if tonumber(line_no) >= 10 then
            start_line = tonumber(line_no) - 10
        end

        local candiate = table.concat({
            filename,
            tostring(start_line),
            line_no
        }, " ")

        table.insert(tags_table, candiate)
    end

    return tags_table
end

local gtags_jump = function(action)
    local identifier = vim.fn.expand("<cword>")
    local gtags_cmd = string.format("global %s %s --result=cscope", action, identifier)
    local handle = io.popen(gtags_cmd)

    if handle == nil then
        return
    end

    local result = handle:read("*a")
    handle:close()

    if vim.fn.len(result) == 0 then
        vim.notify("gtags jump #" .. identifier .. "# empty" )
        return
    end

    local gtags_content = trim_gtags_result(result)

    coroutine.wrap(function()
        local result, exit_code = fzf.fzf(
            gtags_content,
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
            local filename   = tags_table[gtags_fields.file_name]
            local focus_line = tags_table[gtags_fields.focus_line]
            local edit_cmd   = string.format("%s +%d %s", vimcmd, focus_line, vim.fn.fnameescape(filename))
            vim.cmd(edit_cmd)
            -- center the window
            vim.cmd("normal! zz")
        end
    end)()
end

local M = {}

M.definition = function()
    gtags_jump("-d")
end

M.reference = function()
    gtags_jump("-r")
end

M.symbol = function()
    gtags_jump("-s")
end

M.grepper = function()
    gtags_jump("-g")
end

return M
