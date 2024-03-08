#! /usr/bin/env lua

local M = {}

function M.setup()
  local status_ok, hl = pcall(require, 'actions-preview.highlight')
  if not status_ok then
    return
  end

  local action_preview = require('actions-preview')

  action_preview.setup({
    diff = {
      algorithm = 'patience',
      ignore_whitespace = true,
    },
    backend = { 'telescope' },
    telescope = {
      sorting_strategy = 'ascending',
      layout_strategy = 'vertical',
      layout_config = {
        width = 0.8,
        height = 0.9,
        prompt_position = 'top',
        preview_cutoff = 20,
        preview_height = function(_, _, max_lines)
          return max_lines - 15
        end,
      },
    },
    highlight_command = {
      hl.delta('delta --no-gitconfig --side-by-side --paging=always'),
    }
  })
end

return M
