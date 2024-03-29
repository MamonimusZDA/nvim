#! /usr/bin/env lua

return {
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
    main = 'plugins.settings.nvim-web-devicons',
    config = true,
  },
  {
    'nvim-lua/plenary.nvim',
    lazy = true,
  },
  {
    'MunifTanjim/nui.nvim',
    lazy = true,
  },
  {
    'giusgad/hologram.nvim',
    enabled = function()
      return not (os.getenv('OS') == 'ANDROID')
    end,
    lazy = true,
  },
  {
    'kevinhwang91/promise-async',
    lazy = true,
  },
}
