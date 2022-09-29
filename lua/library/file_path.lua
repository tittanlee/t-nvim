

local M = {}

function M.fname_switch()
    if ENV.status_show_file_path == 'relative' then
        ENV.status_show_file_path = 'absolute'
        return
    end

    if ENV.status_show_file_path == 'absolute' then
        ENV.status_show_file_path = 'tail'
        return
    end

    if ENV.status_show_file_path == 'tail' then
        ENV.status_show_file_path = 'relative'
        return
    end
end

return M
