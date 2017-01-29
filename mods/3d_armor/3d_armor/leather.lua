minetest.register_tool("3d_armor:helmet_leather", {
	description = "Leather Helmet",
	inventory_image = "3d_armor_inv_helmet_leather.png",
	groups = {armor_head=5, armor_heal=0, armor_use=2000},
	wear = 0,
})

minetest.register_tool("3d_armor:chestplate_leather", {
	description = "Leather Chestplate",
	inventory_image = "3d_armor_inv_chestplate_leather.png",
	groups = {armor_torso=10, armor_heal=0, armor_use=2000},
	wear = 0,
})

minetest.register_tool("3d_armor:leggings_leather", {
	description = "Leather Leggings",
	inventory_image = "3d_armor_inv_leggings_leather.png",
	groups = {armor_legs=5, armor_heal=0, armor_use=2000},
	wear = 0,
})

minetest.register_tool("3d_armor:boots_leather", {
	description = "Leather Boots",
	inventory_image = "3d_armor_inv_boots_leather.png",
	groups = {armor_feet=5, armor_heal=0, armor_use=2000},
	wear = 0,
})

minetest.register_craft({
	output = "3d_armor:helmet_leather",
	recipe = {
		{'animals:leather', 'animals:leather', 'animals:leather'},
		{'animals:leather', "", 'animals:leather'},
		{"", "", ""},
	},
})

minetest.register_craft({
	output = "3d_armor:chestplate_leather",
	recipe = {
		{'animals:leather', "", 'animals:leather'},
		{'animals:leather', 'animals:leather', 'animals:leather'},
		{'animals:leather', 'animals:leather', 'animals:leather'},
	},
})

minetest.register_craft({
	output = "3d_armor:leggings_leather",
	recipe = {
		{'animals:leather', 'animals:leather', 'animals:leather'},
		{'animals:leather', "", 'animals:leather'},
		{'animals:leather', "", 'animals:leather'},
	},
})

minetest.register_craft({
	output = "3d_armor:boots_leather",
	recipe = {
		{'animals:leather', "", 'animals:leather'},
		{'animals:leather', "", 'animals:leather'},
	},
})
