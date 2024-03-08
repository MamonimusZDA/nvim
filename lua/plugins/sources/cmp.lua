#! /usr/bin/env lua

return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'quangnguyen30192/cmp-nvim-ultisnips',
      'roobert/tailwindcss-colorizer-cmp.nvim',
    },
    event = {
      'InsertEnter',
      'CmdlineEnter',
    },
    main = 'plugins.settings.nvim-cmp',
    config = true,
  },
  {
    'hrsh7th/cmp-nvim-lsp',
    lazy = true,
  },
  {
    'hrsh7th/cmp-nvim-lua',
    lazy = true,
  },
  {
    'hrsh7th/cmp-buffer',
    lazy = true,
  },
  {
    'hrsh7th/cmp-cmdline',
    lazy = true
  },
  {
    'hrsh7th/cmp-path',
    lazy = true,
  },
  {
    'hrsh7th/cmp-calc',
    lazy = true
  },
  {
    'hrsh7th/cmp-nvim-lsp-signature-help',
    lazy = true,
  },
  {
    'quangnguyen30192/cmp-nvim-ultisnips',
    dependencies = 'SirVer/ultisnips',
    lazy = true,
    config = true,
  },
  {
    'roobert/tailwindcss-colorizer-cmp.nvim',
    opts =  {
      color_square_width = 2,
    },
    lazy = true,
  },
}
