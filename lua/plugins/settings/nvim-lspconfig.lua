#! /usr/bin/env lua
---@diagnostic disable: redefined-local

local M = {}

local status_ok, tbuiltin = pcall(require, 'telescope.builtin')
if not status_ok then
  return
end

local status_ok, actions_preview = pcall(require, 'actions-preview')
if not status_ok then
  return
end

local status_ok, trouble = pcall(require, 'trouble')
if not status_ok then
  return
end

local status_ok, conform = pcall(require, 'conform')
if not status_ok then
  return
end

local status_ok, lint = pcall(require, 'lint')
if not status_ok then
  return
end

local function lsp_keymap(bufnr)
  local key = vim.keymap.set

  local opts = { noremap = true, silent = true, buffer = bufnr }
  local trblOpts = { skip_groups = true, jump = true }

  key('n', 'gD', vim.lsp.buf.declaration, opts)
  key('n', 'gd', function()
    tbuiltin.lsp_definitions()
  end, opts)
  key('n', 'gi', function()
    tbuiltin.lsp_implementations()
  end, opts)
  key('n', 'gr', function()
    tbuiltin.lsp_references()
  end, opts)

  key('n', 'K', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
      vim.lsp.buf.hover()
    end
  end, opts)

  key({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, opts)
  key({ 'n', 'v' }, '<leader>la', function()
    actions_preview.code_actions()
  end, opts)
  key({ 'n', 'v' }, '<leader>lf', function()
    conform.format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    })
  end, opts)

  key('n', '<leader>ld', function()
    tbuiltin.lsp_type_definitions()
  end, opts)
  key('n', '<leader>ll', function()
    lint.try_lint()
  end, opts)
  key('n', '<leader>lr', vim.lsp.buf.rename, opts)

  key('n', '<leader>df', vim.diagnostic.open_float, opts)

  key('n', '<leader>dd', function()
    trouble.toggle('document_diagnostics')
  end, opts)
  key('n', '<leader>dw', function()
    trouble.toggle('workspace_diagnostics')
  end, opts)
  key('n', '<leader>dl', function()
    trouble.toggle('loclist')
  end, opts)
  key('n', '<leader>dq', function()
    trouble.toggle('quickfix')
  end, opts)

  key('n', ']d', function()
    trouble.next(trblOpts)
  end, opts)
  key('n', '[d', function()
    trouble.previous(trblOpts)
  end, opts)
  key('n', '[D', function()
    trouble.first(trblOpts)
  end, opts)
  key('n', ']D', function()
    trouble.last(trblOpts)
  end, opts)
end

M.on_attach = function(client, bufnr)
  lsp_keymap(bufnr)

  if client.supports_method('textDocument/inlayHint') then
    vim.lsp.inlay_hint.enable(bufnr, true)
  end
end

M.toggle_inlay_hints = function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
end

M.capabilities = function()
  local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
  if not status_ok then
    return cmp_nvim_lsp.default_capabilities()
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    },
  }
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  return capabilities
end

function M.setup()
  local status_ok, lspconfig = pcall(require, 'lspconfig')
  if not status_ok then
    return
  end

  local status_ok, icons = pcall(require, 'misc.icons')
  if not status_ok then
    return
  end

  local servers = {
    'lua_ls',
    'jsonls',
  }

  vim.diagnostic.config({
    signs = {
      active = true,
      values = {
        { name = 'DiagnosticSignError', text = icons.diagnostics.Error },
        { name = 'DiagnosticSignWarn', text = icons.diagnostics.Warn },
        { name = 'DiagnosticSignHint', text = icons.diagnostics.Hint },
        { name = 'DiagnosticSignInfo', text = icons.diagnostics.Info },
      },
    },
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  })

  ---@diagnostic disable-next-line: param-type-mismatch
  for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), 'signs', 'values') or {}) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
  require('lspconfig.ui.windows').default_options.border = 'rounded'

  for _, server in pairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.capabilities(),
    }

    local require_ok, settings = pcall(require, 'misc.lspsettings' .. server)
    if require_ok then
      opts = vim.tbl_deep_extend('force', settings, opts)
    end

    if server == 'lua_ls' then
      require('neodev').setup({})
    end

    lspconfig[server].setup(opts)
  end

  local status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
  if not status_ok then
    return
  end

  mason_lspconfig.setup({
    ensure_installed = servers,
  })

  local status_ok, mason_tool_installer = pcall(require, 'mason-tool-installer')
  if not status_ok then
    return
  end

  mason_tool_installer.setup({
    ensure_installed = {
      -- formatter
      'isort',
      'stylua',
      'black',
      -- linter
      'pylint',
    },
    auto_update = true,
  })
end

return M
