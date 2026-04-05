local M = {}

function M.copy(expr, desc)
  local value = vim.fn.expand(expr)

  if value == '' then
    vim.notify('copy-path: no file', vim.log.levels.WARN)
    return
  end

  vim.fn.setreg('+', value)
  vim.notify(string.format('Copied (%s): %s', desc, value), vim.log.levels.INFO)
end

return M
