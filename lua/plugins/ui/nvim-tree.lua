return {
  'nvim-tree/nvim-tree.lua',
  enabled = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  -- Lazy load on these events/keys
  cmd = { 'NvimTreeToggle', 'NvimTreeFocus', 'NvimTreeFindFile' },
  keys = {
    { '<leader>ww', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle NvimTree' },
    { '<leader>we', '<cmd>NvimTreeFindFile<cr>', desc = 'NvimTree Find File' },
  },

  config = function()
    require('nvim-tree').setup({
      sort_by = 'case_sensitive',
      view = { width = '20%' },
      filters = { dotfiles = false },

      renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },

      git = {
        enable = false,
        ignore = true,
        show_on_dirs = true,
        timeout = 400,
      },

      update_focused_file = {
        enable = true, -- Automatically focus the file you are currently editing
        update_root = true,
      },
    })
  end,
}
