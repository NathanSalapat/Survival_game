
local S = mobs.intllib

-- Chicken by JK Murray

mobs:register_mob("animals:chicken", {
	type = "animal",
	passive = true,
	hp_min = 5,
	hp_max = 10,
	armor = 200,
	collisionbox = {-0.3, -0.75, -0.3, 0.3, 0.1, 0.3},
	visual = "mesh",
	mesh = "animals_chicken.x",
	-- seems a lot of textures but this fixes the problem with the model
	textures = {
		{"animals_chicken.png", "animals_chicken.png", "animals_chicken.png", "animals_chicken.png",
		"animals_chicken.png", "animals_chicken.png", "animals_chicken.png", "animals_chicken.png", "animals_chicken.png"},
		{"animals_chicken_black.png", "animals_chicken_black.png", "animals_chicken_black.png", "animals_chicken_black.png",
		"animals_chicken_black.png", "animals_chicken_black.png", "animals_chicken_black.png", "animals_chicken_black.png", "animals_chicken_black.png"},
	},
	child_texture = {
		{"animals_chick.png", "animals_chick.png", "animals_chick.png", "animals_chick.png",
		"animals_chick.png", "animals_chick.png", "animals_chick.png", "animals_chick.png", "animals_chick.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "animals_chicken",
	},
	walk_velocity = 1,
	run_velocity = 3,
	runaway = true,
	jump = true,
	drops = {
		{name = "food:poultry_raw", chance = 1, min = 1, max = 2},
      {name = 'animals:feather', chance = 2, min = 1, max = 6}
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fall_damage = 0,
	fall_speed = -8,
	fear_height = 5,
	animation = {
		speed_normal = 15,
		stand_start = 0,
		stand_end = 1, -- 20
		walk_start = 20,
		walk_end = 40,
	},
	follow = {"farming:seed_wheat", "farming:seed_cotton"},
	view_range = 5,

	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 30, 50, 80, false, nil)
	end,

	do_custom = function(self)

		if self.child
		or math.random(1, 5000) > 1 then
			return
		end

		local pos = self.object:getpos()

		minetest.add_item(pos, "food:egg_raw")

		minetest.sound_play("default_place_node_hard", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 5,
		})
	end,
})

mobs:register_spawn("animals:chicken",
	{"default:dirt_with_grass", "ethereal:bamboo_dirt"}, 20, 10, 15000, 1, 31000, true)

mobs:register_egg("animals:chicken", S("Chicken"), "animals_chicken_inv.png", 0)
