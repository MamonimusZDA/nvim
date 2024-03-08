#! /usr/bin/env lua

local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

---@diagnostic disable-next-line: redefined-local
local status_ok, ts_repeat_move = pcall(require, 'nvim-treesitter.textobjects.repeatable_move')
if not status_ok then
  return
end


local M = {}

function M.setup()
  treesitter.setup({
    ensure_installed = {
      'lua',
      'vim',
      'markdown',
      'markdown_inline',
      'bash',
      'python'
    },

    ignore_install = { '' },
    sync_install = false,

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },

    auto_install = true,
    modules = {},

    indent = {
      enable = true,
      disable = {
        'yaml',
        'python'
      },
    },

    autopairs = { enable = true },

    incremental_selection = {
      enable = true,
      keymaps = {
        scope_incremental = false,
        init_selection = '<C-Space>',
        node_incremental = '<C-Space>',
        node_decremental = '<C-Backspace>',
      },
    },

    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['a='] = { query = '@assignment.outer' },
          ['i='] = { query = '@assignment.inner' },
          ['l='] = { query = '@assignment.lhs' },
          ['r='] = { query = '@assignment.rhs' },

          ['aa'] = { query = '@parameter.outer' },
          ['ia'] = { query = '@parameter.inner' },

          ['ai'] = { query = '@conditional.outer' },
          ['ii'] = { query = '@conditional.inner' },

          ['al'] = { query = '@loop.outer' },
          ['il'] = { query = '@loop.inner' },

          ['af'] = { query = '@call.outer' },
          ['if'] = { query = '@call.inner' },

          ['am'] = { query = '@function.outer' },
          ['im'] = { query = '@function.inner' },
        },
      },

      swap = {
        enable = true,
        swap_next = {
          ['<leader><leader>na'] = '@parameter.inner',
          ['<leader><leader>nm'] = '@function.outer',
        },
        swap_previous = {
          ['<leader><leader>pa'] = '@parameter.inner',
          ['<leader><leader>pm'] = '@function.outer',
        },
      },

      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          [']f'] = { query = '@call.outer' },
          [']m'] = { query = '@function.outer' },
          [']c'] = { query = '@class.outer' },
          [']i'] = { query = '@conditional.outer' },
          [']l'] = { query = '@loop.outer' },
        },
        goto_next_end = {
          [']F'] = { query = '@call.outer' },
          [']M'] = { query = '@function.outer' },
          [']C'] = { query = '@class.outer' },
          [']I'] = { query = '@conditional.outer' },
          [']L'] = { query = '@loop.outer' },
        },
        goto_previous_start = {
          ['[f'] = { query = '@call.outer' },
          ['[m'] = { query = '@function.outer' },
          ['[c'] = { query = '@class.outer' },
          ['[i'] = { query = '@conditional.outer' },
          ['[l'] = { query = '@loop.outer' },
        },
        goto_previous_end = {
          ['[F'] = { query = '@call.outer' },
          ['[M'] = { query = '@function.outer' },
          ['[C'] = { query = '@class.outer' },
          ['[I'] = { query = '@conditional.outer' },
          ['[L'] = { query = '@loop.outer' },
        },
      },
    },
  })

  vim.keymap.set({ 'n', 'x', 'o' }, '<leader>;', ts_repeat_move.repeat_last_move)
  vim.keymap.set({ 'n', 'x', 'o' }, '<leader>,', ts_repeat_move.repeat_last_move_opposite)

  vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f)
  vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F)
  vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t)
  vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T)
end

return M
