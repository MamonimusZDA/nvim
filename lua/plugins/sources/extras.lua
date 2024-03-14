#! /usr/bin/env lua

return {
  {
    'giusgad/pets.nvim',
    enabled = function()
      return not (os.getenv('OS') == 'ANDROID')
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'giusgad/hologram.nvim',
    },
    cmd = 'PetsNew',
    config = true,
  },
  {
    'eandrju/cellular-automaton.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    cmd = 'CellularAutomaton',
  },
  {
    'alec-gibson/nvim-tetris',
    cmd = 'Tetris',
  },
  {
    'rktjmp/playtime.nvim',
    enabled = function()
      return not (os.getenv('OS') == 'ANDROID')
    end,
    cmd = 'Playtime',
    config = true,
  },
  {
    'NStefan002/2048.nvim',
    cmd = 'Play2048',
    config = true,
  },
  {
    'mistricky/codesnap.nvim',
    enabled = function()
      return not (os.getenv('OS') == 'ANDROID')
    end,
    build = 'make',
    cmd = 'CodeSnapPreviewOn',
    main = 'plugins.settings.codesnap-nvim',
    config = true,
  },
  {
    'NStefan002/speedtyper.nvim',
    dependencies = {
      'stevearc/dressing.nvim',
      'rcarriga/nvim-notify',
    },
    cmd = 'Speedtyper',
    config = true,
  },
}
