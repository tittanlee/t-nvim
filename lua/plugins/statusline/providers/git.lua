
local git = require('feline.providers.git')

local colors = require('plugins.statusline.colors')
local icons = require('plugins.statusline.icons')
local utils = require('plugins.statusline.utils')
 

M = {}

function M.branch_name()
    return git.git_branch({})
end

function M.status()
    return git.git_diff_added({}) .. git.git_diff_removed({}) ..  git.git_diff_changed({})
end

function M.highlight()
    local hl_val = {}
    hl_val.fg = colors.dark.yellow
    hl_val.bg = colors.dark.oceanblue
    hl_val.style = 'bold'
    return hl_val
end

function M.separators(direction)
    local sep = {}

    if (direction == 'left') then
        sep.str = icons.separators.left_rounded
    else
        sep.str = icons.separators.right_rounded
    end

    sep.hl = {
        fg = colors.dark.oceanblue
    }
    return sep
end

function M.components_enabled()
    return M.branch_name() ~= '' and utils.check_width()
end

function M.component_opts()

    local git_provider = function()
        return git.git_branch({}) ..
        git.git_diff_added({}) ..
        git.git_diff_removed({}) ..
        git.git_diff_changed({})
    end

    local hl        = function() return M.highlight() end
    local left_sep  = function() return M.separators('left') end
    local right_sep = function() return M.separators('right') end
    local enabled   = function() return M.components_enabled() end

    local component_opts = {}
    component_opts.provider  = git_provider
    component_opts.hl        = hl
    component_opts.left_sep  = left_sep
    component_opts.right_sep = right_sep
    component_opts.enabled   = enabled
    return component_opts
end


return M
