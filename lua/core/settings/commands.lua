#! /usr/bin/env lua

local cmd = vim.api.nvim_create_user_command

cmd('Q' , 'q!' , { nargs = 0 })
cmd('Qa', 'qa!', { nargs = 0 })
cmd('QA', 'qa!', { nargs = 0 })
cmd('X' , 'x!' , { nargs = '*' })
cmd('Xa', 'xa!', { nargs = '*' })
cmd('XA', 'xa!', { nargs = '*' })
