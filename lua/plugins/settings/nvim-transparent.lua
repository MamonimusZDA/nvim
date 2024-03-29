#! /usr/bin/env lua

local M = {}

function M.setup()
  local status_ok, transparent = pcall(require, 'transparent')
  if not status_ok then
    return
  end

  transparent.setup({
    groups = {
      'Comment',
      'Conditional',
      'Constant',
      'CursorLineNr',
      'EndOfBuffer',
      'Function',
      'Identifier',
      'LineNr',
      'NonText',
      'Normal',
      'NormalNC',
      'Operator',
      'PreProc',
      'Repeat',
      'SignColumn',
      'Special',
      'Statement',
      'String',
      'Structure',
      'Todo',
      'Type',
      'Underlined',
    },
    extra_groups = {
      'BufferLineBackground',
      'BufferLineFill',
      'BufferLineIndicatorSelected',
      'BufferLineSeparator',
      'BufferLineTabClose',
      'BufferlineBufferSelected',
      'ColorColumn',
      'CursorLineSign',
      'DiagnosticSignError',
      'DiagnosticSignHint',
      'DiagnosticSignInfo',
      'DiagnosticSignOk',
      'DiagnosticSignWarn',
      'DiagnosticVirtualTextError',
      'DiagnosticVirtualTextHint',
      'DiagnosticVirtualTextInfo',
      'DiagnosticVirtualTextOk',
      'DiagnosticVirtualTextWarn',
      'EndOfBuffer',
      'FloatBorder',
      'FloatTitle',
      'FoldColumn',
      'Folded',
      'GitSignsAdd',
      'GitSignsChange',
      'GitSignsDelete',
      'GitSignsUntracked',
      'MsgArea',
      'NoiceCmdlineIcon',
      'NoiceCmdlinePopupBorder',
      'NormalFloat',
      'NormalSB',
      'NotifyDEBUGBody',
      'NotifyDEBUGBorder',
      'NotifyDEBUGIcon',
      'NotifyDEBUGTitle',
      'NotifyERRORBody',
      'NotifyERRORBorder',
      'NotifyERRORIcon',
      'NotifyERRORTitle',
      'NotifyINFOBody',
      'NotifyINFOBorder',
      'NotifyINFOIcon',
      'NotifyINFOTitle',
      'NotifyTRACEBody',
      'NotifyTRACEBorder',
      'NotifyTRACEIcon',
      'NotifyTRACETitle',
      'NotifyWARNBody',
      'NotifyWARNBorder',
      'NotifyWARNIcon',
      'NotifyWARNTitle',
      'NvimTreeNormal',
      'NvimTreeNormalNC',
      'Pmenu',
      'Question',
      'QuickFixLine',
      'SignColumn',
      'SpecialKey',
      'StatusLine',
      'StatusLineNC',
      'TabLine',
      'TabLineFill',
      'TelescopeBorder',
      'TelescopeNormal',
      'TermCursor',
      'TermCursorNC',
      'Tooltip',
      'TroubleNormal',
      'UfoCursorFoldedLine',
      'UfoFoldedEllipsis',
      'UfoPreviewCursorLine',
      'UfoPreviewSbar',
      'UfoPreviewThumb',
      'UfoPreviewWinBar',
      'VertSplit',
      'WhichKeyFloat',
    },
    exclude_groups = {},
  })
end

return M
