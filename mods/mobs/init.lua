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

    if self.state == "attack" then
    end
  end,

  look_for_target = function(self)
    local pos = self.object:get_pos()
    if not pos then return end

    local objs = minetest.get_objects_inside_radius(pos, 5)

    for n = 1, #objs do
      if objs[n]:is_player() then
        self.state = "attack"
        self.target = objs[n]
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
}
setmetatable(Zombie, { __index = BaseMob })

minetest.register_entity("mobs:zombie", Zombie)


minetest.register_on_joinplayer(function(player)
  local pos = player:get_pos()

  pos.y = pos.y + 1

  minetest.add_entity(pos, "mobs:zombie")
end)
