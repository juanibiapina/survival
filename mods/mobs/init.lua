mobs = {}

local S = minetest.get_translator("mobs")
mobs.S = S

local path = minetest.get_modpath("mobs")

dofile(path .. "/helpers.lua")

dofile(path .. "/behaviors.lua")

-- dirt monster
dofile(path .. "/behaviors/stand.lua")
dofile(path .. "/behaviors/approach.lua")
dofile(path .. "/behaviors/attack.lua")
dofile(path .. "/mobs/dirt_monster.lua")

-- flying cube
dofile(path .. "/behaviors/idle_fly.lua")
dofile(path .. "/behaviors/fly_approach.lua")
dofile(path .. "/mobs/flying_cube.lua")
