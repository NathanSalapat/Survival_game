local function coins(pos)
  	minetest.add_particlespawner(50, 0.4,
		pos, pos,
		{x=2, y=0.2, z=2}, {x=-2, y=2, z=-2},
		{x=0, y=-6, z=0}, {x=0, y=-10, z=0},
		0.5, 2,
		0.2, 5,
		true, "mytreasure_coin.png")
end

minetest.register_node("mytreasure:buried1",{
	description = "Buried Treasure 1",
	drawtype = "mesh",
	mesh = "mytreasure_chest.obj",
	tiles = {"mytreasure_cheststone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 2,
	visual_scale = 0.5,
	groups = {cracky = 2, choppy=2, not_in_creative_inventory=1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
		}
	},
	drop = {
		max_items = 3,
		items = {
		{
		items = {"default:diamond"},
		rarity = 30, 
		},
		{
		items = {"default:mese_crystal"},
		rarity = 1,
		},
		{
		items = {"default:gold_lump"},
		rarity = 3,
		},
		{
		items = {"default:goldblock"},
		rarity = 30,
		},
		{
		items = {"default:wood 10"},
		rarity = 1,
		},
		{
		items = {"default:pick_diamond"},
		rarity = 25,
		},
		{
		items = {"default:pick_steel"},
		rarity = 10,
		},
		{
		items = {"default:chest_locked"},
		rarity = 15,
		},
		{
		items = {"default:coalblock"},
		rarity = 20,
		},
		{
		items = {"default:sword_diamond"},
		rarity = 25,
		},
		{
		items = {"wool:white 10"},
		rarity = 3,
		},
		{
		items = {"default:tree 10"},
		rarity = 3,
		},
		{
		items = {"default:papyrus 10"},
		rarity = 3,
		},
		{
		items = {"default:copper_lump 10"},
		rarity = 8,
		},

		},
	},
on_destruct = coins,

})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mytreasure:buried1",
	wherein        = "default:stone",
	clust_scarcity = 20*20*20,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min     = -31000,
	y_max     = -150,
})

minetest.register_node("mytreasure:buried2",{
	description = "Buried Treasure 2",
	drawtype = "mesh",
	mesh = "mytreasure_chest.obj",
	tiles = {"mytreasure_cheststone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 4,
	visual_scale = 0.75,
	groups = {cracky = 2, choppy=2, not_in_creative_inventory=1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.375, -0.375, 0.375, 0.375, 0.375},
		}
	},
	drop = {
		max_items = 5,
		items = {
		{
		items = {"default:diamond 2"},
		rarity = 30, 
		},
		{
		items = {"default:mese_crystal 2"},
		rarity = 1,
		},
		{
		items = {"default:gold_lump 2"},
		rarity = 3,
		},
		{
		items = {"default:goldblock 2"},
		rarity = 30,
		},
		{
		items = {"default:wood 10"},
		rarity = 1,
		},
		{
		items = {"default:pick_diamond 2"},
		rarity = 25,
		},
		{
		items = {"default:pick_steel 2"},
		rarity = 10,
		},
		{
		items = {"default:chest_locked 2"},
		rarity = 15,
		},
		{
		items = {"default:coalblock 5"},
		rarity = 20,
		},
		{
		items = {"default:sword_diamond 2"},
		rarity = 25,
		},
		{
		items = {"wool:white 10"},
		rarity = 3,
		},
		{
		items = {"default:tree 25"},
		rarity = 3,
		},
		{
		items = {"default:papyrus 20"},
		rarity = 3,
		},
		{
		items = {"default:copper_lump 25"},
		rarity = 8,
		},

		},
	},
on_destruct = coins,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mytreasure:buried2",
	wherein        = "default:stone",
	clust_scarcity = 40*40*40,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min     = -31000,
	y_max     = -150,
})

minetest.register_node("mytreasure:buried3",{
	description = "Buried Treasure 3",
	drawtype = "mesh",
	mesh = "mytreasure_chest.obj",
	tiles = {"mytreasure_cheststone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 6,
	visual_scale = 1,
	groups = {cracky = 2, choppy=2, not_in_creative_inventory=1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	},
	drop = {
		max_items = 10,
		items = {
		{
		items = {"default:diamond 10"},
		rarity = 30, 
		},
		{
		items = {"default:mese_crystal 10"},
		rarity = 1,
		},
		{
		items = {"default:gold_lump 10"},
		rarity = 3,
		},
		{
		items = {"default:goldblock 10"},
		rarity = 30,
		},
		{
		items = {"default:wood 20"},
		rarity = 1,
		},
		{
		items = {"default:pick_diamond 2"},
		rarity = 25,
		},
		{
		items = {"default:pick_steel 2"},
		rarity = 10,
		},
		{
		items = {"default:chest_locked 3"},
		rarity = 15,
		},
		{
		items = {"default:coalblock 10"},
		rarity = 20,
		},
		{
		items = {"default:sword_diamond 2"},
		rarity = 25,
		},
		{
		items = {"wool:white 50"},
		rarity = 3,
		},
		{
		items = {"default:tree 99"},
		rarity = 3,
		},
		{
		items = {"default:papyrus 30"},
		rarity = 3,
		},
		{
		items = {"default:copper_lump 99"},
		rarity = 25,
		},

		},
	},
on_destruct = coins,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mytreasure:buried3",
	wherein        = "default:stone",
	clust_scarcity = 80*80*80,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min     = -31000,
	y_max     = -150,
})
