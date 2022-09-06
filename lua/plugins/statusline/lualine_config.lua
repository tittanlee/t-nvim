
local lualine = require('lualine')
local colors  = require('plugins.statusline.colors')
local icons   = require('plugins.statusline.icons')

-- components provider
local sep       = require('plugins.statusline.providers.separator')
local vim_mode  = require('plugins.statusline.providers.vimode')
local file_path = require('plugins.statusline.providers.file_path')
local file_enc  = require('plugins.statusline.providers.file_enc')
local file_fmt   = require('plugins.statusline.providers.file_fmt')
local file_type  = require('plugins.statusline.providers.file_type')
local git       = require('plugins.statusline.providers.git')
local coc       = require('plugins.statusline.providers.coc')
-- local gutentags = require('plugins.statusline.providers.gutentags')
local cursor_pos = require('plugins.statusline.providers.cursor_pos')



-- global options = {
--   icons_enabled = 1, -- displays icons in alongside component
--   padding = 1, -- adds padding to the left and right of components
--   left_padding = 1, -- adds padding to the left of components
--   right_padding =1, -- adds padding to the right of components
--   upper = false, -- displays components in uppercase
--   lower = false, -- displays components in lowercase
--   format = nil -- format function, formats component's output
-- }
local config = {
    options = {
        theme                = 'gruvbox',
        component_separators = '',
        section_separators   = '',
        padding              = 0, -- adds padding to the left and right of components
        left_padding         = 0, -- adds padding to the left of components
        right_padding        = 0, -- adds padding to the right of components
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},

        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},

        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {
        'fzf',
        'quickfix'
    }
}

-- Inserts a component in active section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

-- Inserts a component in inactive section
local function ins_inact_left(component)
    table.insert(config.inactive_sections.lualine_a, component)
end

local function ins_inact_right(component)
    table.insert(config.inactive_sections.lualine_z, component)
end


-- active left section -- start
ins_left(sep.left_component_opts(vim_mode.highlight(), vim_mode.components_enabled))
ins_left(vim_mode.component_opts())
ins_left(sep.right_component_opts(vim_mode.highlight(), vim_mode.components_enabled))
ins_left(sep.space_component_opts())

ins_left(sep.left_component_opts(file_path.highlight(), file_path.components_enabled))
ins_left(file_path.component_opts())
ins_left(sep.right_component_opts(file_path.highlight(), file_path.components_enabled))
ins_left(sep.space_component_opts())

ins_left(sep.left_component_opts(git.highlight(), git.components_enabled))
ins_left(git.component_opts())
ins_left(sep.right_component_opts(git.highlight(), git.components_enabled))
ins_left(sep.space_component_opts())

ins_left(sep.left_component_opts(coc.current_function.highlight(), coc.current_function.components_enabled))
ins_left(coc.current_function.component_opts())
ins_left(sep.right_component_opts(coc.current_function.highlight(), coc.current_function.components_enabled))
ins_left(sep.space_component_opts())

-- ins_left(sep.left_component_opts(gutentags.highlight(), gutentags.components_enabled))
-- ins_left(gutentags.component_opts())
-- ins_left(sep.right_component_opts(gutentags.highlight(), gutentags.components_enabled))
-- ins_left(sep.space_component_opts())
-- active left section -- end

-- active right section -- start
ins_right(sep.left_component_opts(coc.diagnostics.highlight(), coc.diagnostics.components_enabled))
ins_right(coc.diagnostics.component_opts())
ins_right(sep.right_component_opts(coc.diagnostics.highlight(), coc.diagnostics.components_enabled))
ins_right(sep.space_component_opts())

ins_right(sep.left_component_opts(file_enc.highlight(), file_enc.components_enabled))
ins_right(file_enc.component_opts())
ins_right(sep.right_component_opts(file_enc.highlight(), file_enc.components_enabled))
ins_right(sep.space_component_opts())

ins_right(sep.left_component_opts(file_fmt.highlight(), file_fmt.components_enabled))
ins_right(file_fmt.component_opts())
ins_right(sep.right_component_opts(file_fmt.highlight(), file_fmt.components_enabled))
ins_right(sep.space_component_opts())

ins_right(sep.left_component_opts(cursor_pos.highlight(), cursor_pos.components_enabled))
ins_right(cursor_pos.component_opts())
ins_right(sep.right_component_opts(cursor_pos.highlight(), cursor_pos.components_enabled))
ins_right(sep.space_component_opts())
-- active right section -- end


-- inactive left section -- start
local inact_condition = function() return true end
ins_inact_left(file_type.inact_component_opts())
ins_inact_left(
    sep.right_component_opts(
        file_type.highlight(),
        inact_condition
    )
)
-- inactive left section -- end


-- inactive right section -- start
ins_inact_right(
    sep.left_component_opts(
        file_path.highlight(),
        inact_condition
    )
)
ins_inact_right(file_path.component_opts())
-- inactive right section -- end







-- Now don't forget to initialize lualine
lualine.setup(config)
