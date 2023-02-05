
local status_ok, fzf = pcall(require, 'fzf')
if not status_ok then
    return
end

local file_list_cmd = table.concat({
    'rg',
    '--files',
    '--no-follow',
    '--hidden',
    '--no-ignore',
    '-g !.git/',
    '-g !.repo'
}, ' ')

local fzf_opts = table.concat({
    '-x',
    -- '--ansi',
    '--multi',
    '--info=inline',
    '--pointer="->"',
    '--marker="#"',
    '--expect=ctrl-x,ctrl-t,ctrl-v',
    '--prompt="File List > "',

    '--bind=?:toggle-preview',
    '--bind=ctrl-d:preview-page-down',
    '--bind=ctrl-u:preview-page-up',

    '--preview="bat --number --color always --theme Dracula --line-range 1: {1}"',
    '--preview-window=right:50%:border-rounded:hidden',
}, ' ')



local on_create = function()
    local bufid = vim.api.nvim_get_current_buf()
    local winid = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_option(winid, "winblend", 10)
end

local files = function()
    coroutine.wrap(function()
        local result, exit_code = fzf.fzf(
            file_list_cmd,
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
            vim.cmd(vimcmd .. ' ' .. vim.fn.fnameescape(result[i]))
        end

    end)()
end


return files
