#! /usr/bin/env lua

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('Basic_settings', { clear = true })

autocmd('TextYankPost', {
  group = 'Basic_settings',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '100' })
  end,
})

autocmd('BufWritePre', {
  group = 'Basic_settings',
  pattern = '',
  callback = function()
    local save_cursor = vim.fn.getpos('.')
    pcall(function()
      vim.cmd([[silent! %s/\s\+$//e]])
    end)
    vim.fn.setpos('.', save_cursor)
  end,
})

autocmd('VimResized', {
  group = 'Basic_settings',
  pattern = '',
  command = 'silent! tabdo wincmd =',
})

augroup('FileType_settings', { clear = true })

autocmd('FileType', {
  group = 'FileType_settings',
  pattern = 'qf',
  command = 'set nobuflisted',
})

autocmd('Filetype', {
  group = 'FileType_settings',
  pattern = {
    'qf',
    'help',
    'man',
    'lspinfo',
    'lsp-installer',
    'DressingSelect',
    'Jaq',
    'floaterm',
    'null-ls-info',
    'tsplayground',
    'startuptime',
  },
  callback = function()
    local o = {
      buffer = 0,
      silent = true,
      noremap = true,
    }
    local key = vim.keymap.set
    key('n', 'q', '<C-w>c', o)
    vim.opt_local.buflisted = false
  end,
})

autocmd('FileType', {
  group = 'FileType_settings',
  pattern = 'lua',
  callback = function()
    vim.opt_local.include = [[\v<((do|load)file|require|reload)[^''"]*[''"]\zs[^''"]+]]
    vim.opt_local.includeexpr = "substitute(v:fname,'\\.','/','g')"
    vim.opt_local.suffixesadd:prepend('.lua')
    vim.opt_local.suffixesadd:prepend('init.lua')

    for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
      vim.opt_local.path:append(path .. '/lua')
    end
  end,
})

augroup('Terminal_settings', { clear = true })

autocmd('TermOpen', {
  group = 'Terminal_settings',
  pattern = '',
  command = 'startinsert',
})

autocmd('TermEnter', {
  group = 'Terminal_settings',
  callback = function()
    vim.o.number = false
    vim.o.relativenumber = false
    vim.o.cursorline = false
  end,
})

autocmd('TermLeave', {
  group = 'Terminal_settings',
  callback = function()
    vim.o.number = true
    vim.o.relativenumber = true
    vim.o.cursorline = true
  end,
})

autocmd('BufLeave', {
  group = 'Terminal_settings',
  pattern = 'term://*',
  command = 'stopinsert',
})

augroup('User_events', { clear = true })

autocmd({ 'BufReadPre', 'BufNewFile', 'BufWritePost' }, {
  group = 'User_events',
  callback = function(args)
    local current_file = vim.api.nvim_buf_get_name(args.buf)

    if not (current_file == '' or vim.api.nvim_get_option_value('buftype', { buf = args.buf }) == 'nofile') then
      vim.api.nvim_exec_autocmds('User', { pattern = 'FileOpen' })
      vim.api.nvim_exec_autocmds('CursorMoved', { modeline = false })
    end
  end,
})
