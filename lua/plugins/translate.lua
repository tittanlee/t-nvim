
return {
    "uga-rosa/translate.nvim",

    cmd = { "Translate" },

    config = function()
        require("translate").setup({
            defalut = {
                output = "split",
            },
            preset = {
                output = {
                    split = {
                        position = "bottom",
                        min_size = 5,
                        max_size = 0.5,
                        name     = "translate://output",
                        filetype = "translate",
                        append   = true,
                    },
                },
            },
        })
    end,

    init = function()
        local keymap     = require("util.keymap")
        local module_key = require("environment").module_key.translator
        keymap({"x", "n"}, module_key.trans_to_tw.lhs, "<cmd>Translate ZH_TW -output=floating<CR>", { desc = module_key.trans_to_tw.desc })
    end,

}
