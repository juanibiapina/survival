mobs = {}

local S = minetest.get_translator("mobs")
mobs.S = S

local path = minetest.get_modpath("mobs")

dofile(path .. "/helpers.lua")

dofile(path .. "/behaviors.lua")
dofile(path .. "/behaviors/stand.lua")
dofile(path .. "/behaviors/approach.lua")
dofile(path .. "/behaviors/attack.lua")

mobs.BaseMob = {
  on_activate = function(self, staticdata, dtime)
    self.object:set_acceleration({x = 0, y = -10, z = 0})
  end,

  on_step = function(self, dtime, collisioninfo)
    self.behavior.run(self, dtime, collisioninfo)
  end,
}

dofile(path .. "/mobs/dirt_monster.lua")
dofile(path .. "/mobs/flying_cube.lua")
