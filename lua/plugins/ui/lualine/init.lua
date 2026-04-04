return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',

  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local environment = require('environment')
    require('lualine').setup({
      ------------------------------------------------------------------
      -- Use Rose Pine theme for visual consistency
      ------------------------------------------------------------------
      options = {
        theme = environment.lualine_theme,
        icons_enabled = true,

        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = '' },

        disabled_filetypes = {
          statusline = { 'dashboard', 'alpha' },
        },
        always_divide_middle = true,
      },

      ------------------------------------------------------------------
      -- Layout of the statusline
      ------------------------------------------------------------------
      sections = {
        ----------------------------------------------------------------
        -- Left: editor state
        ----------------------------------------------------------------
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },

        ----------------------------------------------------------------
        lualine_b = {
          { 'branch' },
          { 'diff' },
        },

        ----------------------------------------------------------------
        -- Center: file information
        ----------------------------------------------------------------
        lualine_c = {
          {
            'filename',
            path = 1, -- Relative path
            symbols = {
              modified = ' ●',
              readonly = ' 🔒',
              unnamed = '[No Name]',
            },
          },
          {
            'searchcount',
            maxcount = 9999,
            timeout = 500,
          },
        },

        ----------------------------------------------------------------
        -- Right: diagnostics and environment
        ----------------------------------------------------------------
        lualine_x = {
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            sections = { 'error', 'warn', 'info', 'hint' },
            symbols = {
              error = 'E ',
              warn = 'W ',
              info = 'I ',
              hint = 'H ',
            },
          },
          { 'filetype', colored = true },
          {
            'fileformat',
            symbols = {
              unix = '', -- e712
              dos = '', -- e70f
              mac = '', -- e711
            },
          },
        },

        ----------------------------------------------------------------
        lualine_y = {
          { 'progress' },
        },

        ----------------------------------------------------------------
        lualine_z = {
          { 'location' },
        },
      },

      ------------------------------------------------------------------
      -- Inactive window: keep it minimal
      ------------------------------------------------------------------
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            path = 1,
          },
        },
        lualine_x = {
          { 'location' },
        },
        lualine_y = {},
        lualine_z = {},
      },

      extensions = {
        'aerial',
        'nvim-tree',
        'quickfix',
      },
    })
  end,
}
