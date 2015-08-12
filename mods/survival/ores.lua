minetest.register_ore({
    ore_type       = 'sheet',
    ore            = 'survival:stone_with_salt',
    wherein        = 'default:stone',
    clust_size     = 6,
    height_min     = -3100,
    height_max     = 200,
    noise_params   = {offset=0, scale=7, spread={x=250, y=250, z=250}, seed=23, octaves=6, persist=0.70} 
})
