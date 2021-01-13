local S = minetest.get_translator("mobs")

mobs = {}
mobs.S = S

local path = minetest.get_modpath("mobs")

local BaseMob = {
  on_step = function(self, dtime)
    --print("step" .. dtime)
  end,
}

local Zombie = {
  initial_properties = {
    physical = true,
    is_visible = true,
    visual = "mesh",
    mesh = "mobs_stone_monster.b3d",
    textures = {"mobs_dirt_monster.png"},
    visual_size = {x = 1, y = 1},
  }
}
setmetatable(Zombie, { __index = BaseMob })

minetest.register_entity("mobs:zombie", Zombie)


minetest.register_on_joinplayer(function(player)
    local pos = player:get_pos()

    pos.y = pos.y + 1

    minetest.add_entity(pos, "mobs:zombie")
end)
