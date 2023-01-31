local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local module_key = require("environment").keys.module.nvim_tree 

local status_ok, wk = pcall(require, "which-key")
if status_ok then
    wk.register({
        [module_key.prefix] = {
            name                = "nvim-tree",
            [module_key.toggle] = {"<cmd>NvimTreeToggle<CR>", "nvim-tree toggle"},
            [module_key.find]   = {"<cmd>NvimTreeFindFile<CR>", "nvim-tree find file"},
        },
    })
else
    local keymap = require("utils").keymap
    keymap('n', module_key.prefix .. module_key.toggle, ':NvimTreeToggle<CR>'  , {desc = "nvim-tree toggle"})
    keymap('n', module_key.prefix .. module_key.find  , ':NvimTreeFindFile<CR>', {desc = "nvim-tree find file"})
end


