tools = {}

function tools.convert_schematic(path, name)
  local schematic = minetest.read_schematic(path .. "/" .. name .. ".mts", {})

  if not schematic then
    debug.log("Schematic not found")
  end

  local str = minetest.serialize_schematic(schematic, "lua", {lua_use_comments = true, lua_num_indent_spaces = 2})
  local file = io.open(path .. "/" .. name .. ".lua", "w")

  if file and str then
    file:write(str)
    file:flush()
    file:close()

    debug.log("Exported")
  else
    debug.log("Failed to export")
  end
end
