minetest.register_craft({
		output = 'farming:cotton 1',
		recipe = {
			{'default:grass_1', 'default:grass_1', 'default:grass_1'},
			{'default:grass_1', 'default:grass_1', 'default:grass_1'},
			{'default:grass_1', 'default:grass_1', 'default:grass_1'},
			}
})

minetest.register_craft({
		output = 'survival:barrel 1',
		recipe = {
			{'group:wood', 'default:tree', 'group:wood'},
			{'group:wood', '', 'group:wood'},
			{'group:wood', 'default:tree', 'group:wood'},
			}
})

minetest.register_craft({
		type = 'shapeless',
		output = 'default:stick 9',
		recipe = {'survival:barrel'}
})

minetest.register_craft({
		output = 'survival:machete_wood 1',
		recipe = {
			{'', '', 'group:wood'},
			{'', 'group:wood', ''},
			{'group:stick', '', ''},
		}
})

minetest.register_craft({
		output = 'survival:machete_steel 1',
		recipe = {
			{'', '', 'default:steel_ingot'},
			{'', 'default:steel_ingot', ''},
			{'group:stick', '', ''},
		}
})

minetest.register_craft({
		output = 'survival:machete_bronze 1',
		recipe = {
			{'', '', 'default:bronze_ingot'},
			{'', 'default:bronze_ingot', ''},
			{'group:stick', '', ''},
		}
})

minetest.register_craft({
		type = 'shapeless',
		output = 'survival:machete_diamond 1',
		recipe = {'survival:machete_steel', 'default:diamond'},
})

minetest.register_craft({
		output = 'survival:machete_mese 1',
		recipe = {
			{'', '', 'default:mese_crystal'},
			{'', 'default:mese_crystal', ''},
			{'group:stick', '', ''},
		}
})

minetest.register_craft({
		output = 'survival:sleeping_bag 1',
		recipe = {
		{'group:wool', 'group:wool', 'group:wool'}
		},
})

minetest.register_craft({
		output = 'survival:leafy_bed 1',
		recipe = {
		{'default:leaves', '', 'default:leaves'},
		{'default:leaves', 'default:leaves', 'default:leaves'}
		}
})

minetest.register_craft({
		output = 'survival:energy_bar 1',
		recipe = {
		{'default:apple', 'default:apple', 'default:apple'},
		{'survival:sugar', 'survival:sugar', 'survival:sugar'},
		{'farming:seed_wheat', 'farming:seed_wheat', 'farming:seed_wheat'},
		}
})

minetest.register_craft({
		output = 'survival:spigot 1',
		recipe = {
		{'default:clay', '', ''},
		{'default:clay', 'group:stick', ''},
		{'default:clay', '', 'group:stick'}
		}
})

minetest.register_craft({
		output = 'survival:well_bottom 1',
		recipe = {
		{'default:cobble', 'default:cobble', 'default:cobble'},
		{'default:cobble', 'farming:cotton', 'default:cobble'},
		{'default:cobble', 'default:cobble', 'default:cobble'},
		}
})

minetest.register_craft({
		output = 'survival:well_top 1',
		recipe = {
		{'', 'group:wood', ''},
		{'group:wood', 'farming:cotton', 'group:wood'},
		{'group:stick', 'farming:cotton', 'group:stick'},
		}
})

minetest.register_craft({
		output = 'survival:raw_kabob 1',
		recipe = {
		{'survival:mussel_raw', 'survival:mussel_raw', 'survival:mussel_raw'},
		{'survival:oyster_raw', 'survival:oyster_raw', 'survival:oyster_raw'},
		{'group:stick', '', ''},
		}
})

minetest.register_craft({
		type = 'shapeless',
		output = 'survival:salt 9',
		recipe = {'survival:salt_lump'}
		})

minetest.register_craft({
		type = 'cooking',
		output = 'survival:slug_cooked',
		recipe = 'survival:slug_raw',
		cooktime = 1,
		})
		
minetest.register_craft({
		type = 'cooking',
		output = 'survival:cricket_cooked',
		recipe = 'survival:cricket_raw',
		cooktime = 1,
		})

minetest.register_craft({
		type = 'cooking',
		output = 'survival:worm_cooked',
		recipe = 'survival:worm_raw',
		cooktime = 1,
		})

minetest.register_craft({
		type = 'cooking',
		output = 'survival:centipede_cooked',
		recipe = 'survival:centipede_raw',
		cooktime = 1,
		})

minetest.register_craft({
		type = 'cooking',
		output = 'survival:milipede_cooked',
		recipe = 'survival:milipede_raw',
		cooktime = 1,
		})

minetest.register_craft({
		type = 'cooking',
		output = 'survival:oyster_cooked',
		recipe = 'survival:oyster_raw',
		cooktime = 3,
		replacements = {{'survival:oyster_raw', 'survival:shell'}},
})

minetest.register_craft({
		type = 'cooking',
		output = 'survival:mussel_cooked',
		recipe = 'survival:mussel_raw',
		cooktime = 3,
		replacements = {{'survival:mussel_raw', 'survival:shell'}},
})

minetest.register_craft({
		type = 'cooking',
		output = 'survival:sugar',
		recipe = 'survival:bucket_sap',
		cooktime = 30,
		replacements = {{'survival:bucket_sap', 'bucket:bucket_empty'}},
})

minetest.register_craft({
		type = 'cooking',
		output = 'survival:cooked_kabob',
		recipe = 'survival:raw_kabob',
		cooktime = 7,
})
