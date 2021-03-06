local flying_cube = {
  initial_properties = {
    physical = true,

    is_visible = true,
    visual = "cube",
    collisionbox = {-0.5, 0.0, -0.5, 0.5, 1.0, 0.5},

    textures = {"basic_red.png", "basic_red.png", "basic_red.png", "basic_red.png", "basic_red.png", "basic_red.png"},
    visual_size = {x = 1, y = 1},

    stepheight = 1.1,

    makes_footstep_sound = false,
  },

  -- mob attributes
  attack_range = 2,
  move_speed = 1,
  behavior = mobs.behaviors.IdleFly,
  view_range = 50,
  backswing = 1,

  -- functions
  on_activate = function(self, staticdata, dtime)
  end,

  on_step = function(self, dtime, collisioninfo)
    self.behavior.run(self, dtime, collisioninfo)
  end,
}

-- spawn flying cubes
minetest.register_abm({
  label = "spawn flying_cube",
  nodenames = "air",
  interval = 10,
  chance = math.max(1, 16 * 16 * 16 * 30),
  catch_up = false,

  action = function(pos, node, active_object_count, active_object_count_wider)
    -- only spawn at night
    if mobs.helpers.is_day() then
      return
    end

    -- check if spawn space is empty
    local entity = minetest.registered_entities["mobs:flying_cube"]
    local height = math.max(1, math.ceil((entity.initial_properties.collisionbox[5] or 0.25) - (entity.initial_properties.collisionbox[2] or -0.25) - 1)) -- TODO where are these numbers coming from?
    for n = 0, height do
      local pos2 = {x = pos.x, y = pos.y + n, z = pos.z}

      if minetest.registered_nodes[mobs.helpers.get_node(pos2, "air").name].walkable == true then
        return
      end
    end

    --debug.log_position("spawned at", pos)
    minetest.add_entity(pos, "mobs:flying_cube")
  end
})

minetest.register_entity("mobs:flying_cube", flying_cube)
