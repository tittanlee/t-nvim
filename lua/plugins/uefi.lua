


return {
    "tittanlee/vim-uefi",

    ft = {
        "asl",
        "uefidec",
        "uefifdf",
        "uefidsc",
        "uefiuni",
        "uefivfr",
        "uefiinf",
        "uefisdl",
        "uefivfr",
    },

    config = function()
        local status_ok, comment_ft = pcall(require, "Comment.ft")

        if status_ok then
            comment_ft({
                "uefidec",
                "uefifdf",
                "uefidsc",
                "uefiuni",
                "uefiinf",
                "uefisdl",
                "uefivfr",
            }, "# %s")
        end
    end,
}
