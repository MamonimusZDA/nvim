#! /usr/bin/env lua

return {
  {
    'xiyaowong/nvim-transparent',
    lazy = false,
    priority = 1000,
    main = 'plugins.settings.nvim-transparent',
    config = true,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    commit = '9637670896b68805430e2f72cf5d16be5b97a22a',
    event = {
      'BufReadPre',
      'BufNewFile',
    },
    main = 'plugins.settings.indent-blankline-nvim',
    config = true,
  },
  {
    'stevearc/dressing.nvim',
    lazy = true,
    init = require('plugins.settings.dressing-nvim').init,
  },
  {
    'nvim-zh/colorful-winsep.nvim',
    commit = 'e1b72c498f25c1fc37a7e9913332c137f753a90a',
    opts = {
      anchor = {
        up = { width = 0, x = -1, y = 0 },
        bottom = { width = 0, x = 0, y = 0 },
        left = { height = 0, x = -1, y = -1 },
        right = { height = 0, x = -1, y = 0 },
      },
    },
    event = 'WinNew',
    config = true,
  },
  {
    'NvChad/nvim-colorizer.lua',
    event = {
      'BufReadPost',
      'BufNewFile',
    },
    main = 'plugins.settings.nvim-colorizer-lua',
    config = true,
    keys = {
      {
        '<C-c>',
        '<Cmd>ColorizerToggle<Cr>',
      },
    },
  },
  {
    'rcarriga/nvim-notify',
    dependencies = 'nvim-telescope/telescope.nvim',
    event = {
      'CursorMoved',
      'CursorHold',
      'InsertEnter',
      'CmdlineEnter',
    },
    main = 'plugins.settings.nvim-notify',
    config = true,
    keys = {
      {
        '<leader>nd',
        function()
          require('notify').dismiss({
            silent = true,
            pending = true,
          })
        end,
      },
      {
        '<leader>tn',
        function()
          require('telescope').extensions.notify.notify()
        end,
      },
    },
  },
}
