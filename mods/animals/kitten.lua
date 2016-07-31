
local S = mobs.intllib

-- Kitten by Jordach / BFD

mobs:register_mob("animals:kitten", {
	type = "animal",
	passive = true,
	hp_min = 5,
	hp_max = 10,
	armor = 200,
	collisionbox = {-0.3, -0.3, -0.3, 0.3, 0.1, 0.3},
	visual = "mesh",
	visual_size = {x = 0.5, y = 0.5},
	mesh = "animals_kitten.b3d",
	textures = {
		{"animals_kitten_striped.png"},
		{"animals_kitten_splotchy.png"},
		{"animals_kitten_ginger.png"},
		{"animals_kitten_sandy.png"},
	},
	makes_footstep_sound = false,
	sounds = {
		random = "animals_kitten",
	},
	walk_velocity = 0.6,
	run_velocity = 2,
	runaway = true,
	jump = false,
	drops = {
		{name = "farming:string", chance = 1, min = 1, max = 1},
	},
	water_damage = 1,
	lava_damage = 5,
	fear_height = 3,
	animation = {
		speed_normal = 42,
		stand_start = 97,
		stand_end = 192,
		walk_start = 0,
		walk_end = 96,
	},
	follow = {"animals:rat", "ethereal:fish_raw", "animals_fish:clownfish", "animals_fish:tropical"},
	view_range = 8,
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 4, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 50, 50, 90, false, nil)
	end
})

mobs:register_spawn("animals:kitten",
	{"default:dirt_with_grass", "ethereal:grove_dirt"}, 20, 12, 22000, 1, 31000, true)

mobs:register_egg("animals:kitten", S("Kitten"), "animals_kitten_inv.png", 0)
