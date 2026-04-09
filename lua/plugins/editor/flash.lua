local km = require('config.keymaps.flash')

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
      km.backward.key,
      mode = km.backward.mode,
      function()
        require('flash').jump({
          search = { forward = false, wrap = false, multi_window = false },
        })
      end,
      desc = km.backward.desc,
    },
    {
      km.forward.key,
      mode = km.forward.mode,
      function()
        require('flash').jump({
          search = { forward = true, wrap = false, multi_window = false },
        })
      end,
      desc = km.forward.desc,
    },

    ------------------------------------------------------------------
    -- Treesitter-aware jump (very useful for code)
    ------------------------------------------------------------------
    {
      km.ts_back.key,
      mode = km.ts_back.mode,
      function()
        require('flash').treesitter_search({
          label = { before = false, after = true, style = 'inline' },
        })
      end,
      desc = km.ts_back.desc,
    },
    {
      km.ts_fwd.key,
      mode = km.ts_fwd.mode,
      function()
        require('flash').treesitter_search({
          label = { before = true, after = false, style = 'inline' },
        })
      end,
      desc = km.ts_fwd.desc,
    },
  },
}
