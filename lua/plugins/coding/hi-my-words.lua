return {
  'dvoytik/hi-my-words.nvim',
  -- Load on these keys to keep startup fast
  keys = {
    {
      '<leader>h',
      '<cmd>HiMyWordsToggle<cr>',
      desc = '<hi-my-words> Toggle highlight for word under cursor',
    },
    { '<leader>H', '<cmd>HiMyWordsClear<cr>', desc = '<hi-my-words> Clear all word highlights' },
  },
  config = function()
    require('hi-my-words').setup({
      -- You can define your own highlight groups or use the defaults
      -- The plugin cycling through 6 default colors
      backlog = 'HiMyWordsBacklog',
    })
  end,
}
