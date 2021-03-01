-- swords

minetest.register_tool("basic:sword_wood", {
  description = basic.S("Wooden Sword"),
  inventory_image = "basic_tool_sword_wood.png",
  tool_capabilities = {
    full_punch_interval = 1,
    max_drop_level=0,
    groupcaps={
      snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
    },
    damage_groups = {fleshy=2},
  },
  sound = {breaks = "basic_tool_breaks"},
  groups = {sword = 1, flammable = 2}
})

minetest.register_tool("basic:sword_stone", {
  description = basic.S("Stone Sword"),
  inventory_image = "basic_tool_sword_stone.png",
  tool_capabilities = {
    full_punch_interval = 1.2,
    max_drop_level=0,
    groupcaps={
      snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
    },
    damage_groups = {fleshy=4},
  },
  sound = {breaks = "basic_tool_breaks"},
  groups = {sword = 1}
})
