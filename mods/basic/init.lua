local S = minetest.get_translator("basic")

basic = {}
basic.S = S

local path = minetest.get_modpath("basic")

dofile(path .. "/sounds.lua")
dofile(path .. "/blocks.lua")
dofile(path .. "/liquids.lua")
