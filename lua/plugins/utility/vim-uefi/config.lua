
local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    return
end

local comment_ft = require("Comment.ft")
comment_ft({
    "uefidec",
    "uefifdf",
    "uefidsc",
    "uefiuni",
    "uefiinf",
    "uefisdl",
    "uefivfr",
}, "#%s")
