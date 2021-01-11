minetest.register_node("basic:stone", {
  description = basic.S("Stone"),
  tiles = {"basic_stone.png"},
  groups = {cracky = 3, stone = 1},
  drop = "basic:cobble", -- TODO: drops, tools, cobblestone
  sounds = basic.node_sound_stone_defaults(),
})

minetest.register_node("basic:cobble", {
  description = basic.S("Cobblestone"),
  tiles = {"basic_cobble.png"},
  is_ground_content = false,
  groups = {cracky = 3, stone = 2},
  sounds = basic.node_sound_stone_defaults(),
})

minetest.register_node("basic:mossycobble", {
  description = basic.S("Mossy Cobblestone"),
  tiles = {"basic_mossycobble.png"},
  is_ground_content = false,
  groups = {cracky = 3, stone = 1},
  sounds = basic.node_sound_stone_defaults(),
})

minetest.register_node("basic:dirt", {
  description = basic.S("Dirt"),
  tiles = {"basic_dirt.png"},
  groups = {crumbly = 3, soil = 1},
  sounds = basic.node_sound_dirt_defaults(),
})

minetest.register_node("basic:dirt_with_grass", {
  description = basic.S("Dirt with Grass"),
  tiles = {"basic_grass.png", "basic_dirt.png",
    {name = "basic_dirt.png^basic_grass_side.png",
      tileable_vertical = false}},
  groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
  drop = "default:dirt", -- TODO: drops, tools
  sounds = basic.node_sound_dirt_defaults({
    footstep = {name = "default_grass_footstep", gain = 0.25},
  }),
})

minetest.register_node("basic:sand", {
  description = basic.S("Sand"),
  tiles = {"basic_sand.png"},
  groups = {crumbly = 3, falling_node = 1, sand = 1},
  sounds = basic.node_sound_sand_defaults(),
})

