#! /usr/bin/env lua

local M = {}

local status_ok, luasnip = pcall(require, 'luasnip')
if not status_ok then
  return
end

function M.setup()
  luasnip.loaders.from_vscode:lazy_load({
    paths = {
      vim.fn.stdpath('config') .. '/lua/misc/snippets',
    },
  })
end

return M
