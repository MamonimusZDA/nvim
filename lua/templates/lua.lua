local utils = require('new-file-template.utils')

local function plugin_source_template(_, _)
  return [[
#! /usr/bin/env lua

return {
  |cursor|
}
  ]]
end

local function plugin_settings_template(_, _)
  return [[
#! /usr/bin/env lua

local M = {}

local status_ok, |cursor| = pcall(require, '|cursor|')
if not status_ok then
  return
end

function M.setup()
  |cursor|
end

return M
  ]]
end

local function base_template(_, _)
  return [[
#! /usr/bin/env lua

|cursor|
  ]]
end

--- @param opts table
---   A table containing the following fields:
---   - `full_path` (string): The full path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `relative_path` (string): The relative path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `filename` (string): The filename of the new file, e.g., "init.lua".
return function(opts)
  local template = {
    { pattern = 'lua/plugins/sources/.*', content = plugin_source_template },
    { pattern = 'lua/plugins/settings/.*', content = plugin_settings_template },
    { pattern = '.*', content = base_template },
  }

  return utils.find_entry(template, opts)
end
