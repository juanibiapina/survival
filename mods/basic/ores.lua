minetest.register_craftitem("basic:coal_lump", {
  description = basic.S("Coal Lump"),
  inventory_image = "basic_coal_lump.png",
  groups = {coal = 1, flammable = 1}
})

minetest.register_node("basic:stone_with_coal", {
  description = basic.S("Coal Ore"),
  tiles = {"basic_stone.png^basic_mineral_coal.png"},
  groups = {cracky = 3},
  drop = "basic:coal_lump",
  sounds = basic.node_sound_stone_defaults(),
})
