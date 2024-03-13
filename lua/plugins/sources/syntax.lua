#! /usr/bin/env lua

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      'folke/todo-comments.nvim',
      'kevinhwang91/nvim-ufo',
    },
    main = 'plugins.settings.nvim-treesitter',
    config = true,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    lazy = true,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = {
      'BufReadPre',
      'BufNewFile',
    },
    config = true,
    keys = {
      {
        '<leader>cx',
        function()
          require('treesitter-context').go_to_context(vim.v.count1)
        end,
      },
    },
  },
  {
    'atusy/treemonkey.nvim',
    keys = {
      {
        'm',
        function()
          require('treemonkey').select({ ignore_injections = false })
        end,
        mode = { 'x', 'o' },
      },
    },
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    lazy = true,
    main = 'plugins.settings.nvim-ufo',
    config = true,
  },
}
