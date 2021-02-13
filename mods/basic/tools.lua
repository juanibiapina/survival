-- hand
minetest.register_item(":", {
  type = "none",
  wield_image = "wieldhand.png",
  wield_scale = {x=1,y=1,z=2.5},
  tool_capabilities = {
    full_punch_interval = 0.9,
    max_drop_level = 0,
    groupcaps = {
      crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
      snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
      oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
    },
    damage_groups = {fleshy=1},
  }
})

-- picks

minetest.register_tool("basic:pick_wood", {
  description = basic.S("Wooden Pickaxe"),
  inventory_image = "basic_tool_pick_wood.png",
  tool_capabilities = {
    full_punch_interval = 1.2,
    max_drop_level=0,
    groupcaps={
      cracky = {times={[3]=1.60}, uses=10, maxlevel=1},
    },
    damage_groups = {fleshy=2},
  },
  sound = {breaks = "default_tool_breaks"},
  groups = {pickaxe = 1, flammable = 2}
})
