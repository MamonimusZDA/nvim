#! /usr/bin/env lua

return {
  {
    'moll/vim-bbye',
    keys = {
      {
        '<C-w>c',
        '<Cmd>Bwipeout!<Cr>'
      },
    },
  },
  {
    'nyngwang/NeoZoom.lua',
    opts = {
      winopts = {
        offset = {},
      },
    },
    config = true,
    keys = {
      {
        '<C-w>z',
        '<Cmd>NeoZoomToggle<Cr>'
      },
    },
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    event = 'VeryLazy',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'tiagovla/scope.nvim',
    },
    main = 'plugins.settings.bufferline-nvim',
    config = true,
    keys = {
      {
        'gp',
        '<Cmd>BufferLineCycleNext<Cr>'
      },
      {
        'gP',
        '<Cmd>BufferLineCyclePrev<Cr>'
      },

      {
        '<leader>gp',
        '<Cmd>BufferLineMoveNext<Cr>'
      },
      {
        '<leader>gP',
        '<Cmd>BufferLineMovePrev<Cr>'
      },

      {
        '<C-g>p',
        '<Cmd>BufferLinePick<Cr>'
      },

      {
        '<C-g>td',
        '<Cmd>BufferLineGroupToggle Docs<Cr>'
      },
      {
        '<C-g>cd',
        '<Cmd>BufferLineGroupClose Docs<Cr>'
      },
      {
        '<C-g>tt',
        '<Cmd>BufferLineGroupToggle Tests<Cr>'
      },
      {
        '<C-g>ct',
        '<Cmd>BufferLineGroupClose Tests<Cr>'
      },
      {
        '<C-g>tn',
        '<Cmd>BufferLineGroupToggle Notes<Cr>'
      },
      {
        '<C-g>cn',
        '<Cmd>BufferLineGroupClose Notes<Cr>'
      },
      {
        '<C-g>tu',
        '<Cmd>BufferLineGroupToggle ungrouped<Cr>'
      },
      {
        '<C-g>cu',
        '<Cmd>BufferLineGroupClose ungrouped<Cr>'
      },

      {
        '<C-w>C',
        '<Cmd>BufferLineCloseOthers<Cr>'
      },
      {
        '<C-w>L',
        '<Cmd>BufferLineCloseRight<Cr>'
      },
      {
        '<C-w>H',
        '<Cmd>BufferLineCloseLeft<Cr>'
      },
    },
  },
  {
    'tiagovla/scope.nvim',
    lazy = true,
    config = true,
    keys = {
      {
        'tB',
        '<Cmd>Telescope scope buffers<Cr>'
      },
    },
  },
}
