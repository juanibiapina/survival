local function on_flood(pos, oldnode, newnode)
  minetest.add_item(pos, ItemStack("basic:torch 1"))

  -- Play flame-extinguish sound if liquid is not an 'igniter'
  local nodedef = minetest.registered_items[newnode.name]
  if not (nodedef and nodedef.groups and nodedef.groups.igniter and nodedef.groups.igniter > 0) then
    minetest.sound_play(
      "basic_cool_lava",
      {pos = pos, max_hear_distance = 16, gain = 0.1},
      true
    )
  end

  -- Remove the torch node
  return false
end

minetest.register_node("basic:torch", {
  description = basic.S("Torch"),
  drawtype = "mesh",
  mesh = "torch_floor.obj",
  inventory_image = "basic_torch_on_floor.png",
  wield_image = "basic_torch_on_floor.png",
  tiles = {{
        name = "basic_torch_on_floor_animated.png",
        animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
  }},
  paramtype = "light",
  paramtype2 = "wallmounted",
  sunlight_propagates = true,
  walkable = false,
  liquids_pointable = false,
  light_source = 12,
  groups = {choppy=2, dig_immediate=3, flammable=1, attached_node=1, torch=1},
  drop = "basic:torch",
  selection_box = {
    type = "wallmounted",
    wall_bottom = {-1/8, -1/2, -1/8, 1/8, 2/16, 1/8},
  },
  sounds = basic.node_sound_wood_defaults(),
  on_place = function(itemstack, placer, pointed_thing)
    local under = pointed_thing.under
    local node = minetest.get_node(under)
    local def = minetest.registered_nodes[node.name]
    if def and def.on_rightclick and
      not (placer and placer:is_player() and
      placer:get_player_control().sneak) then
      return def.on_rightclick(under, node, placer, itemstack,
        pointed_thing) or itemstack
    end

    local above = pointed_thing.above
    local wdir = minetest.dir_to_wallmounted(vector.subtract(under, above))
    local fakestack = itemstack
    if wdir == 0 then
      fakestack:set_name("basic:torch_ceiling")
    elseif wdir == 1 then
      fakestack:set_name("basic:torch")
    else
      fakestack:set_name("basic:torch_wall")
    end

    itemstack = minetest.item_place(fakestack, placer, pointed_thing, wdir)
    itemstack:set_name("basic:torch")

    return itemstack
  end,
  floodable = true,
  on_flood = on_flood,
  on_rotate = false
})

minetest.register_node("basic:torch_wall", {
  drawtype = "mesh",
  mesh = "torch_wall.obj",
  tiles = {{
        name = "basic_torch_on_floor_animated.png",
        animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
  }},
  paramtype = "light",
  paramtype2 = "wallmounted",
  sunlight_propagates = true,
  walkable = false,
  light_source = 12,
  groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
  drop = "basic:torch",
  selection_box = {
    type = "wallmounted",
    wall_side = {-1/2, -1/2, -1/8, -1/8, 1/8, 1/8},
  },
  sounds = basic.node_sound_wood_defaults(),
  floodable = true,
  on_flood = on_flood,
  on_rotate = false
})

minetest.register_node("basic:torch_ceiling", {
  drawtype = "mesh",
  mesh = "torch_ceiling.obj",
  tiles = {{
        name = "basic_torch_on_floor_animated.png",
        animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
  }},
  paramtype = "light",
  paramtype2 = "wallmounted",
  sunlight_propagates = true,
  walkable = false,
  light_source = 12,
  groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
  drop = "basic:torch",
  selection_box = {
    type = "wallmounted",
    wall_top = {-1/8, -1/16, -5/16, 1/8, 1/2, 1/8},
  },
  sounds = basic.node_sound_wood_defaults(),
  floodable = true,
  on_flood = on_flood,
  on_rotate = false
})

minetest.register_craft({
  output = "basic:torch 4",
  recipe = {
    {"basic:coal_lump"},
    {"group:stick"},
  }
})
