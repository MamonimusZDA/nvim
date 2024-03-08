#! /usr/bin/env lua
---@diagnostic disable: redefined-local, missing-fields

local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
  return
end

local status_ok, icons = pcall(require, 'misc.icons')
if not status_ok then
  return
end

local M = {}

function M.setup()
  bufferline.setup({
    options = {
      mode = 'buffers',
      numbers = 'none',
      indicator = { style = 'none' },
      style_preset = bufferline.style_preset.minimal,
      buffer_close_icon = icons.ui.Close,
      modified_icon = icons.ui.Circle,
      close_icon = icons.ui.BoldClose,
      left_trunc_marker = icons.ui.ArrowCircleLeft,
      right_trunc_marker = icons.ui.ArrowCircleRight,
      max_name_length = 18,
      max_prefix_length = 15,
      truncate_names = true,
      tab_size = 18,
      diagnostics = 'nvim_lsp',
      diagnostics_update_in_insert = false,
      offsets = {
        {
          filetype = 'undotree',
          text = 'Undotree',
          highlight = 'PanelHeading',
          padding = 1,
        },
        {
          filetype = 'NvimTree',
          text = 'Explorer',
          highlight = 'PanelHeading',
          padding = 1,
        },
        {
          filetype = 'DiffviewFiles',
          text = 'Diff View',
          highlight = 'PanelHeading',
          padding = 1,
        },
        {
          filetype = 'flutterToolsOutline',
          text = 'Flutter Outline',
          highlight = 'PanelHeading',
        },
        {
          filetype = 'lazy',
          text = 'Lazy',
          highlight = 'PanelHeading',
          padding = 1,
        },
      },
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = { '', '' },
      enforce_regular_tabs = false,
      always_show_bufferline = false,
      groups = {
        options = {
          toggle_hidden_on_enter = true,
        },
        items = {
          {
            name = 'Docs',
            auto_close = true,
            matcher = function(buf)
              local filename = vim.api.nvim_buf_get_name(buf.id)
              return filename:match('%.md') or filename:match('%.txt')
            end,
            highlight = { sp = '#224c8b' },
          },
          {
            name = 'Tests',
            auto_close = true,
            matcher = function(buf)
              local filename = vim.api.nvim_buf_get_name(buf.id)
              return filename:match('%_test') or filename:match('%_spec')
            end,
            highlight = { sp = '#3c63a4' },
          },
          {
            name = 'Notes',
            auto_close = true,
            matcher = function(buf)
              local filename = vim.api.nvim_buf_get_name(buf.id)
              return filename:match('%.norg')
            end,
            highlight = { sp = '#5679bd' },
          },
        },
      },
    },
  })
end

return M
