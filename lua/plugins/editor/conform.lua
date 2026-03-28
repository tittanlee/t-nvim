return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'black' },
      sh = { 'shfmt' },
      json = { 'prettier' },
      html = { 'prettier' },
      yaml = { 'prettier' },
    },

    format_on_save = function(bufnr)
      if vim.bo[bufnr].filetype == 'lua' then
        return {
          timeout_ms = 3000,
          -- async = true,
          lsp_fallback = false,
        }
      end
    end,
  },
}
