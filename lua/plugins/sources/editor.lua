#! /usr/bin/env lua

return {
  {
    'hrsh7th/nvim-insx',
    event = 'InsertEnter',
    main = 'insx.preset.standard',
    config = true,
  },
  {
    'johmsalas/text-case.nvim',
    dependencies = 'nvim-telescope/telescope.nvim',
    opts = {
      prefix = 'g.',
    },
    config = true,
    keys = {
      'g.',
      {
        '<leader>t.',
        '<cmd>TextCaseOpenTelescope<CR>',
        mode = { 'n', 'v' },
      },
    },
  },
  {
    'AgusDOLARD/backout.nvim',
    event = 'InsertEnter',
    config = true,
  },
  {
    'kylechui/nvim-surround',
    version = '*',
    config = true,
    keys = { 'cs', 'ys', 'ds' },
  },
  {
    'chrisgrieser/nvim-spider',
    opts = {
      skipInsignificantPunctuation = false,
    },
    config = true,
    keys = {
      {
        'w',
        function()
          require('spider').motion('w')
        end,
        mode = { 'n', 'o', 'x' },
      },
      {
        'e',
        function()
          require('spider').motion('e')
        end,
        mode = { 'n', 'o', 'x' },
      },
      {
        'b',
        function()
          require('spider').motion('b')
        end,
        mode = { 'n', 'o', 'x' },
      },
      {
        'ge',
        function()
          require('spider').motion('ge')
        end,
        mode = { 'n', 'o', 'x' },
      },
    },
  },
  {
    'andymass/vim-matchup',
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = nil }
      vim.g.matchup_matchpref = { html = { nolists = 1 } }
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    main = 'plugins.settings.nvim-ts-autotag',
    config = true,
  },
  {
    'jinh0/eyeliner.nvim',
    event = 'VeryLazy',
    opts = {
      highlight_on_key = true,
      dim = true,
    },
    config = true,
  },
  {
    'monaqa/dial.nvim',
    event = 'VeryLazy',
    main = 'plugins.settings.dial-nvim',
    config = true,
  },
  {
    'lambdalisue/suda.vim',
    enabled = function()
      return not (os.getenv('OS') == 'ANDROID')
    end,
    cmd = {
      'SudaRead',
      'SudaWrite',
    },
  },
  { 'tpope/vim-sleuth' },
  { 'MaxMEllon/vim-jsx-pretty' },
}
