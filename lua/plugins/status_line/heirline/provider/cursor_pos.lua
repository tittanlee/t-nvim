
local conditions = require("heirline.conditions")
local utils      = require("heirline.utils")

local ruler = {
    {
        provider = "",
    },
    {
        -- %l = current line number
        -- %L = number of lines in the buffer
        -- %c = column number
        -- %P = percentage through file of displayed window
        -- provider = "%7(%l/%L%):%2c %P",
        provider = "%l/%L:%2c %P",
    },
    hl = { 
        fg = "blue",
        bold = true
    },

}

-- I take no credits for this! :lion:
local scroll_bar ={
    static = {
        sbar = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
        -- Another variant, because the more choice the better.
        -- sbar = { "🭶", "🭷", "🭸", "🭹", "🭺", "🭻" }
    },
    provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines     = vim.api.nvim_buf_line_count(0)
        local i         = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return string.rep(self.sbar[i], 2)
    end,
    hl = { 
        fg = "blue",
        bold = true
    },
}

local cursor_pos = function(left_sep, right_sep, color)
    return {
        utils.surround(
            {left_sep, right_sep},
            color,
            utils.insert(ruler, scroll_bar)
        )
    }
end

return cursor_pos
