return {
  'folke/tokyonight.nvim',

  enabled = function()
    return require('environment').color_scheme == 'tokyonight'
  end,

  priority = 1000,

  config = function()
    require('tokyonight').setup({
      style = 'storm',

      on_highlights = function(hl, c)
        -- ✅ Folder icons（devicons / Snacks Explorer）
        hl.DevIconFolder = { fg = c.blue }
        hl.DevIconFolderOpen = { fg = c.blue }

        -- ✅ Explorer / Sidebar 類型 UI
        hl.SnacksExplorerNormal = { bg = c.bg_dark }
        hl.SnacksExplorerBorder = { fg = c.border_highlight }
      end,
    })

    vim.cmd.colorscheme('tokyonight')
  end,
}
