#! /usr/bin/env lua

return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    main = 'plugins.settings.lualine-nvim',
    config = true,
  },
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
      'nvim-treesitter/nvim-treesitter',
    },
    event = 'VeryLazy',
    main = 'plugins.settings.noice-nvim',
    config = true,
  },
}
