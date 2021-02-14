minetest.register_biome({
  name = "deciduous_forest",
  node_top = "basic:dirt_with_grass",
  depth_top = 1,
  node_filler = "basic:dirt",
  depth_filler = 3,
  node_dungeon = "basic:cobble",
  node_dungeon_alt = "basic:mossycobble",
  -- node_dungeon_stair = "stairs:stair_cobble",
  y_max = 31000,
  y_min = 1,
  heat_point = 60,
  humidity_point = 68,
})

minetest.register_biome({
  name = "deciduous_forest_shore",
  node_top = "basic:dirt",
  depth_top = 1,
  node_filler = "basic:dirt",
  depth_filler = 3,
  node_dungeon = "basic:cobble",
  node_dungeon_alt = "basic:mossycobble",
  -- node_dungeon_stair = "stairs:stair_cobble",
  y_max = 0,
  y_min = -1,
  heat_point = 60,
  humidity_point = 68,
})

minetest.register_biome({
  name = "deciduous_forest_ocean",
  node_top = "basic:sand",
  depth_top = 1,
  node_filler = "basic:sand",
  depth_filler = 3,
  node_cave_liquid = "basic:water_source",
  node_dungeon = "basic:cobble",
  node_dungeon_alt = "basic:mossycobble",
  -- node_dungeon_stair = "stairs:stair_cobble",
  vertical_blend = 1,
  y_max = -2,
  y_min = -255,
  heat_point = 60,
  humidity_point = 68,
})
--
--minetest.register_biome({
--  name = "deciduous_forest_under",
--  node_cave_liquid = {"default:water_source", "default:lava_source"},
--  node_dungeon = "default:cobble",
--  node_dungeon_alt = "default:mossycobble",
--  node_dungeon_stair = "stairs:stair_cobble",
--  y_max = -256,
--  y_min = -31000,
--  heat_point = 60,
--  humidity_point = 68,
--})
--

minetest.register_decoration({
  name = "mapgen:tree",
  deco_type = "schematic",
  place_on = {"basic:dirt_with_grass"},
  sidelen = 16,
  noise_params = {
    offset = 0.012,
    scale = 0.015,
    spread = {x = 250, y = 250, z = 250},
    seed = 2,
    octaves = 3,
    persist = 0.66
  },
  biomes = {"deciduous_forest"},
  y_max = 31000,
  y_min = 1,
  schematic = basic.schematics.tree,
  flags = "place_center_x, place_center_z",
  rotation = "random",
})
