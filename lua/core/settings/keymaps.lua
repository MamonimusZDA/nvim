#! /usr/bin/env lua

local o = { noremap = true, silent = true }
local co = { noremap = true }
local to = { silent = true }

-- Shorten function name
local key = vim.keymap.set

--Remap space as leader key
key('', '<Space>', '<Nop>', o)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Normal --
-- Keep it centered when searching
key('n', 'n', 'nzzzv', o)
key('n', 'N', 'Nzzzv', o)
key('n', '*', '*zzzv', o)
key('n', '#', '#zzzv', o)
key('n', 'g*', 'g*zzzv', o)
key('n', 'g#', 'g#zzzv', o)

-- Keep it centered when move into the file
key('n', '<C-d>', '<C-d>zz', o)
key('n', '<C-u>', '<C-u>zz', o)

-- Perserve location when use "J" command
key('n', 'J', 'mzJ`z', o)

-- Clears the search highlighting
key('n', '<Backspace>', '<Cmd>nohlsearch<Cr>', o)

-- Toggle wrap line
key('n', '<S-Backspace>', function()
  vim.wo.wrap = not vim.wo.wrap
end, o)

-- Toggle spell checker
key('n', '<C-Backspace>', function()
  vim.wo.spell = not vim.wo.spell
end, o)

-- Create a new tab
key('n', '<C-w>t', '<Cmd>tabnew<Cr>', o)

-- Select paste text
key('n', 'gV', '`[v`]', o)

-- Insert --
-- Some emacs keyblindings moves
key('i', '<C-b>', '<Left>', o)
key('i', '<C-f>', '<Right>', o)
key('i', '<A-b>', '<C-Left>', o)
key('i', '<A-f>', '<C-Right>', o)
key('i', '<C-a>', '<Home>', o)
key('i', '<C-e>', '<End>', o)
key('i', '<A-p>', '<Up>', o)
key('i', '<A-n>', '<Down>', o)

-- Add undo break-points
key('i', ',', ',<c-g>u', o)
key('i', '.', '.<c-g>u', o)
key('i', ';', ';<c-g>u', o)

-- Visual --
-- Stay in indent mode
key('v', '<', '<gv^', o)
key('v', '>', '>gv^', o)

-- Paste over currently selected text without yanking it
key('v', 'p', '"_dP', o)

-- Terminal --
-- Change terminal to normal mode
key('t', '<C-\\>', '<C-\\><C-N>', to)

-- Command --
-- Some emacs keyblindings moves
key('c', '<C-b>', '<Left>', co)
key('c', '<C-f>', '<Right>', co)
key('c', '<A-b>', '<C-Left>', co)
key('c', '<A-f>', '<C-Right>', co)
key('c', '<C-a>', '<Home>', co)
key('c', '<C-e>', '<End>', co)
key('c', '<A-p>', '<Up>', co)
key('c', '<A-n>', '<Down>', co)

-- Access to command line history
key('c', '<C-l>', '<C-f>', co)
