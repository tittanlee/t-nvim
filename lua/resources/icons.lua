

local M = {}

M.diagnostic = {
    error = "",
    warn  = "",
    info  = "!"
}

M.git= {
    branch   = "",
    add      = "",
    modified = "",
    remove   = ""
}

M.mode = {
    c = "🅒",
    i = "🅘",
    n = "🅝",
    r = "🅡",
    s = "🅢",
    t = "🅣",
    v = "🅥"
}

M.os_logo = {
    unix = "",
    mac  = "",
    dos  = "",
    vim  = "",
}

M.separators = {
    vertical_bar       = "┃",
    vertical_bar_thin  = "│",
    left               = "",
    right              = "",
    block              = "█",
    left_filled        = "",
    right_filled       = "",
    slant_left         = "",
    slant_left_thin    = "",
    slant_right        = "",
    slant_right_thin   = "",
    slant_left_2       = "",
    slant_left_2_thin  = "",
    slant_right_2      = "",
    slant_right_2_thin = "",
    left_rounded       = "",
    left_rounded_thin  = "",
    right_rounded      = "",
    right_rounded_thin = "",
    circle             = "●",
    bullet             = "•",
}

M.dingbats = {
    snow_flake = "❄",
    cross_mark = "❌",
    line_nu    = "",
    block_1    = "▁",
    block_2    = "▂",
    block_3    = "▃",
    block_4    = "▄",
    block_5    = "▅",
    block_6    = "▆",
    block_7    = "▇",
    block_8    = "█",
}

M.lsp_kinds = {
    Text          = "",
    Method        = "m",
    Function      = "",
    Constructor   = "",
    Field         = "",
    Variable      = "",
    Class         = "",
    Interface     = "",
    Module        = "",
    Property      = "",
    Unit          = "",
    Value         = "",
    Enum          = "",
    Keyword       = "",
    Snippet       = "",
    Color         = "",
    File          = "",
    Reference     = "",
    Folder        = "",
    EnumMember    = "",
    Constant      = "",
    Struct        = "",
    Event         = "",
    Operator      = "",
    TypeParameter = "",
},

M.misc_symbols = {
    extraterrestrial_alien = "👽",
    ghost                  = "",
}





return M
