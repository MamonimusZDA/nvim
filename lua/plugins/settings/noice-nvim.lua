#! /usr/bin/env lua

local M = {}

function M.setup()
  local noice_status_ok, noice = pcall(require, 'noice')
  if not noice_status_ok then
    return
  end

  noice.setup({
    lsp = {
      progress = {
        enabled = false,
      },
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = false,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true,
    },
    errors = {
      view = 'popup',
      opts = {
        enter = true,
        format = 'details'
      },
      filter = { error = true },
      filter_opts = { reverse = true },
    }
  })
end

return M
