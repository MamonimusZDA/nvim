#! /usr/bin/env lua

return {
  {
    'folke/tokyonight.nvim',
    enabled = true,
    lazy = false,
    priority = 1000,
    init = function()
      local status_ok, tokyonight = pcall(require, 'tokyonight')
      if not status_ok then
        return
      end

      tokyonight.setup({
        styles = {
          comments  = { italic = true },
          keywords  = { italic = true },
          functions = { italic = true },
        },

        style = 'night',
        transparent = true,
      })

      vim.cmd.colorscheme('tokyonight')
    end,
  },
  {
    'Mofiqul/dracula.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme('dracula')
    end,
  },
  {
    'yashguptaz/calvera-dark.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme('calvera')
    end,
  },
  {
    'catppuccin/nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    name = 'catppuccin',
    init = function()
      vim.cmd.colorscheme('catppuccin')
    end,
  },
  {
    'frenzyexists/aquarium-vim',
    enabled = false,
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme('aquarium')

      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = '',
        callback = function()
          vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#2B2C3B' })
        end
      })
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme('kanagawa')
    end,
  },
  {
    'wuelnerdotexe/vim-enfocado',
    enabled = false,
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.enfocado_style = 'neon'
      vim.cmd.colorscheme('enfocado')
    end,
  },
  {
    'water-sucks/darkrose.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme('darkrose')
    end,
  },
  {
    'perpetuatheme/nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme('perpetua')
    end,
  },
  {
    'NTBBloodbath/doom-one.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme('doom-one')
    end,
  },
  {
    'Verf/deepwhite.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme('deepwhite')
    end,
  }
}
