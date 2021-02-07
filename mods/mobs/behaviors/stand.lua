local Stand = {}

function Stand.run(self, dtime, collisioninfo)
  local pos = self.object:get_pos()

  local objs = minetest.get_objects_inside_radius(pos, self.view_range)

  for n = 1, #objs do
    if objs[n]:is_player() then -- first player, not necessarily closer
      self.target = objs[n]
      mobs.behaviors.activate(self, mobs.behaviors.Approach, dtime)
      return
    end
  end
end

function Stand.enter(self, dtime)
  self.object:set_animation(
    { x = self.animation.stand.start, y = self.animation.stand.ende },
    self.animation.speed,
    0,
    true
  )
  self.object:set_velocity({x = 0, y = 0, z = 0})
end

function Stand.exit(self, dtime)
end

mobs.behaviors.Stand = Stand
