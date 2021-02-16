local enabled = minetest.settings:get_bool("debug_mode")

if not enabled then
  return
end

minetest.register_on_joinplayer(function(player)
    local privs = minetest.get_player_privs(player:get_player_name())
    privs.fast = true
    privs.fly = true
    privs.give = true
    privs.home = true
    privs.interact = true
    privs.noclip = true
    privs.settime = true
    privs.zoom = true
    minetest.set_player_privs(player:get_player_name(), privs)
end)

minetest.register_chatcommand("biome", {
  description = "Print name of current biome",
  func = function(name)
    local player = minetest.get_player_by_name(name)
    local pos = player:get_pos()
    local biome_data = minetest.get_biome_data(pos)
    local biome_name = minetest.get_biome_name(biome_data.biome)

    return true, biome_name
  end
})

function debug.log(message)
  minetest.debug(message)
end

function debug.log_position(name, pos)
  minetest.debug(name .. " = {x = " .. pos.x .. ", y = " .. pos.y .. ", z = " .. pos.z .. "}")
end

function debug.log_table(name, t)
  minetest.debug(name .. " = {")
  for k, v in pairs(t) do
    minetest.debug(tostring(k) .. " = " .. tostring(v))
  end
  minetest.debug("}")
end

function debug.convert_schematic(path, name)
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
