#! /usr/bin/env lua

local M = {}

function M.init()
  local status_ok, lazy = pcall(require, 'lazy')
  if not status_ok then
    return
  end

  vim.ui.select = function(...)
    lazy.load({ plugins = { 'dressing.nvim' } })
    return vim.ui.select(...)
  end

  vim.ui.input = function(...)
    lazy.load({ plugins = { 'dressing.nvim' } })
    return vim.ui.input(...)
  end
end

return M
