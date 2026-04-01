-- Bootstrap lazy.nvim (Automatic installation if not present)
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Configure and initialize Lazy.nvim
require('lazy').setup({
  spec = {
    -- Import all plugin modules from the lua/plugins/ directory
    { import = 'plugins.ui' },
    { import = 'plugins.ui.theme' },
    { import = 'plugins.ui.lualine' },
    { import = 'plugins.coding' },
    { import = 'plugins.editor' },
    { import = 'plugins.completion' },
    { import = 'plugins.tools' },
    { import = 'plugins.lsp' },
    { import = 'plugins.ai' },
    { import = 'plugins.treesitter' },
  },
  defaults = {
    lazy = false, -- Load plugins immediately by default
    version = false, -- Always use the latest git commit
  },
  install = { colorscheme = { 'catppuccin' } }, -- Fallback theme during installation
  checker = { enabled = true }, -- Automatically check for plugin updates
  performance = {
    rtp = {
      -- Disable unnecessary built-in Vim plugins to improve startup time
      disabled_plugins = {
        'gzip',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})
