minetest.register_node("basic:plank", {
  description = basic.S("Wood Planks"),
  paramtype2 = "facedir",
  place_param2 = 0,
  tiles = {"basic_plank.png"},
  is_ground_content = false,
  groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
  sounds = basic.node_sound_wood_defaults(),
})

minetest.register_craftitem("basic:stick", {
  description = basic.S("Stick"),
  inventory_image = "basic_stick.png",
  groups = {stick = 1, flammable = 2},
})
