local km = require('config.keymaps.multicursors')

return {
  'smoka7/multicursors.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvimtools/hydra.nvim',
  },
  cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
  keys = {
    { mode = km.start.mode, km.start.key, '<cmd>MCstart<cr>', desc = km.start.desc },
  },

  opts = {
    hint_config = {
      float_opts = {
        border = 'rounded',
      },
      position = 'bottom',
    },
    generate_hints = {
      normal = true,
      insert = true,
      extend = true,
      config = {
        -- determines how many columns are used to display the hints. If you leave this option nil, the number of columns will depend on the size of your window.
        column_count = nil,
      },
    },
  },

  -- opts = {
  --   ------------------------------------------------------------------
  --   -- Keep the setup minimal and predictable
  --   -- Do not enable preset mappings
  --   ------------------------------------------------------------------
  --   enable_preset_mappings = false,
  --
  --   ------------------------------------------------------------------
  --   -- Normal mode bindings
  --   -- These are explicit and do not interfere with completion
  --   ------------------------------------------------------------------
  --   normal_keys = {
  --     -- Add the next occurrence under the cursor
  --     ['<C-n>'] = {
  --       method = require('multicursors').methods.add_cursor_down,
  --       desc = 'Multicursor: Add next occurrence',
  --     },
  --
  --     -- Skip current occurrence and move to the next one
  --     ['<C-x>'] = {
  --       method = require('multicursors').methods.skip_cursor_down,
  --       desc = 'Multicursor: Skip occurrence',
  --     },
  --
  --     -- Select all occurrences of the word under cursor
  --     ['<A-n>'] = {
  --       method = require('multicursors').methods.select_all,
  --       desc = 'Multicursor: Select all occurrences',
  --     },
  --   },
  --
  --   ------------------------------------------------------------------
  --   -- Visual mode bindings
  --   -- Useful when selecting a region first
  --   ------------------------------------------------------------------
  --   visual_keys = {
  --     -- Add next occurrence matching the selection
  --     ['<C-n>'] = {
  --       method = require('multicursors').methods.add_cursor_down,
  --       desc = 'Multicursor: Add next occurrence',
  --     },
  --
  --     -- Skip current selection and move forward
  --     ['<C-x>'] = {
  --       method = require('multicursors').methods.skip_cursor_down,
  --       desc = 'Multicursor: Skip selection',
  --     },
  --   },
  -- },
}
