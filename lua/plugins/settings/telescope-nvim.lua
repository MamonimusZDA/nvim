#! /usr/bin/env lua

local M = {}

function M.setup()
  local status_ok, telescope = pcall(require, 'telescope')
  if not status_ok then
    return
  end

  local icons = require('misc.icons')

  telescope.setup({
    defaults = {
      prompt_prefix = icons.ui.Telescope .. ' ',
      selection_caret = icons.ui.Forward .. '  ',
      path_display = { 'smart' },
    },

    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      },

      file_browser = {
        theme = 'ivy',
        hijack_netrw = true,
      }
    },
  })

  telescope.load_extension('fzf')
  telescope.load_extension('projects')
  telescope.load_extension('file_browser')
  telescope.load_extension('scope')
  telescope.load_extension('textcase')
end

return M
