
--[[
| Key       | Option             | Values                                                     |
| --------- | ------------------ | --------------------------------------------------         |
| `CTRL-F`  | `filter`           | Input string (`[gv]/.*/?`)                                 |
| `CTRL-I`  | `indentation`      | shallow, deep, none, keep                                  |
| `CTRL-L`  | `left_margin`      | Input number or string                                     |
| `CTRL-R`  | `right_margin`     | Input number or string                                     |
| `CTRL-D`  | `delimiter_align`  | left, center, right                                        |
| `CTRL-U`  | `ignore_unmatched` | 0, 1                                                       |
| `CTRL-G`  | `ignore_groups`    | `[]`, `['String']`, `['Comment']`, `['String', 'Comment']` |
| `CTRL-A`  | `align`            | Input string (`/[lrc]+\*{0,2}/`)                           |
| `<Left>`  | `stick_to_left`    | `{ 'stick_to_left': 1, 'left_margin': 0 }`                 |
| `<Right>` | `stick_to_left`    | `{ 'stick_to_left': 0, 'left_margin': 1 }`                 |
| `<Down>`  | `*_margin`         | `{ 'left_margin': 0, 'right_margin': 0 }`                  |
]]


local g = vim.g
local equal_sign = {
    "===",
    "<=>",
    [[\(&&\|||\|<<\|>>\)=]],
    [[=\~[#?]\?]],
    "=>",
    [[[:+/*!%^=><&|.-]\?=[#?]\?]],
    "\\~="
}
local gt_sign = {">>", "=>", ">"}
local lt_sign = {"<<", "=<", "<"}


g.easy_align_bypass_fold = 1
g.easy_align_delimiters = {
    [">"] = {pattern = table.concat(gt_sign, "\\|")},
    ["<"] = {pattern = table.concat(lt_sign, "\\|")},

    [";"] = {pattern = ";", left_margin = 0},
    [","] = {pattern = ",", left_margin = 0, right_margin = 1},
    ["="] = {pattern = [[<\?=>\?]], left_margin = 1, right_margin = 1},
    ["|"] = {pattern = [[|\?|]], left_margin = 1, right_margin = 1},
    ["&"] = {pattern = [[&\?&]], left_margin = 1, right_margin = 1},
    [":"] = {pattern = ":", left_margin = 1, right_margin = 1},
    ["?"] = {pattern = "?", left_margin = 1, right_margin = 1},
    ["+"] = {pattern = "+", left_margin = 1, right_margin = 1},

    ["["] = {pattern = "[", left_margin = 1, right_margin = 0},
    ["]"] = {
        -- pattern = "[[\\]]",
        pattern = [[\]\zs]],
        left_margin = 0,
        right_margin = 0,
        stick_to_left = 0
    },

    ["("] = {pattern = "(", left_margin = 0, right_margin = 0},
    [")"] = {
        -- pattern = "[()]",
        pattern       = [[)\zs]],
        left_margin   = 0,
        right_margin  = 0,
        stick_to_left = 0
    },
}
