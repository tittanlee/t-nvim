-- `k` would be the second key of a mapping
k = function()
  vim.api.nvim_input('<esc>')
  local current_line = vim.api.nvim_get_current_line()
  if current_line:match('^%s+.$') then
    vim.schedule(function()
      vim.api.nvim_set_current_line('')
    end)
  end
end

return {
  'max397574/better-escape.nvim',

  config = function()
    require('better_escape').setup({
      timeout = vim.o.timeoutlen, -- after `timeout` passes, you can press the escape key and the plugin will ignore it
      default_mappings = true, -- setting this to false removes all the default mappings

      mappings = {
        -- i for insert, other modes are the first letter too
        i = {
          -- map jk and jj  to exit insert mode
          j = {
            k = '<Esc>',
            j = '<Esc>',
          },
        },
      },
    })
  end,
}
