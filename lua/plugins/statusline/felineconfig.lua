

local colors     = require('plugins.statusline.colors')
local util       = require('plugins.statusline.utils')
local icons      = require('plugins.statusline.icons')

local file_path  = require('plugins.statusline.providers.file_path')
local file_type  = require('plugins.statusline.providers.file_type')
local file_enc   = require('plugins.statusline.providers.file_enc')
local file_fmt   = require('plugins.statusline.providers.file_fmt')
local vi_mode    = require('plugins.statusline.providers.vimode')
local git        = require('plugins.statusline.providers.git')
local coc        = require('plugins.statusline.providers.coc')
local gutentags  = require('plugins.statusline.providers.gutentags')
local cursor_pos = require('plugins.statusline.providers.cursor_pos')

local properties = {
    force_inactive = {
        filetypes = {
            'NvimTree',
            'dbui',
            'packer',
            'startify',
            'fugitive',
            'fugitiveblame',
            'coc-explorer',
            'coctree',
            'fzf',
        },
        buftypes = {
            'terminal'
        },
        bufnames = {}
    }
}

local components = {
    left  = {active = {}, inactive = {}},
    mid   = {active = {}, inactive = {}},
    right = {active = {}, inactive = {}}
}

-------------------- insert inactive start -------------------- {
table.insert(components.left.inactive, file_type.inactive_component_opts())
table.insert(components.right.inactive, file_path.component_opts())
-------------------- insert inactive end -------------------- {

-------------------- insert left start -------------------- {
table.insert(components.left.active, util.component_gap())
table.insert(components.left.active, vi_mode.component_opts())
table.insert(components.left.active, util.component_gap())

table.insert(components.left.active, git.component_opts())
table.insert(components.left.active, util.component_gap())

table.insert(components.left.active, file_path.component_opts())
table.insert(components.left.active, util.component_gap())

table.insert(components.left.active, coc.current_function.component_opts())
table.insert(components.left.active, util.component_gap())
-------------------- insert left end -------------------- }

-------------------- insert mid start -------------------- {
table.insert(components.mid.active, gutentags.component_opts())

-------------------- insert mid end -------------------- }

-------------------- insert right start -------------------- {
table.insert(components.right.active, coc.diagnostics.component_opts())
table.insert(components.right.active, util.component_gap())

table.insert(components.right.active, file_enc.component_opts())
table.insert(components.right.active, util.component_gap())

table.insert(components.right.active, file_fmt.component_opts())
table.insert(components.right.active, util.component_gap())

table.insert(components.right.active, cursor_pos.component_opts())
table.insert(components.right.active, util.component_gap())
-------------------- insert right end -------------------- }

require('feline').setup({
    colors = colors.dark,
    vi_mode_colors = colors.vi_mode_colors,

    components = components,
    properties = properties,
    separators = icons.separators,
})




