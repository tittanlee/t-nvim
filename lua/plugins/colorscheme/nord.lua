
local env_var = require("environment").variable
if env_var.colorscheme ~= "nord" then
    return
end

local status_ok, nord= pcall(require, "nord")
if not status_ok then
    return
end


nord.set()
