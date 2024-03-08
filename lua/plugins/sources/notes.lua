#! /usr/bin/env lua

-- return {
--   {
--     {
--       'nvim-neorg/neorg',
--       build = ':Neorg sync-parsers',
--       dependencies = {
--         'nvim-lua/plenary.nvim',
--         'nvim-cmp',
--         'nvim-treesitter/nvim-treesitter',
--       },
--       ft = 'norg',
--       cmd = 'Neorg',
--       main = 'plugins.settings.neorg',
--       config = true
--     },
--   }
-- }

return {
  {
    'nvim-neorg/neorg',
    dependencies = 'nvim-lua/plenary.nvim',
    -- lazy = false,
    ft = 'norg',
    cmd = 'Neorg',
    tag = '*',
    build = ':Neorg sync-parsers',
    main = 'plugins.settings.neorg',
    config = true,
  },
}
