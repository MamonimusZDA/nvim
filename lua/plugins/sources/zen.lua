#!/usr/bin/env lua

return {
  {
    'folke/zen-mode.nvim',
    dependencies = 'twilight.nvim',
    cmd = 'ZenMode',
    main = 'plugins.settings.zen-mode-nvim',
    config = true,
  },
  {
    'folke/twilight.nvim',
    lazy = true,
    cmd = {
      'Twilight',
      'TwilightEnable',
      'TwilightDisable',
    },
    main = 'plugins.settings.twilight-nvim',
    config = true,
  },
}
