return {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    'kevinhwang91/promise-async', -- required
  },

  event = 'BufReadPost',

  config = function()
    vim.o.foldcolumn = '1' -- Show fold column at the left
    vim.o.foldlevel = 99 -- Using high value, open all folds by default
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    ------------------------------------------------------------------
    -- ✅ nvim-ufo setup
    ------------------------------------------------------------------
    require('ufo').setup({
      -- Use treesitter first, fallback to indent
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end,
    })
  end,
}
