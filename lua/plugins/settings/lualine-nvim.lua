#! /usr/bin/env lua

local M = {}

function M.setup()
  local colors = {
    normal         = '#c792ea',
    insert         = '#82b1ff',
    visual         = '#89DDFF',
    replace        = '#C3E88D',
    inactive       = '#2c3043',
    primary_font   = '#092236',
    secondary_font = '#a1aab8',
    component      = '#303030',
    component_font = '#c6c6c6',
    transparent    = nil
  }

  local user_theme = {
    normal = {
      a = { fg = colors.primary_font, bg = colors.normal },
      b = { fg = colors.component_font, bg = colors.component },
      c = { fg = colors.transparent, bg = colors.transparent },
      x = { fg = colors.component_font, bg = colors.component },
    },
    insert = {
      a = { fg = colors.primary_font, bg = colors.insert },
      x = { fg = colors.component_font, bg = colors.component },
    },
    visual = {
      a = { fg = colors.primary_font, bg = colors.visual },
      x = { fg = colors.component_font, bg = colors.component },
    },
    replace = {
      a = { fg = colors.primary_font, bg = colors.replace },
      x = { fg = colors.component_font, bg = colors.component },
    },
    inactive = {
      a = { fg = colors.secondary_font, bg = colors.inactive },
      b = { fg = colors.secondary_font, bg = colors.inactive },
      c = { fg = colors.secondary_font, bg = colors.inactive },
      x = { fg = colors.secondary_font, bg = colors.inactive },
    },
    command = {
      a = { fg = colors.primary_font, bg = colors.normal },
      b = { fg = colors.component_font, bg = colors.component },
      c = { fg = colors.transparent, bg = colors.transparent },
      x = { fg = colors.component_font, bg = colors.component },
    },
  }

  local icons_status_ok, icons = pcall(require, 'misc.icons')
  if not icons_status_ok then
    return
  end

  local config = {
    options = {
      theme = user_theme,
      component_separators = icons.ui.LineLeft,
      disabled_filetypes = {
        'alpha',
        'dashboard',
        'NvimTree',
        'Outline'
      },
      section_separators = {
        left = icons.lualine.SectionRight,
        right = icons.lualine.SectionLeft
      },
    },
    sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
  }

  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
      local filepath = vim.fn.expand('%:p:h')
      local gitdir = vim.fn.finddir('.git', filepath .. ';')
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
  }

  local progress = function()
    local current_line = vim.fn.line('.')
    local total_lines = vim.fn.line('$')
    local chars = { '__', '▁▁', '▂▂', '▃▃', '▄▄', '▅▅', '▆▆', '▇▇', '██' }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end

  local function ins_a(component)
    table.insert(config.sections.lualine_a, component)
  end

  local function ins_b(component)
    table.insert(config.sections.lualine_b, component)
  end

  local function ins_c(component)
    table.insert(config.sections.lualine_c, component)
  end

  local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
  end

  ins_a {
    function()
      return icons.lualine.Icon
    end,
    separator = {
      left = icons.lualine.SectionLeft,
      right = icons.lualine.SectionRight
    },
    right_padding = 1
  }

  ins_b {
    'filename',
    symbols = {
      modified = icons.git.LineModified .. ' ',
      readonly = icons.misc.Eye .. ' ',
    },
    cond = conditions.buffer_not_empty,
    left_padding = -1
  }

  ins_b {
    'branch',
    icon = icons.lualine.Branch
  }

  ins_c {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    sections = { 'error', 'warn' },
  }

  ins_right {
    'filetype',
    icon = { align = 'left' },
    separator = {
      right = icons.lualine.SectionRight,
      left = icons.lualine.SectionLeft
    },
  }

  ins_right {
    progress,
    separator = {
      right = icons.lualine.SectionRight,
      left = icons.lualine.SectionLeft
    },
  }

  local status_ok, lualine = pcall(require, 'lualine')
  if not status_ok then
    return
  end

  lualine.setup(config)
end

return M
