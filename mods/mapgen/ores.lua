minetest.register_ore({
  ore_type       = "scatter",
  ore            = "basic:stone_with_coal",
  wherein        = "basic:stone",
  clust_scarcity = 8 * 8 * 8,
  clust_num_ores = 8,
  clust_size     = 3,
  y_max          = 31000,
  y_min          = -127,
})

minetest.register_ore({
  ore_type       = "scatter",
  ore            = "basic:stone_with_coal",
  wherein        = "basic:stone",
  clust_scarcity = 12 * 12 * 12,
  clust_num_ores = 30,
  clust_size     = 5,
  y_max          = -128,
  y_min          = -31000,
})
