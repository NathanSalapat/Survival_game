
local S = mobs.intllib

-- Warthog by KrupnoPavel

mobs:register_mob("animals:pumba", {
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	group_attack = true,
	reach = 2,
	damage = 2,
	hp_min = 5,
	hp_max = 15,
	armor = 200,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
	visual = "mesh",
	mesh = "animals_pumba.x",
	textures = {
		{"animals_pumba.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "animals_pig",
		attack = "animals_pig_angry",
	},
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	follow = {"default:apple", "farming:potato"},
	view_range = 10,
	drops = {
		{name = "food:pork_raw", chance = 1, min = 1, max = 3},
      {name = "animals:leather", chance = 2, min = 1, max = 3}
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 15,
		stand_start = 25,
		stand_end = 55,
		walk_start = 70,
		walk_end = 100,
		punch_start = 70,
		punch_end = 100,
	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
})

mobs:register_spawn("animals:pumba",
	{"ethereal:mushroom_dirt", "default:dirt_with_dry_grass"}, 20, 10, 15000, 1, 31000, true)

mobs:register_egg("animals:pumba", S("Warthog"), "wool_pink.png", 1)
