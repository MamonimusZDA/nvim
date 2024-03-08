#! /usr/bin/env lua

local M = {}

function M.setup()
  local augend_status_ok, augend = pcall(require, 'dial.augend')
  if not augend_status_ok then
    return
  end

  local config_status_ok, config = pcall(require, 'dial.config')
  if not config_status_ok then
    return
  end

  config.augends:register_group {
    default = {
      augend.integer.alias.decimal,
      augend.integer.alias.hex,
      augend.date.alias['%Y/%m/%d'],
    },
    typescript = {
      augend.integer.alias.decimal,
      augend.integer.alias.hex,
      augend.constant.new({
        elements = {
          'let',
          'const'
        }
      }),
    },
    visual = {
      augend.integer.alias.decimal,
      augend.integer.alias.hex,
      augend.date.alias['%Y/%m/%d'],
      augend.constant.alias.alpha,
      augend.constant.alias.Alpha,
    },
    mygroup = {
      augend.constant.new {
        elements = { 'and', 'or' },
        word = true,
        cyclic = true,
      },
      augend.constant.new {
        elements = { 'True', 'False' },
        word = true,
        cyclic = true,
      },
      augend.constant.new {
        elements = { 'public', 'private' },
        word = true,
        cyclic = true,
      },
      augend.constant.new {
        elements = { 'sad', 'sad' },
        word = true,
        cyclic = true,
      },
      augend.constant.new {
        elements = { '&&', '||' },
        word = false,
        cyclic = true,
      },
      augend.date.alias['%m/%d/%Y'],
      augend.constant.alias.bool,
      augend.integer.alias.decimal,
      augend.integer.alias.hex,
      augend.semver.alias.semver,
    },
  }

  local map_status_ok, map = pcall(require, 'dial.map')
  if not map_status_ok then
    return
  end

  vim.api.nvim_set_keymap('n', '<C-a>', map.inc_normal('mygroup'), { noremap = true })
  vim.api.nvim_set_keymap('n', '<C-x>', map.dec_normal('mygroup'), { noremap = true })
  vim.api.nvim_set_keymap('v', '<C-a>', map.inc_normal('visual'),  { noremap = true })
  vim.api.nvim_set_keymap('v', '<C-x>', map.dec_normal('visual'),  { noremap = true })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = {
      'typescript',
      'javascript'
    },
    callback = function()
      vim.api.nvim_buf_set_keymap(0, 'n', '<C-a>', require('dial.map').inc_normal('typescript'), {
        noremap = true
      })
    end
  })
end

return M
