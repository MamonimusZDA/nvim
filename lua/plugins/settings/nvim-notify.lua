#! /usr/bin/env lua
---@diagnostic disable: missing-fields

local M = {}

function M.setup()
  local status_ok, notify = pcall(require, 'notify')
  if not status_ok then
    return
  end

  notify.setup({
    max_height = function()
      return math.floor(vim.o.lines * 0.60)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.40)
    end,
    timeout = 3000,
    render = 'compact',
    top_down = false,
    background_colour = '#000000',
  })
end

return M
