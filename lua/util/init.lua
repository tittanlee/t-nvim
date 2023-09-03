
local M = {}

--- Open a URL under the cursor with the current operating system
---@param path string The path of the file to open with the system opener
M.system_open = function(path)
    -- TODO: REMOVE WHEN DROPPING NEOVIM <0.10
    if vim.ui.open then
        return vim.ui.open(path)
    end

    local cmd
    if vim.fn.has "win32" == 1 and vim.fn.executable "explorer" == 1 then
        cmd = { "cmd.exe", "/K", "explorer" }
    elseif vim.fn.has "unix" == 1 and vim.fn.executable "xdg-open" == 1 then
        cmd = { "xdg-open" }
    elseif (vim.fn.has "mac" == 1 or vim.fn.has "unix" == 1) and vim.fn.executable "open" == 1 then
        cmd = { "open" }
    end

    if not cmd then
        M.notify("Available system opening tool not found!", vim.log.levels.ERROR)
    end

    vim.fn.jobstart(
        vim.fn.extend(cmd, { path or vim.fn.expand "<cfile>" }),
        { detach = true }
    )
end


--- Serve a notification with a title of AstroNvim
---@param msg string The notification body
---@param type? number The type of the notification (:help vim.log.levels)
---@param opts? table The nvim-notify options to use (:help notify-options)
M.notify = function(msg, type, opts)
    vim.schedule(
        function()
            vim.notify(msg, type, { title = "NEOVIM" }, opts)
        end
    )
end


return M
