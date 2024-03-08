#! /usr/bin/env lua

return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = 'nvim-lua/plenary.nvim',
    main = 'plugins.settings.harpoon',
    config = true,
    keys = {
      '<C-h>',
      '<Tab>',
    },
  },
}
