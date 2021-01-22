local Approach = {}

local look_at = function(self, target)
  local pos = self.object:get_pos()
  local vec = {x = target.x - pos.x, z = target.z - pos.z}
  local yaw = (math.atan(vec.z / vec.x) + math.pi / 2)

  if target.x > pos.x then
    yaw = yaw + math.pi
  end

  self.object:set_yaw(yaw)
end

function Approach.run(self, dtime, collisioninfo)
  local selfpos = self.object:get_pos()
  local targetpos = self.target:get_pos()
  local distance = vector.distance(targetpos, selfpos)

  -- out of view range
  if distance > self.view_range then
    mobs.behaviors.activate(self, mobs.behaviors.Stand, dtime)
    return
  end

  -- out of attack range
  if distance > self.attack_range then
    look_at(self, self.target:get_pos())

    local dir = vector.direction(self.object:get_pos(), self.target:get_pos())
    dir.y = 0 -- remove vertical component otherwise the mob will fly or enter the ground
    dir = vector.normalize(dir)

    local desired_velocity = vector.multiply(dir, self.move_speed)

    local falling_speed = self.object:get_velocity().y
    dir.y = falling_speed

    self.object:set_velocity(dir)
    return
  end

  -- ready to attack
  mobs.behaviors.activate(self, mobs.behaviors.Attack, dtime)
end

function Approach.enter(self, dtime)
end

function Approach.exit(self, dtime)
end

mobs.behaviors.Approach = Approach
