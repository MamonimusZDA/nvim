#! /usr/bin/env lua

return {
  {
    'stevearc/oil.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = false,
    config = true,
    keys = {
      {
        '<leader>-',
        '<Cmd>Oil<Cr>',
      },
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      view = {
        side = 'right',
      },
    },
    config = true,
    keys = {
      {
        '<leader>nt',
        '<Cmd>NvimTreeToggle<Cr>',
      },
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
    },
    main = 'plugins.settings.telescope-nvim',
    config = true,
    cmd = 'Telescope',
    keys = {
      {
        '<leader>tf',
        function()
          require('telescope.builtin').find_files()
        end,
      },
      {
        '<leader>tF',
        function()
          require('telescope.builtin').find_files({
            hidden = true,
          })
        end,
      },
      {
        '<leader>tl',
        function()
          require('telescope.builtin').live_grep()
        end,
      },
      {
        '<leader>tb',
        function()
          require('telescope.builtin').buffers()
        end,
      },
      {
        '<leader>tgb',
        function()
          require('telescope.builtin').git_branches()
        end,
      },
      {
        '<leader>tgc',
        function()
          require('telescope.builtin').git_bcommits()
        end,
      },
      {
        '<leader>th',
        function()
          require('telescope.builtin').help_tags()
        end,
      },
      {
        'z=',
        function()
          require('telescope.builtin').spell_suggest()
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
  {
    'ahmedkhalf/project.nvim',
    dependencies = 'nvim-telescope/telescope.nvim',
    main = 'plugins.settings.project-nvim',
    config = true,
    keys = {
      {
        '<leader>tp',
        function()
          require('telescope').extensions.projects.projects({})
        end,
      },
    },
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      {
        '<leader>te',
        function()
          require('telescope').extensions.file_browser.file_browser({
            path = '%:p:h',
            select_buffer = true,
          })
        end,
      },
    },
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    lazy = true,
    build = 'make',
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = true,
    keys = {
      {
        '<leader>h',
        function()
          require('hop').hint_char2({})
        end,
      },
    },
  },
}
