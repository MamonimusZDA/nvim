#! /usr/bin/env lua
---@diagnostic disable: redefined-local, missing-fields

local M = {}

local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
  return
end

local status_ok, types = pcall(require, 'cmp.types')
if not status_ok then
  return
end

local status_ok, ultisnips_map = pcall(require, 'cmp_nvim_ultisnips.mappings')
if not status_ok then
  return
end

local status_ok, backout = pcall(require, 'backout')
if not status_ok then
  return
end

local status_ok, icons = pcall(require, 'misc.icons')
if not status_ok then
  return
end

local check_backspace = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

function M.setup()
  cmp.setup({
    enabled = function()
      local status_ok, context = pcall(require, 'cmp.config.context')
      if not status_ok then
        return false
      end

      if vim.bo.buftype == 'prompt' then
        return vim.api.nvim_get_mode().mode == 'c'
      else
        return not context.in_treesitter_capture('comment')
          and not context.in_syntax_group('Comment')
      end
    end,

    snippet = {
      expand = function(args)
        vim.fn['UltiSnips#Anon'](args.body)
      end,
    },

    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs( 4), { 'i', 'c' }),
      ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),

      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),

      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      ['<C-e>'] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },

      ['<C-n>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item({
            behavior = types.cmp.SelectBehavior.Select
          })
        elseif vim.fn['UltiSnips#CanJumpForwards']() == 1 then
          ultisnips_map.jump_forwards(fallback)
        elseif check_backspace() then
          backout.out()
        else
          backout.out()
        end
      end, { 'i', 's' }),
      ['<C-p>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({
            behavior = types.cmp.SelectBehavior.Select
          })
        elseif vim.fn['UltiSnips#CanJumpBackwards']() == 1 then
          ultisnips_map.jump_backwards(fallback)
        else
          backout.back()
        end
      end, { 'i', 's' }),
    },

    formatting = {
      fields = { 'kind', 'abbr', 'menu' },
      format = function(entry, vim_item)
        vim_item.kind = icons.kind[vim_item.kind]
        vim_item.menu = ({
          nvim_lsp = '',
          nvim_lua = '',
          buffer = '',
          path = '',
          ultisnips = '',
        })[entry.source.name]

        if vim.tbl_contains({ 'nvim_lsp' }, entry.source.name) then
          local duplicates = {
            buffer = 1,
            path = 1,
            nvim_lsp = 0,
            ultisnips = 1,
          }

          ---@diagnostic disable-next-line: assign-type-mismatch
          vim_item.dup = duplicates[entry.source.name] or 0
        end

        if vim.tbl_contains({ 'nvim_lsp' }, entry.source.name) then
          local words = {}
          for word in string.gmatch(vim_item.word, '[^-]+') do
            table.insert(words, word)
          end

          local color_name, color_number
          if
            words[2] == 'x'
            or words[2] == 'y'
            or words[2] == 't'
            or words[2] == 'b'
            or words[2] == 'l'
            or words[2] == 'r'
          then
            color_name = words[3]
            color_number = words[4]
          else
            color_name = words[2]
            color_number = words[3]
          end

          if color_name == 'white' or color_name == 'black' then
            local color
            if color_name == 'white' then
              color = 'ffffff'
            else
              color = '000000'
            end

            local hl_group = 'lsp_documentColor_mf_' .. color
            vim.api.nvim_set_hl(0, hl_group, { fg = '#' .. color, bg = 'NONE' })
            vim_item.kind_hl_group = hl_group

            vim_item.kind = string.rep('▣', 1)

            return vim_item
          elseif #words < 3 or #words > 4 then
            return vim_item
          end

          if not color_name or not color_number then
            return vim_item
          end

          local color_index = tonumber(color_number)
          local tailwindcss_colors = require('tailwindcss-colorizer-cmp.colors').TailwindcssColors

          if not tailwindcss_colors[color_name] then
            return vim_item
          end

          if not tailwindcss_colors[color_name][color_index] then
            return vim_item
          end

          local color = tailwindcss_colors[color_name][color_index]

          local hl_group = 'lsp_documentColor_mf_' .. color
          vim.api.nvim_set_hl(0, hl_group, { fg = '#' .. color, bg = 'NONE' })

          vim_item.kind_hl_group = hl_group
          vim_item.kind = string.rep('▣', 1)
        end

        return vim_item
      end,
    },

    sources = {
      {
        name = 'nvim_lsp',
        entry_filter = function(entry, ctx)
          local kind = require('cmp.types.lsp').CompletionItemKind[entry:get_kind()]
          if kind == 'Snippet' and ctx.prev_context.filetype == 'java' then
            return false
          end

          if ctx.prev_context.filetype == 'markdown' then
            return true
          end

          if kind == 'Text' then
            return false
          end

          return true
        end,
      },
      {
        name = 'buffer',
        keyword_length = 3,
      },
      { name = 'path' },
      { name = 'calc' },
      { name = 'treesitter' },
      { name = 'ultisnips' },
      { name = 'nvim_lsp_signature_help' }
    },

    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },

    view = {
      entries = {
        name = 'custom',
        selection_order = 'top_down',
      },
      docs = {
        auto_open = false,
      },
    },

    window = {
      completion = {
        border = 'rounded',
        winhighlight = 'Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None',
        col_offset = -3,
        side_padding = 1,
        scrollbar = false,
        scrolloff = 8,
      },
      documentation = {
        border = 'rounded',
        winhighlight = 'Normal:Pmenu,FloatBorder:FloatBorder,Search:None',
      },
    },

    experimental = {
      ghost_text = false,
    },
  })

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' },
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'cmdline' },
    })
  })
end

return M
