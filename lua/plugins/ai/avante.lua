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

    require('avante').setup({
      provider = 'claude',
      providers = {
        claude = {
          endpoint = 'https://llm-api.amd.com/Anthropic',
          auth_type = 'api',
          model = 'Claude-Sonnet-4.6',
          timeout = 30000, -- Timeout in milliseconds
          context_window = 16384,
          extra_headers = {
            -- ['Ocp-Apim-Subscription-Key'] = '',
            ['Ocp-Apim-Subscription-Key'] = subscription_key,
          },
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 8000,
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
          start_insert = true, -- Start insert mode when opening the ask window
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
