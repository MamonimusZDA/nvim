#!/usr/bin/env lua

return {
  {
    'numToStr/Comment.nvim',
    dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
    main = 'plugins.settings.comment-nvim',
    config = true,
    keys = {
      'gco', 'gcO', 'gcA',
      { 'gc', mode = { 'n', 'v' } },
      { 'gb', mode = { 'n', 'v' } },
      { '<leader>/', mode = { 'n', 'v' } },
    },
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true
  },
  {
    'folke/todo-comments.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'LudoPinelli/comment-box.nvim',
    },
    main = 'plugins.settings.todo-comments-nvim',
    config = true,
    keys = {
      {
        ']t', function()
          require('todo-comments').jump_next()
        end
      },
      {
        '[t', function()
          require('todo-comments').jump_prev()
        end
      },
      {
        '<leader>lc', '<Cmd>TodoLocList<Cr>'
      }
    },
  },
  {
    'LudoPinelli/comment-box.nvim',
    main = 'plugins.settings.comment-box-nvim',
    config = true,
    keys = { '<leader>c' }
  }
}
