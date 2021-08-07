
require ('env_variable')


if (ENV.colorscheme == "tokyonight") then
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

vim.cmd("colorscheme " .. ENV.colorscheme)
