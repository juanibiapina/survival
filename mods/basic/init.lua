local S = minetest.get_translator("basic")

basic = {}
basic.S = S

local path = minetest.get_modpath("basic")

dofile(path .. "/sounds.lua")
dofile(path .. "/blocks.lua")
dofile(path .. "/ores.lua")
dofile(path .. "/vegetation.lua")
dofile(path .. "/liquids.lua")
dofile(path .. "/schematics.lua")
dofile(path .. "/tools.lua")
dofile(path .. "/weapons.lua")
dofile(path .. "/materials.lua")
dofile(path .. "/torch.lua")
dofile(path .. "/crafting.lua")
