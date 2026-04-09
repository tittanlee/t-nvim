local km = require('config.keymaps.gitsigns')
local K  = require('config.keymaps')

return {
  'lewis6991/gitsigns.nvim',

  -- Load when a file is read or created
  event = { 'BufReadPre', 'BufNewFile' },

  opts = {
    ----------------------------------------------------------------------
    -- Sign definitions
    -- These signs will be rendered by Snacks.statuscolumn
    ----------------------------------------------------------------------
    signs = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
    signs_staged = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },

    ----------------------------------------------------------------------
    -- Disable built-in signcolumn usage
    -- Snacks.statuscolumn will handle rendering
    ----------------------------------------------------------------------
    signs_staged_enable = true,
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
      follow_files = true,
    },

    ----------------------------------------------------------------------
    -- Git behavior
    ----------------------------------------------------------------------
    auto_attach = true,
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
      use_focus = true,
    },

    ----------------------------------------------------------------------
    -- Performance tuning
    ----------------------------------------------------------------------
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    sign_priority = 6,
    status_formatter = nil, -- Use default-
    update_debounce = 100,
    max_file_length = 40000,

    ----------------------------------------------------------------------
    -- Preview window configuration
    ----------------------------------------------------------------------
    preview_config = {
      border = 'rounded',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1,
    },

    ----------------------------------------------------------------------
    -- On-attach keymaps
    -- These are buffer-local and only active in Git repositories
    ----------------------------------------------------------------------
    on_attach = function(bufnr)
      local gs = require('gitsigns')

      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      ------------------------------------------------------------------
      -- Navigation
      ------------------------------------------------------------------
      map('n', km.nav.next.key, gs.next_hunk,  km.nav.next.desc)
      map('n', km.nav.prev.key, gs.prev_hunk,  km.nav.prev.desc)

      ------------------------------------------------------------------
      -- Actions
      ------------------------------------------------------------------
      map('n', K.key(km.hunk, 'stage'),      gs.stage_hunk,      K.desc(km.hunk, 'stage'))
      map('n', K.key(km.hunk, 'reset'),      gs.reset_hunk,      K.desc(km.hunk, 'reset'))
      map('n', K.key(km.hunk, 'stage_buf'),  gs.stage_buffer,    K.desc(km.hunk, 'stage_buf'))
      map('n', K.key(km.hunk, 'undo_stage'), gs.undo_stage_hunk, K.desc(km.hunk, 'undo_stage'))
      map('n', K.key(km.hunk, 'reset_buf'),  gs.reset_buffer,    K.desc(km.hunk, 'reset_buf'))

      ------------------------------------------------------------------
      -- Preview / Blame
      ------------------------------------------------------------------
      map('n', K.key(km.hunk, 'preview'), gs.preview_hunk, K.desc(km.hunk, 'preview'))
      map('n', K.key(km.hunk, 'blame'),   gs.blame_line,   K.desc(km.hunk, 'blame'))

      ------------------------------------------------------------------
      -- Text object
      ------------------------------------------------------------------
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'Select hunk')

      ------------------------------------------------------------------
      -- Toggles
      ------------------------------------------------------------------
      map('n', K.key(km.toggle, 'linehl'), gs.toggle_linehl,             K.desc(km.toggle, 'linehl'))
      map('n', K.key(km.toggle, 'blame'),  gs.toggle_current_line_blame, K.desc(km.toggle, 'blame'))
      map('n', K.key(km.toggle, 'word'),   gs.toggle_word_diff,          K.desc(km.toggle, 'word'))
    end,
  },
}
