return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  enabled = false,

  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = function()
        return 'make'
      end,
    },

    -- live_grep support rg parameters
    'nvim-telescope/telescope-live-grep-args.nvim',
  },

  keys = {
    -- telescope built-in
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = '<telescope> Find Files (fd)' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = '<telescope> Find Buffers' },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = '<telescope> Find Help_Tags' },

    -- telescope extesions : live_grep_args
    {
      '<leader>fg',
      function()
        require('telescope').extensions.live_grep_args.live_grep_args()
      end,
      desc = '<telescope> Live Grep with Args (rg)',
    },
    {
      '<leader>fw',
      function()
        require('telescope-live-grep-args.shortcuts').grep_word_under_cursor({
          postfix = ' ',
        })
      end,
      desc = '<telescope> Grep word under cursor (Shortcut)',
    },

    -- telescope lsp
    { '<leader>fs', '<cmd>Telescope lsp_document_symbols<CR>', desc = '<telescope> lsp document symbols' },
    { '<leader>fr', '<cmd>Telescope lsp_references<CR>', desc = '<telescope> lsp references' },
    { '<leader>fd', '<cmd>Telescope lsp_definitions<CR>', desc = '<telescope> lsp defintions' },
    { '<leader>fD', '<cmd>Telescope lsp_type_definitions<CR>', desc = '<telescope> lsp type definitions' },

    -- telescope resume back to previous result
    { '<leader>fu', '<cmd>Telescope resume<CR>', desc = '<telescope> resume' },

    -- telescope buffers list
    { '<leader>fb', '<cmd>Telescope buffers<CR>', desc = '<telescope> buffers list' },

    -- telescope command list
    { '<leader>fc', '<cmd>Telescope commands<CR>', desc = '<telescope> commands list' },

    -- telescope keymap list
    { '<leader>fc', '<cmd>Telescope keymaps<CR>', desc = '<telescope> keymaps list' },
  },

  config = function()
    local telescope = require('telescope')
    local lga_actions = require('telescope-live-grep-args.actions')

    telescope.setup({
      defaults = {
        path_display = { 'truncate' },
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
          '--glob=!.git/',
        },

        mappings = {
          i = {
            -- ━━━━━━━━━━━━━━━━━━❰ result scroll ❱━━━━━━━━━━━━━━━━━━━ --
            ['<C-u>'] = require('telescope.actions').results_scrolling_up,
            ['<C-d>'] = require('telescope.actions').results_scrolling_down,

            -- ━━━━━━━━━━━━━━━━━❰ selection scroll ❱━━━━━━━━━━━━━━━━━ --
            ['<C-k>'] = require('telescope.actions').move_selection_previous,
            ['<C-j>'] = require('telescope.actions').move_selection_next,

            -- ━━━━━━━━━━━━━━━━━━━━━❰ preview ❱━━━━━━━━━━━━━━━━━━━━━━ --
            ['<C-p>'] = require('telescope.actions.layout').toggle_preview,
            ['<C-b>'] = require('telescope.actions').preview_scrolling_down,
            ['<C-f>'] = require('telescope.actions').preview_scrolling_up,
            ['<C-q>'] = require('telescope.actions').smart_send_to_qflist + require('telescope.actions').open_qflist,
            ['<CR>'] = require('telescope.actions').select_default + require('telescope.actions').center,
          },
        },
      },

      pickers = {
        find_files = {
          find_command = {
            'fd',
            '--type',
            'f',
            '--strip-cwd-prefix',
            '--hidden',
            '--exclude',
            '.git',
          },

          -- find_command = {
          --     "rg",
          --     "-uuu",
          --     "--files",
          --     "--no-ignore",
          --     "--glob=!.git/",
          -- },

          preview = {
            hide_on_startup = true,
          },
          layout_strategy = 'horizontal',
        },
      },

      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = 'smart_case', -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
        },

        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              ['<C-i>'] = lga_actions.quote_prompt(), -- quick add the quote on keyword
              ['<C-space>'] = lga_actions.to_fuzzy_refine, -- freeze the current list and start a fuzzy search in the frozen list
            },
          },
        },
      },
    })

    pcall(telescope.load_extension, 'fzf')
    pcall(telescope.load_extension, 'live_grep_args')
  end,
}
