

local M = {}

local module_key = require("environment").keys.module.toggle_term
local keymap = require("utils").keymap


function M.on_term_create(term)
end

function M.on_term_open(term)
    keymap("t"   , module_key.back_to_normal, [[<C-\><C-n>]]      , {buffer = term.buf, desc = ""})
    -- keymap("t", "jk"                     , [[<C-\><C-n>]]      , {buffer = term.buf, desc = ""})
    keymap("t"   , module_key.mv_win_up     , [[<C-\><C-n><C-W>k]], {buffer = term.buf, desc = ""})
    keymap("t"   , module_key.mv_win_down   , [[<C-\><C-n><C-W>j]], {buffer = term.buf, desc = ""})
    keymap("t"   , module_key.mv_win_left   , [[<C-\><C-n><C-W>h]], {buffer = term.buf, desc = ""})
    keymap("t"   , module_key.mv_win_right  , [[<C-\><C-n><C-W>l]], {buffer = term.buf, desc = ""})
end

function M.on_term_close(term)
end

function M.on_term_exit(term, job, exit_code, name)
end

function M.on_term_stdout(term, job, data, name)
end

function M.on_term_stderr(term, job, data, name)
end


return M
