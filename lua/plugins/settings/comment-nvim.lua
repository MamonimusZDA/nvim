#! /usr/bin/env lua

local M = {}

function M.setup()
  vim.g.skip_ts_context_commentstring_module = true
  require('ts_context_commentstring').setup({
    enable_autocmd = false,
  })

  require('Comment').setup({
    padding = true,
    sticky = true,
    toggler = {
      line = 'gcc',
      block = 'gbc',
    },
    opleader = {
      line = 'gc',
      block = 'gb',
    },
    extra = {
      above = 'gcO',
      below = 'gco',
      eol = 'gcA',
    },
    mappings = {
      basic = true,
      extra = true,
    },
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  })

  vim.api.nvim_set_keymap(
    'n',
    '<leader>/',
    '<Plug>(comment_toggle_linewise_current)',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    'v',
    '<leader>/',
    '<Plug>(comment_toggle_linewise_current)',
    { noremap = true, silent = true }
  )
end

return M
