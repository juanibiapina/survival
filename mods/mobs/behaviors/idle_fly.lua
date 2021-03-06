local IdleFly = {}

function IdleFly.run(self, dtime, collisioninfo)
end

function IdleFly.enter(self, dtime)
  self.object:set_velocity({x = 0, y = 0, z = 0})
end

function IdleFly.exit(self, dtime)
end

mobs.behaviors.IdleFly = IdleFly
