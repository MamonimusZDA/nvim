#!/usr/bin/env lua

local M = {}

function M.setup()
  local status_ok, harpoon = pcall(require, 'harpoon')
  if not status_ok then
    return
  end

  local key = vim.keymap.set

  key('n', '<Tab>', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end)

  key('n', '<C-h>h', function()
    harpoon:list():append()
    vim.notify('marked file', 'info', {
      icon = '',
      title = 'Harpoon'
    })
  end)

  key('n', '<C-h>1', function() harpoon:list():select(1) end)
  key('n', '<C-h>2', function() harpoon:list():select(2) end)
  key('n', '<C-h>3', function() harpoon:list():select(3) end)
  key('n', '<C-h>4', function() harpoon:list():select(4) end)
end

return M
