#! /usr/bin/env lua

return {
  {
    'tpope/vim-fugitive',
    cmd = { 'G', 'Git' },
    keys = {
      {
        '<leader>gf',
        '<Cmd>Git fetch --all -p<Cr>',
        desc = 'Git fetch'
      },
      {
        '<leader>gl',
        '<Cmd>Git pull<Cr>',
        desc = 'Git pull'
      },
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    event = {
      'CmdlineEnter',
      'InsertEnter',
      'CursorHold',
      'CursorMoved'
    },
    opts = {
      max_file_length = 10000,
    },
    cmd = 'Gitsigns',
    keys = {
      {
        '<Leader>gd',
        '<Cmd>Gitsigns diffthis<Cr>',
      },
      {
        '<Leader>gk',
        '<Cmd>Gitsigns prev_hunk<Cr>',
      },
      {
        '<Leader>gj',
        '<Cmd>Gitsigns next_hunk<Cr>',
      },
    },
  }
}
