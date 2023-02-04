

local M = {}

local kind_presets = {
    default = {
        Text          = "  ",
        Method        = "  ",
        Function      = "  ",
        Constructor   = "  ",
        Field         = "ﰠ  ",
        Variable      = "  ",
        Class         = "ﴯ  ",
        Interface     = "  ",
        Module        = "  ",
        Property      = "ﰠ  ",
        Unit          = "   塞",
        Value         = "  ",
        Enum          = "  ",
        Keyword       = "  ",
        Snippet       = "  ",
        Color         = "  ",
        File          = "  ",
        Reference     = "  ",
        Folder        = "  ",
        EnumMember    = "  ",
        Constant      = "  ",
        Struct        = "פּ  ",
        Event         = "  ",
        Operator      = "  ",
        TypeParameter = "   ",
    },

    codicons = {
        Text          = "  ",
        Method        = "  ",
        Function      = "  ",
        Constructor   = "  ",
        Field         = "  ",
        Variable      = "  ",
        Class         = "  ",
        Interface     = "  ",
        Module        = "  ",
        Property      = "  ",
        Unit          = "  ",
        Value         = "  ",
        Enum          = "  ",
        Keyword       = "  ",
        Snippet       = "  ",
        Color         = "  ",
        File          = "  ",
        Reference     = "  ",
        Folder        = "  ",
        EnumMember    = "  ",
        Constant      = "  ",
        Struct        = "  ",
        Event         = "  ",
        Operator      = "  ",
        TypeParameter = "  ",
    },

    vs_icons = {
        Text          = "  ",
        Method        = "  ",
        Function      = "  ",
        Constructor   = "  ",
        Field         = "  ",
        Variable      = "  ",
        Class         = "ﴯ  ",
        Interface     = "  ",
        Module        = "  ",
        Property      = "ﰠ  ",
        Unit          = "  ",
        Value         = "  ",
        Enum          = "  ",
        Keyword       = "  ",
        Snippet       = "  ",
        Color         = "  ",
        File          = "  ",
        Reference     = "  ",
        Folder        = "  ",
        EnumMember    = "  ",
        Constant      = "  ",
        Struct        = "  ",
        Event         = "  ",
        Operator      = "  ",
        TypeParameter = "  ",
    },
}

M.mimic_vscode_format = {
    fields = { "kind", "abbr" },
    format = function(entry, vim_item)
        icons = kind_presets.vs_icons
        vim_item.kind = icons[vim_item.kind] or "" .. entry.source.name
        return vim_item
    end,
}

M.vscode_format = {
    expandable_indicator = true,
    format = function(entry, vim_item)
        icons = kind_presets.vs_icons
        -- vim_item.kind = (icons[vim_item.kind] or '') .. vim_item.kind
        vim_item.kind = (icons[vim_item.kind] or '') .. entry.source.name
        return vim_item
    end,
}

return M
