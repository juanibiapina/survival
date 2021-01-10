local S = minetest.get_translator("default")

basic = {}
basic.S = S

local path = minetest.get_modpath("basic")

dofile(path .. "/sounds.lua")

dofile(path .. "/stone.lua")
dofile(path .. "/water.lua")
