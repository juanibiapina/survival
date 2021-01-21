local S = minetest.get_translator("mobs")

mobs = {}
mobs.S = S

local path = minetest.get_modpath("mobs")

local BaseMob = {
  on_step = function(self, dtime)
    if self.state == "stand" then
      self:look_for_target()
      return
    end

    if self.state == "approach" then
      local selfpos = self.object:get_pos()
      local targetpos = self.target:get_pos()
      local distance = vector.distance(targetpos, selfpos)

      -- out of view range
      if distance > self.view_range then
        self.state = "stand"
        self.object:set_velocity({x = 0, y = 0, z = 0})
        return
      end

      -- out of attack range
      if distance > self.attack_range then
        self:look_at(self.target:get_pos())

        dir = vector.direction(self.object:get_pos(), self.target:get_pos())
        dir.y = 0 -- remove vertical component otherwise the mob will fly or enter the ground
        dir = vector.normalize(dir)

        self.object:set_velocity(vector.multiply(dir, self.move_speed))
        return
      end

      -- ready to attack
      self.state = "attack"
      self.current_backswing = 1; -- reset backswing
      --print("attacking player: " .. self.target:get_player_name())
    end

    if self.state == "attack" then
      local selfpos = self.object:get_pos()
      local targetpos = self.target:get_pos()
      local distance = vector.distance(targetpos, selfpos)

      if distance > self.attack_range then
        self.state = "stand"
        self.object:set_velocity({x = 0, y = 0, z = 0})
        return
      end

      self.current_backswing = self.current_backswing - dtime;

      if self.current_backswing <= 0 then
        self.target:punch(self.object, 1.0, {
            full_punch_interval = 1.0, -- TODO: what is this?
            damage_groups = {fleshy = 1} -- TODO: what is this?
          }, nil)

        self.current_backswing = 1; --reset backswing
      end
    end
  end,

  look_for_target = function(self)
    local pos = self.object:get_pos()

    local objs = minetest.get_objects_inside_radius(pos, self.view_range)

    for n = 1, #objs do
      if objs[n]:is_player() then
        self.state = "approach"
        self.target = objs[n]
        --print("approaching player: " .. self.target:get_player_name())
        return
      end
    end

  end,

  look_at = function(self, target)
    local pos = self.object:get_pos()
    local vec = {x = target.x - pos.x, z = target.z - pos.z}
    local yaw = (math.atan(vec.z / vec.x) + math.pi / 2)

    if target.x > pos.x then
      yaw = yaw + math.pi
    end

    self.object:set_yaw(yaw)
  end,
}

local Zombie = {
  initial_properties = {
    physical = true,
    is_visible = true,
    visual = "mesh",
    mesh = "mobs_stone_monster.b3d",
    textures = {"mobs_dirt_monster.png"},
    visual_size = {x = 1, y = 1},
  },

  attack_range = 2,
  move_speed = 1,
  state = "stand",
  view_range = 5,
}
setmetatable(Zombie, { __index = BaseMob })

minetest.register_entity("mobs:zombie", Zombie)
