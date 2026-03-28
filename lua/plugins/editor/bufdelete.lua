return {
  'famiu/bufdelete.nvim',
  enabled = false,

  -- Define keys here. Lazy.nvim will handle the mapping automatically.
  keys = {
    {
      '<M-w>',
      '<cmd>Bdelete<cr>',
      desc = '<bufdelete> Delete Buffer (keep layout)',
    },
    {
      '<M-W>',
      '<cmd>bd!<cr>',
      desc = '<bufdelete> Force Delete Buffer (Standard)',
    },
  },
}
