minetest.register_tool("3d_armor:helmet_cloth", {
	description = "Cloth Helmet",
	inventory_image = "3d_armor_inv_helmet_cloth.png",
	groups = {armor_head=4, armor_heal=0, armor_use=1800},
	wear = 0,
})

minetest.register_tool("3d_armor:chestplate_cloth", {
	description = "Cloth Chestplate",
	inventory_image = "3d_armor_inv_chestplate_cloth.png",
	groups = {armor_torso=9, armor_heal=0, armor_use=1800},
	wear = 0,
})

minetest.register_tool("3d_armor:leggings_cloth", {
	description = "Cloth Leggings",
	inventory_image = "3d_armor_inv_leggings_cloth.png",
	groups = {armor_legs=4, armor_heal=0, armor_use=1800},
	wear = 0,
})

minetest.register_tool("3d_armor:boots_cloth", {
	description = "Cloth Boots",
	inventory_image = "3d_armor_inv_boots_cloth.png",
	groups = {armor_feet=4, armor_heal=0, armor_use=1800},
	wear = 0,
})

minetest.register_craft({
	output = "3d_armor:helmet_cloth",
	recipe = {
		{'furniture:cloth', 'furniture:cloth', 'furniture:cloth'},
		{'furniture:cloth', "", 'furniture:cloth'},
		{"", "", ""},
	},
})

minetest.register_craft({
	output = "3d_armor:chestplate_cloth",
	recipe = {
		{'furniture:cloth', "", 'furniture:cloth'},
		{'furniture:cloth', 'furniture:cloth', 'furniture:cloth'},
		{'furniture:cloth', 'furniture:cloth', 'furniture:cloth'},
	},
})

minetest.register_craft({
	output = "3d_armor:leggings_cloth",
	recipe = {
		{'furniture:cloth', 'furniture:cloth', 'furniture:cloth'},
		{'furniture:cloth', "", 'furniture:cloth'},
		{'furniture:cloth', "", 'furniture:cloth'},
	},
})

minetest.register_craft({
	output = "3d_armor:boots_cloth",
	recipe = {
		{'furniture:cloth', "", 'furniture:cloth'},
		{'furniture:cloth', "", 'furniture:cloth'},
	},
})
