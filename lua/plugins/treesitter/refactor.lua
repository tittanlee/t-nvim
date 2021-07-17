
local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = false },
        smart_rename = {
            enable = false,
            keymaps = {
                smart_rename = "grr",
            },
        },

        navigation = {
            enable = true,
            keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
            }
        }
    },
}
