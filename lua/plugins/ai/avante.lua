return {
  'yetone/avante.nvim',
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has('win32') ~= 0 and 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false' or 'make',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },

  ---@module 'avante'
  ---@type avante.Config
  config = function()
    local raw = vim.env['ANTHROPIC_CUSTOM_HEADERS']
    local subscription_key = raw and raw:match(':%s*(.+)')
    local endpoint = vim.env['ANTHROPIC_BASE_URL']

    require('avante').setup({
      provider = 'claude',
      providers = {
        claude = {
          endpoint = endpoint,
          auth_type = 'api',
          model = 'Claude-Sonnet-4.6',
          model_names = {
            'Claude-Opus-4.6',
            'Claude-Sonnet-4.6',
            'Claude-Haiku-4.5',
          },
          timeout = 30000, -- Timeout in milliseconds
          context_window = 16384,
          extra_headers = {
            ['Ocp-Apim-Subscription-Key'] = subscription_key,
          },
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 16384,
          },
        },
      },

      windows = {
        width = 40, -- default % based on available width
        edit = {
          border = 'rounded',
          start_insert = true, -- Start insert mode when opening the edit window
        },
        ask = {
          floating = false, -- Open the 'AvanteAsk' prompt in a floating window
          start_insert = false, -- Start insert mode when opening the ask window
          border = 'single',
          ---@type "ours" | "theirs"
          focus_on_apply = 'ours', -- which diff to focus after applying
        },
      },

      ------------------------------------------------------------------
      -- Keep behavior explicit and safe
      ------------------------------------------------------------------
      behaviour = {
        auto_apply_diff_after_generation = false,
      },
    })
  end,
}
