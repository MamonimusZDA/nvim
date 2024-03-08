#!/usr/bin/env lua

local M = {}

function M.setup()
  local status_ok, todo_comments = pcall(require, 'todo-comments')
  if not status_ok then
    return
  end

  local icons = require('misc.icons')

  todo_comments.setup({
    keywords = {
      FIX  = { icon = icons.todo_comments.Fix  .. ' '},
      TODO = { icon = icons.todo_comments.Todo .. ' '},
      HACK = { icon = icons.todo_comments.Hack .. ' '},
      WARN = { icon = icons.todo_comments.Warn .. ' '},
      PERF = { icon = icons.todo_comments.Perf .. ' '},
      NOTE = { icon = icons.todo_comments.Note .. ' '},
    },
  })
end

return M
