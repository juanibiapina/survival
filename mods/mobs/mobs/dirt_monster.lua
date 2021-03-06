local dirt_monster = {
  initial_properties = {
    physical = true,

    is_visible = true,
    visual = "mesh",
    mesh = "mobs_stone_monster.b3d",
    collisionbox = {-0.4, -1, -0.4, 0.4, 0.8, 0.4},

    textures = {"mobs_dirt_monster.png"},
    visual_size = {x = 1, y = 1},

    stepheight = 1.1,

    makes_footstep_sound = true,
  },

  -- mob attributes
  behavior = mobs.behaviors.Stand,
  attack_range = 2,
  backswing = 1,
  move_speed = 1,
  view_range = 50,

  -- animation values
  animation = {
    speed = 15,
    stand = {
      start = 0,
      ende = 14,
    },
    walk = {
      start = 15,
      ende = 38,
    },
    chase = {
      start = 40,
      ende = 63,
    },
  },

  -- temporary values
  current_backswing = 0, -- TODO: for attack behavior

  -- functions
  on_activate = function(self, staticdata, dtime)
    self.object:set_acceleration({x = 0, y = -10, z = 0})
  end,

  on_step = function(self, dtime, collisioninfo)
    self.behavior.run(self, dtime, collisioninfo)
  end,
}

minetest.register_entity("mobs:dirt_monster", dirt_monster)

-- spawn dirt monsters
minetest.register_abm({
  label = "spawn dirt_monster",
  nodenames = "group:soil",
  interval = 10,
  chance = math.max(1, 16 * 16 *16),
  catch_up = false,

  action = function(pos, node, active_object_count, active_object_count_wider)
    -- only spawn at night
    if mobs.helpers.is_day() then
      return
    end

    -- spawn above node
    pos.y = pos.y + 1

    -- check if spawn space is empty
    local entity = minetest.registered_entities["mobs:dirt_monster"]
    local height = math.max(1, math.ceil((entity.initial_properties.collisionbox[5] or 0.25) - (entity.initial_properties.collisionbox[2] or -0.25) - 1)) -- TODO where are these numbers coming from?
    for n = 0, height do
      local pos2 = {x = pos.x, y = pos.y + n, z = pos.z}

      if minetest.registered_nodes[mobs.helpers.get_node(pos2, "air").name].walkable == true then
        return
      end
    end

    --debug.log_position("spawned at", pos)
    minetest.add_entity(pos, "mobs:dirt_monster")
  end
})

minetest.register_entity("mobs:dirt_monster", dirt_monster)
