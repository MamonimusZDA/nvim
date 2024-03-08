#! /usr/bin/env lua

for _, file_name in pairs({
  'disablFn',
  'options',
  'keymaps',
  'commands',
  'autocmds',
}) do
  require('core.settings.' .. file_name)
end
