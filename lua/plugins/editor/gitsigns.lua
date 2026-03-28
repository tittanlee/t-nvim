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
      map('n', ']g', gs.next_hunk, 'Next Git hunk')
      map('n', '[g', gs.prev_hunk, 'Previous Git hunk')

      ------------------------------------------------------------------
      -- Actions
      ------------------------------------------------------------------
      map('n', '<leader>hs', gs.stage_hunk, 'Stage hunk')
      map('n', '<leader>hr', gs.reset_hunk, 'Reset hunk')
      map('n', '<leader>hS', gs.stage_buffer, 'Stage buffer')
      map('n', '<leader>hu', gs.undo_stage_hunk, 'Undo stage hunk')
      map('n', '<leader>hR', gs.reset_buffer, 'Reset buffer')

      ------------------------------------------------------------------
      -- Preview / Blame
      ------------------------------------------------------------------
      map('n', '<leader>hp', gs.preview_hunk, 'Preview hunk')
      map('n', '<leader>hb', gs.blame_line, 'Blame line')

      ------------------------------------------------------------------
      -- Text object
      ------------------------------------------------------------------
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'Select hunk')

      -- Toggles
      map('n', '<leader>tl', gs.toggle_linehl, 'toggle line hl')
      map('n', '<leader>tb', gs.toggle_current_line_blame, 'toggle line blame')
      map('n', '<leader>tw', gs.toggle_word_diff, 'toggle word diff')
    end,
  },
}
