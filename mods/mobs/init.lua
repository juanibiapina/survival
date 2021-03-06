mobs = {}

local S = minetest.get_translator("mobs")
mobs.S = S

local path = minetest.get_modpath("mobs")

dofile(path .. "/helpers.lua")

dofile(path .. "/behaviors.lua")
dofile(path .. "/behaviors/stand.lua")
dofile(path .. "/behaviors/approach.lua")
dofile(path .. "/behaviors/attack.lua")

dofile(path .. "/mobs/dirt_monster.lua")
dofile(path .. "/mobs/flying_cube.lua")
