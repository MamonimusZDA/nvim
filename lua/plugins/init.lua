#! /usr/bin/env lua

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local lazy_status_ok, lazy = pcall(require, 'lazy')
if not lazy_status_ok then
  return
end

vim.api.nvim_set_keymap('n', '<leader>p', '<Cmd>Lazy<CR>', {
  noremap = true,
  silent  = true,
})

lazy.setup({
  spec = {
    { import = 'plugins.sources' }
  },
  install = {
    colorscheme = { vim.g.colors_name, 'default' }
  },
  ui = {
    border = 'rounded',
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
})
