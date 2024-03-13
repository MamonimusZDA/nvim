#! /usr/bin/env lua

return {
  {
    'nvim-neorg/neorg',
    dependencies = 'nvim-lua/plenary.nvim',
    ft = 'norg',
    cmd = 'Neorg',
    build = ':Neorg sync-parsers',
    main = 'plugins.settings.neorg',
    config = true,
  },
}
