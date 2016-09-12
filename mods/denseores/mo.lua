-- Mithril, Tin, Silver. That's my pattern.

--[	Small Items	--]
--[	Finished!	--]

minetest.register_craftitem("denseores:small_mithril_lump", {
	description = "Small Mithrial Lump",
	inventory_image = "small_mithril_lump.png",
})

minetest.register_craftitem("denseores:small_tin_lump", {
	description = "Small Tin Lump",
	inventory_image = "small_tin_lump.png",
})

minetest.register_craftitem("denseores:small_silver_lump", {
	description = "Small Silver Lump",
	inventory_image = "small_silver_lump.png",
})

--[	Large Ore Nodes	--]
--[	Finished!	--]

minetest.register_node("denseores:large_mithril_ore", {
	description = "Heavy Mithril Ore",
	tiles ={"default_stone.png^large_mithril_ore.png"},
	groups = {cracky=3},
	drop = 'denseores:large_mithril_ore',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("denseores:large_tin_ore", {
	description = "Heavy Tin Ore",
	tiles ={"default_stone.png^large_tin_ore.png"},
	groups = {cracky=3},
	drop = 'denseores:large_tin_ore',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("denseores:large_silver_ore", {
	description = "Heavy Silver Ore",
	tiles ={"default_stone.png^large_silver_ore.png"},
	groups = {cracky=3},
	drop = 'denseores:large_silver_ore',
	sounds = default.node_sound_stone_defaults(),
})

--[	Small Ore Nodes	--]
--[	Finished!	--]

minetest.register_node("denseores:small_mithril_ore", {
	description = "Light Mithril Ore",
	tiles ={"default_stone.png^small_mithril_ore.png"},
	groups = {cracky=3},
	drop = 'denseores:small_mithril_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("denseores:small_tin_ore", {
	description = "Light Tin Ore",
	tiles ={"default_stone.png^small_tin_ore.png"},
	groups = {cracky=3},
	drop = 'denseores:small_tin_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("denseores:small_silver_ore", {
	description = "Light Silver Ore",
	tiles ={"default_stone.png^small_silver_ore.png"},
	groups = {cracky=3},
	drop = 'denseores:small_silver_lump',
	sounds = default.node_sound_stone_defaults(),
})

--[	Large Ore Defenitions	--]
--[	Finished!	--]

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "denseores:large_mithril_ore",
    wherein        = "moreores:mineral_mithril",
    clust_scarcity = 12,
    clust_num_ores = 2,
    clust_size     = 2,
    y_min     = -31000,
    y_max     = 64,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "denseores:large_tin_ore",
    wherein        = "moreores:mineral_tin",
    clust_scarcity = 12,
    clust_num_ores = 2,
    clust_size     = 2,
    y_min     = -31000,
    y_max     = 64,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "denseores:large_silver_ore",
    wherein        = "moreores:mineral_silver",
    clust_scarcity = 12,
    clust_num_ores = 2,
    clust_size     = 2,
    y_min     = -31000,
    y_max     = 64,
})

--[	Small Ore Defenitions	--]
--[	Finished!	--]

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "denseores:small_mithril_ore",
    wherein        = "moreores:mineral_mithril",
    clust_scarcity = 12,
    clust_num_ores = 2,
    clust_size     = 2,
    y_min     = -31000,
    y_max     = 64,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "denseores:small_tin_ore",
    wherein        = "moreores:mineral_tin",
    clust_scarcity = 12,
    clust_num_ores = 2,
    clust_size     = 2,
    y_min     = -31000,
    y_max     = 64,
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "denseores:small_silver_ore",
    wherein        = "moreores:mineral_silver",
    clust_scarcity = 12,
    clust_num_ores = 2,
    clust_size     = 2,
    y_min     = -31000,
    y_max     = 64,
})

--[	Crafting Recipies	--]
--[	From Large to Normal	--]

minetest.register_craft( {
	type = "shapeless",
	output = "moreores:mithril_lump 2", --mithril
	recipe = {
		"denseores:large_mithril_ore",
	}
})

minetest.register_craft( {
	type = "shapeless",
	output = "moreores:tin_lump 2", --tin
	recipe = {
		"denseores:large_tin_ore",
	}
})

minetest.register_craft( {
	type = "shapeless",
	output = "moreores:silver_lump 2", --silver
	recipe = {
		"denseores:large_silver_ore",
	}
})

--[	Crafting Recipies	--]
--[	From Small to Normal	--]

minetest.register_craft( {
	type = "shapeless",
	output = "moreores:mithril_lump 1", --mithril
	recipe = {
		"denseores:small_mithril_lump",
		"denseores:small_mithril_lump",
	}
})

minetest.register_craft( {
	type = "shapeless",
	output = "moreores:tin_lump 1", --tin
	recipe = {
		"denseores:small_tin_lump",
		"denseores:small_tin_lump",
	}
})

minetest.register_craft( {
	type = "shapeless",
	output = "moreores:silver_lump 1", --silver
	recipe = {
		"denseores:small_silver_lump",
		"denseores:small_silver_lump",
	}
})
