function basic.node_sound_defaults(table)
  table = table or {}
  table.footstep = table.footstep or
      {name = "", gain = 1.0}
  table.dug = table.dug or
      {name = "default_dug_node", gain = 0.25}
  table.place = table.place or
      {name = "default_place_node_hard", gain = 1.0}
  return table
end

function basic.node_sound_stone_defaults(table)
  table = table or {}
  table.footstep = table.footstep or
      {name = "default_hard_footstep", gain = 0.3}
  table.dug = table.dug or
      {name = "default_hard_footstep", gain = 1.0}
  basic.node_sound_defaults(table)
  return table
end

function basic.node_sound_water_defaults(table)
  table = table or {}
  table.footstep = table.footstep or
      {name = "default_water_footstep", gain = 0.2}
  basic.node_sound_defaults(table)
  return table
end
