

local env_var = require("environment").variable
local status_ok, nord= pcall(require, "nord")

if not status_ok then
    return
end

if env_var.colorscheme ~= "nord" then
    return
end

nord.set()
