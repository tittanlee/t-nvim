
local icons      = require("resources.icons")
local utils      = require("heirline.utils")
local conditions = require("heirline.conditions")

local default_opts = {
    static = {
        error_icon = icons.diagnostic.error .. " ",
        warn_icon  = icons.diagnostic.warn .. " ",
        info_icon  = icons.diagnostic.info .. " ",
        hint_icon  = icons.diagnostic.hint .. " ",
    },

    init = function(self)
        self.errors   = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints    = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info     = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,

    update = { "DiagnosticChanged", "BufEnter" },

    {
        provider = icons.diagnostic.thunder .. "❰",
    },
    {
        provider = function(self)
            -- 0 is just another output, we can decide to print it or not!
            return self.errors > 0 and (self.error_icon .. self.errors .. " ")
        end,
        hl = { fg = "diag_error" },
    },
    {
        provider = function(self)
            return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
        end,
        hl = { fg = "diag_warn" },
    },
    {
        provider = function(self)
            return self.info > 0 and (self.info_icon .. self.info .. " ")
        end,
        hl = { fg = "diag_info" },
    },
    {
        provider = function(self)
            return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = { fg = "diag_hint" },
    },
    {
        provider = "❱",
    },
}

local diagnostics = function(left_sep, right_sep, color)
    return {
        condition = conditions.has_diagnostics,

        utils.surround({left_sep, right_sep}, color, default_opts)
    }
end

return diagnostics
