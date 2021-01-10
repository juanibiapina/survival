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
