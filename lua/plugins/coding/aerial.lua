return {
  'stevearc/aerial.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- Optional, for symbol icons
  },

  -- Load only when a buffer is available
  event = { 'BufReadPost', 'BufNewFile' },

  config = function()
    require('aerial').setup({
      -- When true, don't load aerial until a command or function is called
      -- Defaults to true, unless `on_attach` is provided, then it defaults to false
      lazy_load = true,

      ------------------------------------------------------------------
      -- Data sources
      -- Prefer LSP symbols, fallback to Treesitter when LSP is missing
      ------------------------------------------------------------------
      backends = {
        ['_'] = { 'lsp', 'treesitter' },
        c = { 'treesitter' },
        cpp = { 'lsp', 'treesitter' },
      },

      ------------------------------------------------------------------
      -- Layout configuration
      -- Aerial should only take space when explicitly opened
      ------------------------------------------------------------------
      layout = {
        placement = 'edge', -- Attach to the window edge
        default_direction = 'prefer_right',
        min_width = 30,
        max_width = { 40, 0.25 }, -- Max 40 columns or 25% of window
      },

      ------------------------------------------------------------------
      -- UI behavior
      -- Focused on reading and understanding unfamiliar files
      ------------------------------------------------------------------
      show_guides = true, -- Draw tree guide lines
      link_tree_to_folds = true, -- Sync with folds (works well with nvim-ufo)

      highlight_on_jump = true, -- Brief highlight after jumping
      autojump = false, -- Do not jump while moving selection

      ------------------------------------------------------------------
      -- Symbol visibility
      -- Show everything when exploring a file structure
      ------------------------------------------------------------------
      filter_kind = false, -- Do not filter symbol kinds

      ------------------------------------------------------------------
      -- Disable automatic behavior
      -- Aerial should never appear unless explicitly requested
      ------------------------------------------------------------------
      open_automatic = false,
      close_automatic = false,
    })

    --------------------------------------------------------------------
    -- Keymap
    -- Use a capital O to clearly distinguish from picker-based outline
    --------------------------------------------------------------------
    vim.keymap.set('n', '<leader>O', '<cmd>AerialToggle!<CR>', { desc = 'Outline (Aerial sidebar)' })
  end,
}
