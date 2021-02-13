minetest.register_craft({
  output = "basic:plank 4",
  recipe = {
    {"basic:wood"},
  }
})

minetest.register_craft({
  output = "basic:stick 4",
  recipe = {
    {"group:wood"},
  }
})

local craft_ingreds = {
  wood = "group:wood",
  stone = "group:stone",
}

for name, mat in pairs(craft_ingreds) do
  minetest.register_craft({
    output = "basic:pick_".. name,
    recipe = {
      {mat, mat, mat},
      {"", "group:stick", ""},
      {"", "group:stick", ""}
    }
  })
end
