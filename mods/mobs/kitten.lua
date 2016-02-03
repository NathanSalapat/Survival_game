
-- Kitten by Jordach / BFD

mobs:register_mob("mobs:kitten", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 2,
	hp_min = 5,
	hp_max = 10,
	armor = 200,
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.3, 0.5},
	visual = "mesh",
	visual_size = {x = 1, y = 1},
	mesh = "mobs_kitten.b3d",
	textures = {
		{"mobs_kitten_striped.png"},
		{"mobs_kitten_splotchy.png"},
		{"mobs_kitten_ginger.png"},
		{"mobs_kitten_sandy.png"},
	},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_kitten",
	},
	walk_velocity = 0.6,
	run_velocity = 2,
	runaway = true,
	jump = false,
	drops = {
		{name = "mobs:fur",
		chance = 1, min = 2, max = 4},
		{name = "food:steak_raw",
		chance = 1, min = 2, max = 4},
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
	follow = {"mobs:rat", "ethereal:fish_raw"},
	view_range = 8,
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 4, true, true) then
			return
		end
		mobs:capture_mob(self, clicker, 50, 50, 90, false, nil)
	end
})

mobs:register_spawn("mobs:kitten", {"default:dirt_with_grass", "ethereal:grove_dirt"}, 20, 12, 22000, 2, 31000)

mobs:register_egg("mobs:kitten", "Kitten", "mobs_kitten_inv.png", 0)
