

local colors     = require('plugins.statusline.colors')
local util       = require('plugins.statusline.utils')
local icons      = require('icons')

local file_path  = require('plugins.statusline.providers.file_path')
local file_type  = require('plugins.statusline.providers.file_type')
local file_enc   = require('plugins.statusline.providers.file_enc')
local file_fmt   = require('plugins.statusline.providers.file_fmt')
local vi_mode    = require('plugins.statusline.providers.vimode')
local git        = require('plugins.statusline.providers.git')
local coc        = require('plugins.statusline.providers.coc')
local gutentags  = require('plugins.statusline.providers.gutentags')
local cursor_pos = require('plugins.statusline.providers.cursor_pos')

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
        'qf',
    },
    buftypes = {
        'terminal'
    },
    bufnames = {}
}

-- local components = {
--     left  = {active = {}, inactive = {}},
--     mid   = {active = {}, inactive = {}},
--     right = {active = {}, inactive = {}}
-- }

-- Initialize the components table
local components = {
    active = {},
    inactive = {}
}

-- Insert three sections (left, mid and right) for the active statusline
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
-- 
-- -- Insert two sections (left and right) for the inactive statusline
table.insert(components.inactive, {})
table.insert(components.inactive, {})


-------------------- insert inactive start -------------------- {
table.insert(components.inactive[1], file_type.inactive_component_opts())
table.insert(components.inactive[2], file_path.component_opts())
-- -------------------- insert inactive end -------------------- {

-- -------------------- insert left start -------------------- {
table.insert(components.active[1], util.component_gap())
table.insert(components.active[1], vi_mode.component_opts())
table.insert(components.active[1], util.component_gap())
-- 
table.insert(components.active[1], file_path.component_opts())
table.insert(components.active[1], util.component_gap())

table.insert(components.active[1], git.component_opts())
table.insert(components.active[1], util.component_gap())

table.insert(components.active[1], coc.current_function.component_opts())
table.insert(components.active[1], util.component_gap())
-- -------------------- insert left end -------------------- }

-- -------------------- insert mid start -------------------- {
table.insert(components.active[2], gutentags.component_opts())
-- -------------------- insert mid end -------------------- }

-- -------------------- insert right start -------------------- {
table.insert(components.active[3], coc.diagnostics.component_opts())
table.insert(components.active[3], util.component_gap())

table.insert(components.active[3], file_enc.component_opts())
table.insert(components.active[3], util.component_gap())

table.insert(components.active[3], file_fmt.component_opts())
table.insert(components.active[3], util.component_gap())

table.insert(components.active[3], cursor_pos.component_opts())
table.insert(components.active[3], util.component_gap())
-------------------- insert right end -------------------- }

require('feline').setup({
    colors = colors.dark,
    vi_mode_colors = colors.vi_mode_colors,

    components = components,
    properties = properties,
    separators = icons.separators,
    force_inactive = force_inactive,
})




