
local yank_path = require("utils.yank_path")
local module_key = require("environment").keys.module.smartyank

local status_ok, wk = pcall(require, "which-key")
if status_ok then
    wk.register({
        [module_key.prefix.lhs] = {
            name = module_key.prefix.desc,
            [module_key.relative_path.lhs] = { function() yank_path.yank_relative_path() end , module_key.relative_path.desc },
            [module_key.abs_path.lhs]      = { function() yank_path.yank_absolute_path() end , module_key.abs_path.desc      },
            [module_key.dir_path.lhs]      = { function() yank_path.yank_directory_path() end, module_key.dir_path.desc      },
            [module_key.file_name.lhs]     = { function() yank_path.yank_file_name() end     , module_key.file_name.desc     },
            [module_key.cwd_path.lhs]      = { function() yank_path.yank_cwd() end           , module_key.cwd_path.desc      },
        },
    })
else
    local keymap = require("utils").keymap
    keymap(
        'n',
        module_key.prefix.lhs .. module_key.relative_path.lhs,
        function() yank_path.yank_relative_path() end,
        { desc = module_key.relative_path.desc }
    )

    keymap(
        'n',
        module_key.prefix.lhs .. module_key.abs_path.lhs,
        function() yank_path.yank_absolute_path() end,
        { desc = module_key.abs_path.desc }
    )

    keymap(
        'n',
        module_key.prefix.lhs .. module_key.dir_path.lhs,
        function() yank_path.yank_directory_path() end,
        { desc = module_key.dir_path.desc }
    )

    keymap(
        'n',
        module_key.prefix.lhs .. module_key.file_name.lhs,
        function() yank_path.yank_file_name() end,
        { desc = module_key.file_name.desc }
    )

    keymap(
        'n',
        module_key.prefix.lhs .. module_key.cwd_path.lhs,
        function() yank_path.yank_cwd() end,
        {desc = module_key.cwd_path.desc }
    )
end
