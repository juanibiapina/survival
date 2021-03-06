local IdleFly = {}

function IdleFly.run(self, dtime, collisioninfo)
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
end

function IdleFly.enter(self, dtime)
  self.object:set_velocity({x = 0, y = 0, z = 0})
end

function IdleFly.exit(self, dtime)
end

mobs.behaviors.IdleFly = IdleFly
