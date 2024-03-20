#! /usr/bin/env lua

local M = {}

--- Find and delete n elements in a list
---@param list table
---@param elements table
---@return any
function M.findel(list, elements)
  for pos, value in ipairs(list) do
    for _, element in ipairs(elements) do
      if value == element then
        table.remove(list, pos)
        break
      end
    end
  end

  return list
end

return M
