#! /usr/bin/env lua

local M = {}

function M.setup()
  local status_ok, indent = pcall(require, 'indent_blankline')
  if not status_ok then
    return
  end

  local icons = require('misc.icons')

  indent.setup {
    buftype_exclude = { 'terminal', 'nofile' },
    filetype_exclude = {
      'help',
      'startify',
      'dashboard',
      'lazy',
      'neogitstatus',
      'NvimTree',
      'Trouble',
      'text',
      'norg',
    },

    har = icons.ui.LineLeft,
    ontext_char = icons.ui.LineLeft,

    show_current_context = true,
    show_first_indent_level = false,
    show_trailing_blankline_indent = false,
    use_treesitter = true,
  }
end

return M
