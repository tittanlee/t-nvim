
local yank_path = require("utils.yank_path")
local module_key = require("environment").keys.module.smartyank

local status_ok, wk = pcall(require, "which-key")
if status_ok then
    wk.register({
        [module_key.prefix] = {
            name = "smart [Y]ank",
            [module_key.relative_path] = { function() yank_path.yank_relative_path() end , "yank [R]elative path"       },
            [module_key.abs_path]      = { function() yank_path.yank_absolute_path() end , "yank [A]bsolute path"       },
            [module_key.dir_path]      = { function() yank_path.yank_directory_path() end, "yank [D]irectroy path"      },
            [module_key.file_name]     = { function() yank_path.yank_file_name() end     , "yank [F]ile name"           },
            [module_key.cwd_path]      = { function() yank_path.yank_cwd() end           , "yank current [W]orking dir" },
        },
    })
else
    local keymap = require("utils").keymap
    keymap(
        'n',
        module_key.prefix .. module_key.relative_path,
        function() yank_path.yank_relative_path() end,
        {desc = "yank [R]elative path"}
    )

    keymap(
        'n',
        module_key.prefix .. module_key.abs_path,
        function() yank_path.yank_absolute_path() end,
        {desc = "yank [A]bsolute path"}
    )

    keymap(
        'n',
        module_key.prefix .. module_key.dir_path,
        function() yank_path.yank_directory_path() end,
        {desc = "yank [D]irectroy path"}
    )

    keymap(
        'n',
        module_key.prefix .. module_key.file_name,
        function() yank_path.yank_file_name() end,
        {desc = "yank [F]ile name"}
    )

    keymap(
        'n',
        module_key.prefix .. module_key.cwd_path,
        function() yank_path.yank_cwd() end,
        {desc = "yank current [W]orking dir"}
    )
end
