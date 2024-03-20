#!/usr/bin/env lua

local M = {}

local status_ok, conform = pcall(require, 'conform')
if not status_ok then
  return
end

function M.setup()
  conform.setup({
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'isort', 'black' },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = not os.getenv('OS') == 'ANDROID' and 500 or 5000,
    },
  })
end

return M
