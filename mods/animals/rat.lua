
local S = mobs.intllib

-- Rat by PilzAdam

mobs:register_mob("animals:rat", {
	type = "animal",
	passive = true,
	hp_min = 1,
	hp_max = 4,
	armor = 200,
	collisionbox = {-0.2, -1, -0.2, 0.2, -0.8, 0.2},
	visual = "mesh",
	mesh = "animals_rat.b3d",
	textures = {
		{"animals_rat.png"},
		{"animals_rat2.png"},
	},
	makes_footstep_sound = false,
	sounds = {
		random = "animals_rat",
	},
	walk_velocity = 1,
	run_velocity = 2,
	runaway = true,
	jump = true,
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	on_rightclick = function(self, clicker)
		mobs:capture_mob(self, clicker, 25, 80, 0, true, nil)
	end,
})

mobs:register_spawn("animals:rat", {"default:stone"}, 20, 5, 15000, 2, 0)

mobs:register_egg("animals:rat", S("Rat"), "animals_rat_inventory.png", 0)

-- cooked rat, yummy!
minetest.register_craftitem("animals:rat_cooked", {
	description = S("Cooked Rat"),
	inventory_image = "animals_cooked_rat.png",
	on_use = minetest.item_eat(3),
})

minetest.register_craft({
	type = "cooking",
	output = "animals:rat_cooked",
	recipe = "animals:rat",
	cooktime = 5,
})
