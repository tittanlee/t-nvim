


local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
    return
end


vim.o.runtimepath = vim.o.runtimepath .. "," .. os.getenv("HOME") .. "/.config/nvim/my-snippets/,"

require("luasnip").config.set_config({
    history             = true,
    updateevents        = "TextChanged,TextChangedI",
    delete_check_events = "TextChanged,InsertLeave",
})

require("luasnip.loaders.from_lua").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
