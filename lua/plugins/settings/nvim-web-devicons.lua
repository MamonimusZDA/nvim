#! /usr/bin/env lua

local M = {}

function M.setup()
  local status_ok, devicons = pcall(require, 'nvim-web-devicons')
  if not status_ok then
    return
  end

  devicons.setup {
    override = {
      ['README.md'] = {
        icon = '',
        color = '#519aba',
        name = 'README.md',
      },
    },

    override_by_extension = {
      ['norg'] = {
        icon = '󱗃',
        color = '#b32668',
        name = 'Norg',
      },
    },
  }

  devicons.set_icon {
    astro = {
      icon = '󱓞',
      color = '#FF7E33',
      name = 'astro',
    },

    lockb = {
      icon = '',
      color = '#cbcb41',
      name = 'lockb',
    },

    ['tsx'] = {
      icon = '',
      color = '#519aba',
      cterm_color = '26',
      name = 'Tsx',
    },

    toml = {
      icon = '',
      color = '#6e8086',
      name = 'toml',
    },

    ['.npmignore'] = {
      icon = '',
      color = '#c63c42',
      name = '.npmignore',
    },

    ['tsconfig.tsbuildinfo'] = {
      icon = '',
      color = '#cbcb41',
      name = 'tsconfig.tsbuildinfo',
    },
  }
end

return M
