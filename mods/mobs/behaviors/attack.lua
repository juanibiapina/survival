local Attack = {}

function Attack.run(self, dtime)
  if self.current_backswing > 0 then
    self.current_backswing = self.current_backswing - dtime;
    return
  end

  local selfpos = self.object:get_pos()
  local targetpos = self.target:get_pos()
  local distance = vector.distance(targetpos, selfpos)

  if distance > self.attack_range then
    mobs.behaviors.activate(self, mobs.behaviors.Stand, dtime)
    return
  end

  if self.current_backswing <= 0 then
    self.target:punch(self.object, 1.0, {
        full_punch_interval = 1.0, -- TODO: what is this?
        damage_groups = {fleshy = 1} -- TODO: what is this?
      }, nil)

    self.current_backswing = self.backswing; --reset backswing
  end
end

function Attack.enter(self, dtime)
  self.object:set_velocity({x = 0, y = 0, z = 0})
end

function Attack.exit(self, dtime)
end

mobs.behaviors.Attack = Attack
