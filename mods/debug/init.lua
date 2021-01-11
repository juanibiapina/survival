local enabled = minetest.settings:get_bool("debug_mode")

if not enabled then
  return
end

minetest.register_on_joinplayer(function(player)
    local privs = minetest.get_player_privs(player:get_player_name())
    privs.interact = true
    privs.zoom = true
    privs.fly = true
    privs.fast = true
    privs.noclip = true
    privs.home = true
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
