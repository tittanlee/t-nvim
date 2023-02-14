local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local module_key = require("environment").keys.module.nvim_tree

local status_ok, wk = pcall(require, "which-key")
if status_ok then
    wk.register({
        [module_key.prefix.lhs] = {
            name                = module_key.prefix.desc,
            [module_key.toggle.lhs] = {"<cmd>NvimTreeToggle<CR>", module_key.toggle.desc },
            [module_key.find.lhs]   = {"<cmd>NvimTreeFindFile<CR>", module_key.find.desc },
        },
    })
else
    local keymap = require("utils").keymap
    keymap('n', module_key.prefix.lhs .. module_key.toggle.lhs, ':NvimTreeToggle<CR>'  , { desc = module_key.toggle.desc })
    keymap('n', module_key.prefix.lhs .. module_key.find.lhs  , ':NvimTreeFindFile<CR>', { desc = module_key.find.desc   })
end


