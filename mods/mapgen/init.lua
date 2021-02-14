minetest.register_alias("mapgen_stone", "basic:stone")
minetest.register_alias("mapgen_water_source", "basic:water_source")
minetest.register_alias("mapgen_river_water_source", "basic:river_water_source")


local path = minetest.get_modpath("mapgen")

dofile(path .. "/biomes/deciduous_forest.lua")
dofile(path .. "/ores.lua")

--debug.convert_schematic(path .. "/schematics/", "apple_tree")
