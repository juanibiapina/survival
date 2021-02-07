minetest.register_node("basic:leaves", {
  description = basic.S("Apple Tree Leaves"),
  drawtype = "allfaces_optional",
  waving = 1,
  tiles = {"basic_leaves.png"},
  special_tiles = {"basic_leaves_simple.png"},
  paramtype = "light",
  is_ground_content = false,
  groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
  sounds = basic.node_sound_leaves_defaults(),
})

minetest.register_node("basic:wood", {
  description = basic.S("Apple Tree Wood"),
  tiles = {"basic_wood_top.png", "basic_wood_top.png", "basic_wood.png"},
  paramtype2 = "facedir",
  is_ground_content = false,
  groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
  sounds = basic.node_sound_wood_defaults(),

  on_place = minetest.rotate_node
})

-- So I don't have to fix the schematics for now
minetest.register_alias("basic:apple", "basic:leaves")
