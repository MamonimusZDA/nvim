#! /usr/bin/env lua

return {
  {
    'neovim/nvim-lspconfig',
    event = {
      'BufReadPre',
      'BufNewFile'
    },
    dependencies = {
      'williamboman/mason.nvim',
      'antosha417/nvim-lsp-file-operations',
      'hrsh7th/cmp-nvim-lsp',
      'nvim-telescope/telescope.nvim',
      'SmiteshP/nvim-navbuddy',
    },
    main = 'plugins.settings.nvim-lspconfig',
    config = true,
  },
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-tree.lua',
    },
    lazy = true,
    config = true,
  },
  {
    'folke/neodev.nvim',
    lazy = true,
    opts = {
      library = {
        plugins = { 'neotest' },
        types = true
      },
    },
  },
  {
    'b0o/schemastore.nvim',
    version = false,
    lazy = true,
  },
  {
    'williamboman/mason.nvim',
    dependencies = 'williamboman/mason-lspconfig.nvim',
    cmd = {
      'Mason',
      'MasonInstall',
      'MasonUninstall',
      'MasonUninstallAll',
      'MasonLog',
    },
    keys = {
      {
        '<leader>i',
        '<Cmd>Mason<Cr>'
      },
    },
    opts = {
      ui = {
        border = 'rounded',
      },
    },
    config = true,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = true,
  },
  {
    'aznhe21/actions-preview.nvim',
    lazy = true,
    main = 'plugins.settings.actions-preview-nvim',
    config = true,
  },
  {
    'j-hui/fidget.nvim',
    tag = 'v1.0.0',
    config = true,
  },
  {
    'SmiteshP/nvim-navbuddy',
    dependencies = {
      'SmiteshP/nvim-navic',
      'MunifTanjim/nui.nvim'
    },
    opts = {
      window = {
        border = 'rounded',
      },
      lsp = {
        auto_attach = true
      },
    },
    keys = {
      {
        '<leader>nb', function ()
          require('nvim-navbuddy').open()
        end
      },
    },
  },
  {
    'SmiteshP/nvim-navic',
    lazy = true,
  },
}
