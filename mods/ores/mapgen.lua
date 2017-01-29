minetest.register_ore({
   ore_type       = "scatter",
   ore            = "ores:stone_with_copper",
   wherein        = "default:stone",
   clust_scarcity = 12 * 12 * 12,
   clust_num_ores = 4,
   clust_size     = 3,
   y_min          = -63,
   y_max          = -16,
})

minetest.register_ore({
   ore_type       = "scatter",
   ore            = "ores:stone_with_copper",
   wherein        = "default:stone",
   clust_scarcity = 9 * 9 * 9,
   clust_num_ores = 5,
   clust_size     = 3,
   y_min          = -31000,
   y_max          = -64,
})
