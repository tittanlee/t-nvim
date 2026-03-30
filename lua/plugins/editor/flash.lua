return {
  'folke/flash.nvim',
  event = 'VeryLazy',

  opts = {
    ------------------------------------------------------------------
    -- Allow jumping both before and after the cursor
    ------------------------------------------------------------------
    jump = {
      wrap = false,
    },

    ------------------------------------------------------------------
    -- Use jump labels instead of entering a separate mode
    ------------------------------------------------------------------
    modes = {
      search = {
        enabled = false, -- Do not override `/` search behavior
      },
      char = {
        enabled = true,
        jump_labels = true,
      },
    },

    ------------------------------------------------------------------
    -- Reduce visual noise
    ------------------------------------------------------------------
    highlight = {
      backdrop = false,
    },
  },

  keys = {
    ------------------------------------------------------------------
    -- Jump to any visible word using labels
    ------------------------------------------------------------------
    {
      'f',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump({
          search = { forward = false, wrap = false, multi_window = false },
        })
      end,
      desc = 'Flash jump Backward',
    },
    {
      'F',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump({
          search = { forward = true, wrap = false, multi_window = false },
        })
      end,
      desc = 'Flash jump forward',
    },

    ------------------------------------------------------------------
    -- Treesitter-aware jump (very useful for code)
    ------------------------------------------------------------------
    {
      't',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').treesitter_search({
          label = { before = false, after = true, style = 'inline' },
        })
      end,
      desc = 'Flash treesitter search',
    },
    {
      'T',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').treesitter_search({
          label = { before = true, after = false, style = 'inline' },
        })
      end,
      desc = 'Flash treesitter search',
    },
  },
}
