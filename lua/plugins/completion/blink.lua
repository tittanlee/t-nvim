return {
  'saghen/blink.cmp',
  version = '*', -- Use latest stable version

  dependencies = {
    -- Snippet engine (required)
    'L3MON4D3/LuaSnip',

    -- Optional snippet collections
    'rafamadriz/friendly-snippets',
  },

  opts = {
    ------------------------------------------------------------------
    -- Completion behavior
    ------------------------------------------------------------------
    completion = {
      keyword = { range = 'full' },

      accept = {
        auto_brackets = {
          enabled = true, -- Automatically insert brackets after functions
        },
      },

      list = {
        selection = {
          preselect = false, -- Do not auto-select first item
          auto_insert = true,
        },
      },

      menu = {
        border = 'rounded',
        draw = {
          columns = {
            { 'label', 'label_description', gap = 1 },
            { 'kind_icon', 'kind' },
          },
        },
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 300,
        window = {
          border = 'rounded',
        },
      },
    },

    ------------------------------------------------------------------
    -- Key mappings
    ------------------------------------------------------------------
    keymap = {
      preset = 'default',

      ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide' },
      ['<CR>'] = { 'accept', 'fallback' },

      ['<Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_next()
          end
        end,
        'snippet_forward',
        'fallback',
      },

      ['<S-Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.snippet_backward()
          else
            return cmp.select_prev()
          end
        end,
        'fallback',
      },
    },

    ------------------------------------------------------------------
    -- Completion sources
    ------------------------------------------------------------------
    sources = {
      default = {
        'lsp',
        'path',
        'snippets',
        'buffer',
      },

      providers = {
        lsp = {
          name = 'LSP',
          enabled = true,
          module = 'blink.cmp.sources.lsp',
        },
        path = {
          name = 'Path',
          module = 'blink.cmp.sources.path',
          score_offset = 3,
        },
        snippets = {
          name = 'Snippets',
          module = 'blink.cmp.sources.snippets',
          min_keyword_length = 1,
        },
        buffer = {
          name = 'Buffer',
          module = 'blink.cmp.sources.buffer',
          min_keyword_length = 3,
        },
      },
    },

    ------------------------------------------------------------------
    -- Appearance
    ------------------------------------------------------------------
    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = 'mono', -- Use Nerd Font icons if available
    },

    ------------------------------------------------------------------
    -- Snippets integration
    ------------------------------------------------------------------
    snippets = {
      preset = 'luasnip',
    },

    signature = {
      enabled = true,
    },
  },

  config = function(_, opts)
    local luasnip = require('luasnip')

    -- Load VSCode-style snippets
    require('luasnip.loaders.from_vscode').lazy_load()

    require('blink.cmp').setup(opts)
  end,
}
