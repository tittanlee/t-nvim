local km = require('config.keymaps.bufferline')
local K  = require('config.keymaps')

return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy', -- Load after startup to save time
  keys = {
    { K.key(km.buf, 'pick'), '<Cmd>BufferLinePick<CR>',   desc = K.desc(km.buf, 'pick') },
    { km.prev.key,           '<Cmd>BufferLineCyclePrev<CR>', desc = km.prev.desc         },
    { km.next.key,           '<Cmd>BufferLineCycleNext<CR>', desc = km.next.desc         },
  },
  config = function()
    require('bufferline').setup({
      options = {
        mode = 'buffers',
        separator_style = 'slant', -- Slanted tabs look modern
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = 'nvim_lsp', -- Show LSP errors directly on tabs
        offsets = {
          -- For nvim-tree
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            text_align = 'center',
            separator = true,
          },

          -- For Snacks Explorer
          {
            filetype = 'snacks_layout_box',
            text = 'Snacks Explorer',
            text_align = 'center',
            separator = true,
          },
        },
      },
    })
  end,
}
