local km = require('config.keymaps.treesitter')

return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },

  config = function()
    require('nvim-treesitter.configs').setup({
      textobjects = {
        move = {
          enable = true,
          set_jumps = true,

          goto_previous_start = { [km.nav.prev_start.key] = '@function.outer' },
          goto_next_start     = { [km.nav.next_start.key] = '@function.outer' },
          goto_previous_end   = { [km.nav.prev_end.key]   = '@function.outer' },
          goto_next_end       = { [km.nav.next_end.key]   = '@function.outer' },
        },

        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            [km.textobj.around_func.key] = '@function.outer',
            [km.textobj.inner_func.key]  = '@function.inner',
          },
        },
      },
    })
  end,
}
