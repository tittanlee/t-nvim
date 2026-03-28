return {
  'rebelot/kanagawa.nvim',
  priority = 1000,

  enabled = function()
    return require('environment').color_scheme == 'kanagawa'
  end,

  config = function()
    require('kanagawa').setup({
      compile = false, -- 可開可關（效能）
      undercurl = true,
      commentStyle = { italic = true },
      keywordStyle = { italic = false },
      functionStyle = {},
      variableStyle = {},
      transparent = false,

      colors = {
        palette = {},
        theme = {
          wave = {},
          lotus = {},
          dragon = {},
          all = {},
        },
      },

      -- ✅ here is kanagawa's strong forte
      overrides = function(colors)
        local theme = colors.theme

        return {
          -- ✅ Snacks / Floating UI
          NormalFloat = { bg = theme.ui.bg_float },
          FloatBorder = { fg = theme.ui.border, bg = theme.ui.bg_float },

          -- ✅ Explorer / Sidebar
          DevIconFolder = { fg = theme.syn.fun },
          DevIconFolderOpen = { fg = theme.syn.fun },

          -- ✅
          Directory = { fg = theme.syn.fun },

          -- ✅ Snacks Picker
          SnacksPickerBorder = { fg = theme.ui.border },
          SnacksPickerInput = { bg = theme.ui.bg_dim },
        }
      end,
    })

    vim.cmd.colorscheme('kanagawa-wave')
  end,
}
