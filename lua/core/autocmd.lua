local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Return to last edit position
local exclude_ft = { gitcommit = true, gitrebase = true, help = true }
autocmd('BufReadPost', {
  group = augroup('restore_cursor', { clear = true }),
  callback = function(event)
    if exclude_ft[vim.bo[event.buf].filetype] then
      return
    end

    local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(event.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- sync with system clipboard on focus
autocmd('FocusGained', {
  pattern = '*',
  callback = function()
    local system_content = vim.fn.getreg('+')
    if system_content ~= '' then
      vim.fn.setreg('"', system_content)
    end
  end,
})

-- sync with system clipboard on focus
autocmd('FocusLost', {
  pattern = '*',
  callback = function()
    local nvim_content = vim.fn.getreg('"')
    if nvim_content ~= '' then
      vim.fn.setreg('+', nvim_content)
    end
  end,
})
