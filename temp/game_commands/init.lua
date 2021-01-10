-- game_commands/init.lua

-- Load support for MT game translation.
local S = minetest.get_translator("game_commands")


minetest.register_chatcommand("killme", {
  description = S("Kill yourself to respawn"),
  func = function(name)
    local player = minetest.get_player_by_name(name)
    if player then
      if minetest.settings:get_bool("enable_damage") then
        player:set_hp(0)
        return true
      else
        return false, S("Damage is not enabled")
      end
    else
      -- Show error message if used when not logged in, eg: from IRC mod
      return false, S("You need to be online to be killed!")
    end
  end
})

minetest.register_chatcommand("biome", {
  description = S("Check current biome"),
  func = function(name)
    local player = minetest.get_player_by_name(name)
    local pos = player:get_pos()
    local biome_data = minetest.get_biome_data(pos)
    local biome_name = minetest.get_biome_name(biome_data.biome)

    return true, biome_name
  end
})
