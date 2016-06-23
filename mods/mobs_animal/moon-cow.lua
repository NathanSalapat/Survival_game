
-- Cow by NathanS21

mobs:register_mob("mobs_animal:mooncow", {
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	reach = 2,
	damage = 4,
	hp_min = 5,
	hp_max = 20,
	armor = 200,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
	visual = "mesh",
	visual_size = {x = 9, y = 9},
	mesh = "moon-cow.b3d",
	textures = {
		{"moon-cow-brown.png"},
		{"moon-cow-white.png"},
		{"moon-cow-yellow.png"}
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_cow",
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 3},
		{name = "mobs:leather", chance = 1, min = 1, max = 2},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		speed_normal = 20,
		speed_run = 30,
		stand_start = 42,
		stand_end = 82,
		walk_start = 0,
		walk_end = 40,
		run_start = 0,
		run_end = 40,
		punch_start = 70,
		punch_end = 100,
	},
	follow = "farming:wheat",
	view_range = 7,
--	replace_rate = 10,
--	replace_what = {"default:grass_3", "default:grass_4", "default:grass_5", "farming:wheat_8"},
--	replace_with = "air",
	fear_height = 2,
	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		local tool = clicker:get_wielded_item()

		-- milk cow with empty bucket
		if tool:get_name() == "bucket:bucket_empty" then

			--if self.gotten == true
			if self.child == true then
				return
			end

			if self.gotten == true then
				minetest.chat_send_player(clicker:get_player_name(),
						"Cow already milked!")
				return
			end

			local inv = clicker:get_inventory()

			inv:remove_item("main", "bucket:bucket_empty")

			if inv:room_for_item("main", {name = "mobs:bucket_milk"}) then
				clicker:get_inventory():add_item("main", "mobs:bucket_milk")
			else
				local pos = self.object:getpos()
				pos.y = pos.y + 0.5
				minetest.add_item(pos, {name = "mobs:bucket_milk"})
			end

			self.gotten = true -- milked

			return
		end

		mobs:capture_mob(self, clicker, 0, 5, 60, false, nil)
	end,
})

mobs:register_spawn("mobs_animal:moon-cow",
	{"default:dirt_with_grass", "ethereal:green_dirt"}, 20, 10, 15000, 2, 31000, true)

mobs:register_egg("mobs_animal:mooncow", "Moon Cow", "default_grass.png", 1)
