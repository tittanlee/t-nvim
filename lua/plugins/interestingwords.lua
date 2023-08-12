

return {
    "Mr-LLLLL/interestingwords.nvim",
    config = function()

        local module_key = require("environment").module_key.interestingwords

        require("interestingwords").setup {
            colors            = {
                "#AEEE00", "#FF0000", "#0000FF", "#B88823", "#FFA724", "#FF2C4B", "#8CCBEA",
                "#A4E57E", "#FFDB72", "#FF7272", "#FFB3FF", "#9999FF", "#FF3FFF", "#8F3F4F",
            },
            search_count      = true,
            navigation        = true,
            search_key        = module_key.search.lhs,
            cancel_search_key = module_key.cancel_search.lhs,
            color_key         = module_key.color.lhs,
            cancel_color_key  = module_key.cancel_color.lhs,
        }
    end,
}
