#! /usr/bin/env lua

local M = {}

local status_ok, codesnap = pcall(require, 'codesnap')
if not status_ok then
  return
end

function M.setup()
  codesnap.setup({
    mac_window_bar = false,
    opacity = false,
    watermark = 'MamonimusZDA',
  })
end

return M
