#! /usr/bin/env lua

local status_ok, neorg = pcall(require, 'neorg')
if not status_ok then
  return
end

local M = {}

function M.setup()
  neorg.setup({
    load = {
      ['core.autocommands'] = {},
      ['core.clipboard.code-blocks'] = {},
      ['core.concealer'] = {
        config = {
          folds = true,
          icon_present = 'varied',
          icons = {
            code_block = {
              conceal = true,
              width = 'content',
            },
            heading = {
              icons = {
                '◉',
                '○',
                '✸',
                '✿',
                '❀',
                '◆',
              },
            },
          },
        },
      },
      ['core.defaults'] = {},
      ['core.dirman'] = {
        config = {
          workspaces = {
            notes = '~/Documents/notes',
            escuela = '~/Documents/Escuela',
          },
          default_workspace = 'escuela',
          index = 'index.norg',
        },
      },
      ['core.dirman.utils'] = {},
      ['core.esupports.hop'] = {
        config = {
          external_filetypes = {},
        },
      },
      ['core.esupports.indent'] = {},
      ['core.esupports.metagen'] = {
        config = {
          timezone = 'implicit-local',
          type = 'auto',
        },
      },
      ['core.export'] = {},
      ['core.highlights'] = {},
      ['core.integrations.treesitter'] = {},
      ['core.itero'] = {},
      ['core.journal'] = {
        config = {
          journal_folder = 'journal',
          workspaces = 'notes',
        },
      },
      ['core.looking-glass'] = {},
      ['core.mode'] = {},
      ['core.neorgcmd'] = {},
      ['core.pivot'] = {},
      ['core.presenter'] = {
        config = {
          zen_mode = 'zen-mode',
        },
      },
      ['core.promo'] = {},
      ['core.qol.toc'] = {},
      ['core.queries.native'] = {},
      ['core.storage'] = {},
      ['core.summary'] = {},
      ['core.tangle'] = {},
      ['core.ui'] = {},
      ['core.ui.calendar'] = {},
    },
  })
end

return M
