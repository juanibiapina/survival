minetest.register_node("basic:stone", {
  description = basic.S("Stone"),
  tiles = {"basic_stone.png"},
  groups = {cracky = 3, stone = 1},
  drop = "basic:cobble", -- TODO: drops, tools, cobblestone
  sounds = basic.node_sound_stone_defaults(),
})
