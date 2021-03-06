local FlyApproach = {}

local look_at = function(self, target_pos)
  local pos = self.object:get_pos()

  local dir = vector.direction(pos, target_pos)
  local r = vector.dir_to_rotation(dir)

  self.object:set_rotation(r)
end

local move_towards = function(self, target_pos)
  local dir = vector.direction(self.object:get_pos(), target_pos)
  dir = vector.normalize(dir)

  local desired_velocity = vector.multiply(dir, self.move_speed)

  self.object:set_velocity(dir)
end

function FlyApproach.run(self, dtime, collisioninfo)
  local selfpos = self.object:get_pos()
  local targetpos = self.target:get_pos()
  local distance = vector.distance(targetpos, selfpos)

  -- out of view range
  if distance > self.view_range then
    mobs.behaviors.activate(self, mobs.behaviors.IdleFly, dtime)
    return
  end

  -- out of attack range
  if distance > self.attack_range then
    look_at(self, targetpos)
    move_towards(self, targetpos)
    return
  end

  -- ready to attack
  --mobs.behaviors.activate(self, mobs.behaviors.FlyAttack, dtime)
end

function FlyApproach.enter(self, dtime)
end

function FlyApproach.exit(self, dtime)
end

mobs.behaviors.FlyApproach = FlyApproach
