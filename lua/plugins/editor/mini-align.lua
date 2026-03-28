return {
  'echasnovski/mini.align',
  version = false,

  -- Lazy load when entering visual mode, as alignment is usually done on selections
  event = 'VeryLazy',

  config = function()
    require('mini.align').setup({
      mappings = {
        start = '<leader>ea',
        start_with_preview = '<leader>eA',
      },
    })
  end,
}
