local S = minetest.get_translator("mobs")

mobs = {}
mobs.S = S

local calc_distance = function(a, b)
  local x, y, z = a.x - b.x, a.y - b.y, a.z - b.z

  return math.sqrt(x * x + y * y + z * z)
end

local path = minetest.get_modpath("mobs")

local BaseMob = {
  on_step = function(self, dtime)
    if self.state == "stand" then
      self:look_for_target()
      return
    end

    if self.state == "attack" then
      local selfpos = self.object:get_pos()
      local targetpos = self.target:get_pos()
      local distance = calc_distance(targetpos, selfpos)

      if distance > self.view_range then
        self.state = "stand"

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
    if not pos then return end

    local objs = minetest.get_objects_inside_radius(pos, self.view_range)

    for n = 1, #objs do
      if objs[n]:is_player() then
        self.state = "attack"
        self.target = objs[n]
        self.current_backswing = 1; -- reset backswing
        --print("attacking player: " .. self.target:get_player_name())
        return
      end
    end

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

  state = "stand",
  view_range = 5,
}
setmetatable(Zombie, { __index = BaseMob })

minetest.register_entity("mobs:zombie", Zombie)
