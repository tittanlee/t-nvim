


return {
    "ibhagwan/smartyank.nvim",

    lazy = true,

    event = { "BufReadPost" },

    config = function()
        require("smartyank").setup ({
            highlight = {
                enabled = true,         -- highlight yanked text
                higroup = "IncSearch",  -- highlight group of yanked text
                timeout = 1200,         -- timeout for clearing the highlight
            },
            clipboard = {
                enabled = true
            },
            tmux = {
                enabled = false
                -- remove `-w` to disable copy to host client's clipboard
                -- cmd = { 'tmux', 'set-buffer', '-w' }
            },
            osc52 = {
                enabled = false,
                -- escseq = 'tmux',     -- use tmux escape sequence, only enable if
                -- you're using tmux and have issues (see #4)
                ssh_only = true,        -- false to OSC52 yank also in local sessions
                silent   = false,         -- true to disable the "n chars copied" echo
                echo_hl  = "Directory",  -- highlight group of the OSC52 echo message
            }
        })
    end,
}
