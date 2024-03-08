#! /usr/bin/env lua

local o = vim.opt

o.mouse = 'a'

o.number = true
o.relativenumber = true
o.numberwidth = 4

o.equalalways = true
o.eadirection = 'both'
o.splitbelow = true
o.splitright = true

o.hlsearch = true
o.ignorecase = true
o.incsearch = true
o.smartcase = true

o.wrap = true
o.linebreak = true
o.breakindent = true

o.termguicolors = true
o.cursorline = true
o.signcolumn = 'yes'

o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.smartindent = true
o.autoindent = true
o.preserveindent = true

o.scrolloff = 3
o.sidescrolloff = 3
o.showmode = false
o.laststatus = 3
o.showtabline = 2

o.hidden = true
o.lazyredraw = false
o.synmaxcol = 240
o.redrawtime = 240

o.backup = false
o.swapfile = false
o.undofile = true
o.writebackup = false
o.fileencoding = 'utf-8'
o.undodir = { os.getenv('HOME') .. '/.cache/nvim-undodir' }

o.conceallevel = 2
o.pumheight = 5
o.timeout = false
o.timeoutlen = 1000
o.updatetime = 240
o.whichwrap = 'bs<>[]hl'
o.completeopt = {
  'menuone',
  'noselect'
}

o.fillchars = { eob = ' ' }
o.shortmess = 'stTWAIFS'
o.iskeyword:append '-'
o.isfname:append("@-@")
o.formatoptions:remove({ 'c', 'r', 'o' })
o.runtimepath:remove('/usr/share/vim/vimfiles')

o.spell = false
o.spelllang = { 'en', 'es' }
