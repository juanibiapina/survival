function basic.node_sound_defaults(table)
  table = table or {}
  table.footstep = table.footstep or
      {name = "", gain = 1.0}
  table.dug = table.dug or
      {name = "basic_dug_node", gain = 0.25}
  table.place = table.place or
      {name = "basic_place_node_hard", gain = 1.0}
  return table
end

function basic.node_sound_stone_defaults(table)
  table = table or {}
  table.footstep = table.footstep or
      {name = "basic_hard_footstep", gain = 0.3}
  table.dug = table.dug or
      {name = "basic_hard_footstep", gain = 1.0}
  basic.node_sound_defaults(table)
  return table
end

function basic.node_sound_water_defaults(table)
  table = table or {}
  table.footstep = table.footstep or
      {name = "basic_water_footstep", gain = 0.2}
  basic.node_sound_defaults(table)
  return table
end

function basic.node_sound_dirt_defaults(table)
  table = table or {}
  table.footstep = table.footstep or
      {name = "basic_dirt_footstep", gain = 0.4}
  table.dug = table.dug or
      {name = "basic_dirt_footstep", gain = 1.0}
  table.place = table.place or
      {name = "basic_place_node", gain = 1.0}
  basic.node_sound_defaults(table)
  return table
end

function basic.node_sound_sand_defaults(table)
  table = table or {}
  table.footstep = table.footstep or
      {name = "basic_sand_footstep", gain = 0.12}
  table.dug = table.dug or
      {name = "basic_sand_footstep", gain = 0.24}
  table.place = table.place or
      {name = "basic_place_node", gain = 1.0}
  basic.node_sound_defaults(table)
  return table
end

function basic.node_sound_leaves_defaults(table)
  table = table or {}
  table.footstep = table.footstep or
      {name = "basic_grass_footstep", gain = 0.45}
  table.dug = table.dug or
      {name = "basic_grass_footstep", gain = 0.7}
  table.place = table.place or
      {name = "basic_place_node", gain = 1.0}
  basic.node_sound_defaults(table)
  return table
end

function basic.node_sound_wood_defaults(table)
  table = table or {}
  table.footstep = table.footstep or
      {name = "basic_wood_footstep", gain = 0.3}
  table.dug = table.dug or
      {name = "basic_wood_footstep", gain = 1.0}
  basic.node_sound_defaults(table)
  return table
end

