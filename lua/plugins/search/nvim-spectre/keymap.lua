
local status_ok, spectre = pcall(require, "spectre")
if not status_ok then
    return
end


local status_ok, wk = pcall(require, "which-key")
local module_key = require("environment").keys.module.spectre
if status_ok then
    wk.register({
        [module_key.prefix.lhs] = {
            name = module_key.prefix.desc,
            [module_key.search_word.lhs] = {
                function()
                    spectre.open_visual({
                        select_word = true,
                        is_insert_mode = false,
                    })
                end ,
                module_key.search_word.desc
            },
            [module_key.open_search_panel.lhs] = {
                function()
                    spectre.open({
                        select_word = false,
                        is_insert_mode = true,
                    })
                end,
                module_key.open_search_panel.desc
            },
        }
    }, {mode = "n"})


    wk.register({
        [module_key.prefix.lhs] = {
            name = module_key.prefix.desc,
            [module_key.search_word.lhs] = {
                function()
                    spectre.open_visual({
                        select_word = true,
                        is_insert_mode = false,
                    })
                end ,
                module_key.search_word.desc
            },
        }
    }, {mode = "x"})
else
    local keymap = require("utils").keymap
    keymap(
        {"n", "x"},
        module_key.prefix.lhs .. module_key.search_word.lhs,
        function()
            spectre.open_visual({
                select_word = true,
                is_insert_mode = false,
            })
        end,
        { desc = module_key.search_word.desc }
    )

    keymap(
        "n",
        module_key.prefix.lhs . module_key.open_search_panel.lhs,
        function()
            spectre.open({
                select_word = false,
                is_insert_mode = true,
            })
        end,
        { desc = module_key.open_search_panel.desc }
    )
end
