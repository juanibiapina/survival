local S = minetest.get_translator("mobs")

mobs = {}
mobs.S = S

local path = minetest.get_modpath("mobs")

-- load behaviors
dofile(path .. "/behaviors.lua")
dofile(path .. "/behaviors/stand.lua")
dofile(path .. "/behaviors/approach.lua")
dofile(path .. "/behaviors/attack.lua")

local BaseMob = {
  on_step = function(self, dtime)
    self.behavior.run(self, dtime)
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
  },

  -- mob attributes
  attack_range = 2,
  move_speed = 1,
  behavior = mobs.behaviors.Stand,
  view_range = 5,
  backswing = 1,

  -- temporary values
  current_backswing = 0,
}
setmetatable(Zombie, { __index = BaseMob })

minetest.register_entity("mobs:zombie", Zombie)
