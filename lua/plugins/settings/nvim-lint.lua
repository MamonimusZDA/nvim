#! /usr/bin/env lua

local M = {}

local status_ok, lint = pcall(require, 'lint')
if not status_ok then
  return
end

function M.setup()
  lint.linters_by_ft({
    python = { 'pylint' },
  })

  local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
  vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    group = lint_augroup,
    callback = function()
      lint.try_lint()
    end,
  })
end

return M
