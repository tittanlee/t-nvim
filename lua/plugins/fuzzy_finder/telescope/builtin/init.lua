
local M = {}


local ts_builtin = require('telescope.builtin')

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ find files ❱━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
M.find_files = function()
    local opts = {
        find_command = {
            "rg",
            "--files",
            "--glob=!.git/",
        },
        hidden = true,
        follow = false,
        layout_strategy = "horizontal",
        preview = {
            hide_on_startup = true
        }
    } -- define here if you want to define something
    ts_builtin.find_files(opts)
end

-- find vimrc directory
M.find_nvim_config = function()
    local std_path = require("environment").std_path
    local opts = {
        find_command = {
            "rg",
            "--files",
            "--glob=!.git/",
        },
        cwd = std_path.config,
        hidden = true,
        follow = true,
        layout_strategy = "horizontal",
        preview = {
            hide_on_startup = true
        }
    } -- define here if you want to define something
    ts_builtin.find_files(opts)
end

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ buffers ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
M.buffers = function()
    local opts = {
    } -- define here if you want to define something
    ts_builtin.buffers(opts)
end

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━❰ buffer lines ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
M.current_buffer_fuzzy_find = function()
    local opts = {
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                preview_width = 0,
            }
        }
    } -- define here if you want to define something
    ts_builtin.current_buffer_fuzzy_find(opts)
end

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━❰ help tags ❱━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
M.help_tags = function()
    local opts = {
        layout_strategy = "vertical",
        layout_config = {
            vertical = {
                mirror = false,
                preview_height = 0.5,
            },
        }
    } -- define here if you want to define something
    ts_builtin.help_tags(opts)
end

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ quickfix ❱━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
M.quickfix = function()
    local opts = {
        layout_strategy = "vertical",
        show_line = true,
        trim_text = false,
        fname_width = 120,
    } -- define here if you want to define something
    ts_builtin.quickfix(opts)
end

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ colorscheme ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
M.colorscheme = function()
    local opts = {
    } -- define here if you want to define something
    ts_builtin.colorscheme(opts)
end

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ buffer tags ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
M.current_buffer_tags = function()
    local opts = {
    } -- define here if you want to define something
    ts_builtin.current_buffer_tags(opts)
end

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━❰ maps ❱━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
M.keymaps = function()
    local opts = {
    } -- define here if you want to define something
    ts_builtin.keymaps(opts)
end

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ highlights ❱━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
M.highlights= function()
    local opts = {
    } -- define here if you want to define something
    ts_builtin.highlights(opts)
end


-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━❰ live grep ❱━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
M.live_grep = function()
    local opts = {
        layout_strategy = "vertical"
    } -- define here if you want to define something
    ts_builtin.live_grep(opts)
end

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━❰ grep string ❱━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
M.grep_string = function()
    local opts = {
        layout_strategy = "vertical"
    } -- define here if you want to define something
    ts_builtin.grep_string(opts)
end

return M
