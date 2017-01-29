minetest.register_node("ores:stone_with_copper", {
	description = "Copper Ore",
	tiles = {"default_stone.png^default_mineral_copper.png"},
	groups = {cracky=2},
   drop = {
		max_items = 2,
		items = {
			{
			items = {'ores:copper_lump'},
			rarity = 10,
         },
         {
			items = {'ores:copper_lump'},
         },
		},
	},
	sounds = default.node_sound_stone_defaults(),
})
