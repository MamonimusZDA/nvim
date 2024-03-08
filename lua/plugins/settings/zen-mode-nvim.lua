#! /usr/bin/env lua

local M = {}

function M.setup()
  local status_ok, zen = pcall(require, 'zen-mode')
  if not status_ok then
    return
  end

  zen.setup({
    window = {
      backdrop = 0.75,
      width = 80,
      height = 1,
      options = {
        signcolumn = 'no',
        number = false,
        relativenumber = false,
        cursorline = false,
        cursorcolumn = false,
        foldcolumn = '0',
        list = false,
      },
    },
    plugins = {
      options = {
        enabled = false,
        ruler = false,
        showcmd = false,
      },
      twilight = { enabled = true },
      gitsigns = { enabled = false },
      kitty = {
        enabled = true,
        font = '20',
      }
    },
    on_open = function()
      vim.cmd('IBLDisable')
      vim.diagnostic.config({
        underline = false,
        virtual_text = false,
        virtual_lines = false
      })
      vim.opt.scrolloff = 1000
      vim.opt.sidescrolloff = 1000
    end,
    on_close = function()
      vim.cmd('IBLEnable')
      vim.diagnostic.config({
        underline = true,
        virtual_text = true,
        virtual_lines = false
      })
      vim.opt.scrolloff = 3
      vim.opt.sidescrolloff = 3
    end,
  })
end

return M
