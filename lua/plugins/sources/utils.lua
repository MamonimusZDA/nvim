#! /usr/bin/env lua

return {
  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    main = 'plugins.settings.toggleterm-nvim',
    config = true,
    keys = {
      '<C-\\>',
      '<leader>gg',
    },
  },
  {
    'jiaoshijie/undotree',
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {
      position = 'right',
    },
    config = true,
    keys = {
      {
        '<leader>u',
        function()
          require('undotree').toggle()
        end,
      },
    },
  },
  {
    'backdround/improved-search.nvim',
    keys = {
      {
        'n',
        function()
          require('improved-search').stable_next()
        end,
        mode = { 'n', 'x', 'o' },
      },
      {
        'N',
        function()
          require('improved-search').stable_previous()
        end,
        mode = { 'n', 'x', 'o' },
      },
      {
        '!',
        function()
          require('improved-search').current_word()
        end,
      },
      {
        '!',
        function()
          require('improved-search').in_place()
        end,
        mode = { 'x' },
      },
      {
        '*',
        function()
          require('improved-search').forward()
        end,
        mode = { 'x' },
      },
      {
        '#',
        function()
          require('improved-search').backward()
        end,
        mode = { 'x' },
      },
      {
        '|',
        function()
          require('improved-search').in_place()
        end,
      },
    },
  },
  {
    'otavioschwanck/new-file-template.nvim',
    -- https://github.com/cvigilv/esqueleto.nvim
    opts = {},
  },
  {
    'danymat/neogen',
    version = '*',
    config = true,
    keys = {
      {
        '<leader>ng',
        function()
          require('neogen').generate({})
        end,
      },
    },
  },
}
