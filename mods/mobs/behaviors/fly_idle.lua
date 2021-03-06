local FlyIdle = {}

function FlyIdle.run(self, dtime, collisioninfo)
  -- get direction in radians
  local yaw = self.object:get_yaw()

  -- calculate new direction
  local new_yaw = yaw + dtime

  -- set new direction
  self.object:set_yaw(new_yaw)

  -- calculate movement direction
  local dir = { x = math.cos(new_yaw), z = math.sin(new_yaw), y = 0 }

  -- set velocity
  self.object:set_velocity(vector.multiply(dir, self.move_speed))

  -- check for player in view
  local objs = minetest.get_objects_inside_radius(self.object:get_pos(), self.view_range)
  for n = 1, #objs do
    if objs[n]:is_player() then -- first player, not necessarily closer
      self.target = objs[n]
      mobs.behaviors.activate(self, mobs.behaviors.FlyApproach, dtime)
      return
    end
  end
end

function FlyIdle.enter(self, dtime)
end

function FlyIdle.exit(self, dtime)
end

mobs.behaviors.FlyIdle = FlyIdle
