#!/usr/bin/env lua

local M = {}

function M.setup()
  local project_status_ok, project = pcall(require, 'project_nvim')
  if not project_status_ok then
	  return
  end

  project.setup({
    active = true,
    on_config_done = nil,
    manual_mode = false,
    detection_methods = { 'lsp', 'pattern' },
    patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json' },
    show_hidden = false,
    silent_chdir = true,
    ignore_lsp = {},
    datapath = vim.fn.stdpath('data'),
  })
end

return M
