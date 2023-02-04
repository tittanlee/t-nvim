
local status_ok, spectre = pcall(require, "spectre")
if not status_ok then
    return
end


local status_ok, wk = pcall(require, "which-key")
local module_key = require("environment").keys.module.spectre
if status_ok then
    wk.register({
        [module_key.prefix] = {
            [module_key.search_word] = {
                function()
                    spectre.open_visual({
                        select_word = true,
                        is_insert_mode = false,
                    })
                end ,
                "spectre - search select [W]ord" 
            },
            [module_key.open_search_panel] = {
                function()
                    spectre.open({
                        select_word = false,
                        is_insert_mode = true,
                    })
                end,
                "spectre - [O]pen search panel"
            },
        }
    })
else
    local keymap = require("utils").keymap
    keymap(
        "n",
        "<Leader>sw",
       function()
            spectre.open_visual({
                select_word = true,
                is_insert_mode = false,
            })
        end,
        {desc = "spectre - search select [W]ord"}
    )

    keymap(
        "n",
        "<Leader>so",
        function()
            spectre.open({
                select_word = false,
                is_insert_mode = true,
            })
        end,
        {desc = "spectre - [O]pen search panel"}
    )
end
