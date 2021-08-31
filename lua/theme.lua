
require ('env_variable')


if (ENV.colorscheme == "tokyonight") then
    -- three styles, storm, night and day.
    vim.g.tokyonight_style = "storm"
    vim.g.tokyonight_menu_selection_background = "red"
    vim.g.tokyonight_italic_functions = true
    vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
end

if (ENV.colorscheme == "material") then
    -- Example config in lua
    vim.g.material_style = 'palenight'
    vim.g.material_italic_comments = true
    vim.g.material_italic_keywords = false
    vim.g.material_italic_functions = true
    vim.g.material_italic_variables = false
    vim.g.material_contrast = true
    vim.g.material_borders = false
    vim.g.material_disable_background = false
end

if (ENV.colorscheme == "onedark") then
    -- style - 'warmer','warm', 'deep', 'cool', 'darker', 'default'
    vim.g.onedark_style = 'deep'
end

if (ENV.colorscheme == "neon") then
    -- default, doom, dark, light
    vim.g.neon_style = "default"
    vim.g.neon_italic_keyword = true
    vim.g.neon_italic_function = true
    vim.g.neon_transparent = true
end

if (ENV.colorscheme == "gruvbox-material") then
    -- Available values: `'hard'`, `'medium'`, `'soft'`
    vim.g.gruvbox_material_background             = 'medium'
    vim.g.gruvbox_material_enable_bold            = 1
    vim.g.gruvbox_material_enable_italic          = 1
    vim.g.gruvbox_material_disable_italic_comment = 0
    -- Available values: `'auto'`, `'red'`, `'orange'`, `'yellow'`, `'green'`, `'aqua'`, `'blue'`, `'purple'`
    vim.g.gruvbox_material_cursor = 'green'
end

vim.cmd("colorscheme " .. ENV.colorscheme)
