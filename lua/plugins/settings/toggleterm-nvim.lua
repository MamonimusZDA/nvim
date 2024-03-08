#! /usr/bin/env lua

local M = {}

function M.setup()
  local status_ok, toggleterm = pcall(require, 'toggleterm')
  if not status_ok then
    return
  end

  toggleterm.setup({
    size = 20,
    open_mapping = [[<A-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'float',
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = 'curved',
      winblend = 0,
    },
  })

  vim.api.nvim_create_autocmd('TermOpen', {
    pattern = '',
    callback = function()
      vim.api.nvim_buf_set_keymap(0, 't', '<C-\\>', [[<C-\><C-n>]], {
        noremap = true
      })
    end
  })

  local Terminal = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new({ cmd = 'lazygit', hidden = true })

  function _LazyGit_toggle()
    lazygit:toggle()
  end

  vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>lua _LazyGit_toggle()<cr>', {
    noremap = true,
    silent = true
  })
end

return M
