

local status_ok, live_grep = pcall(require, "telescope-live-grep-args")
if not status_ok then
    return
end


local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end


local lga_actions = require("telescope-live-grep-args.actions")
local actions     = require('telescope.actions')

telescope.setup {
    extensions = {
        live_grep_args = {
            -- enable/disable auto-quoting
            auto_quoting    = true,

            layout_strategy = "vertical",

            -- override default mappings
            -- default_mappings = {},
            mappings = { -- extend mappings
                i = {
                    ["<C-'>"] = lga_actions.quote_prompt(),

                    -- ━━━━━━━━━━━━━━━━━❰ selection scroll ❱━━━━━━━━━━━━━━━━━ --
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                },
            }
        }
    }
}


telescope.load_extension("live_grep_args")
