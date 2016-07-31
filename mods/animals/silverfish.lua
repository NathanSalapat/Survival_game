
-- Silverfish by Nathan S.

mobs:register_mob("animals:silverfish", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	reach = 1,
	hp_min = 5,
	hp_max = 8,
	damage = 1,
	armor = 100,
	collisionbox = {-0.2, -0.4, -0.2, 0.2, 0.2, 0.2},
	visual = "mesh",
	visual_size = {x = 10, y = 10},
	mesh = "animals_silverfish.x",
	textures = {
		{"animals_silverfish.png"},
		{"animals_silverfish.png^[colorize:#303030b0"},
	},
	makes_footstep_sound = false,
	sounds = {
		random = "animals_silverfish",
		war_cry = "animals_silverfish",
		damage = "animals_silverfish",
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fall_damage = 0,
	animation = {
		speed_normal = 15,
		stand_start = 0,
		stand_end = 1,
		walk_start = 1,
		walk_end = 59,
		punch_start = 121,
		punch_end = 161,
	},
	view_range = 10,
})

mobs:register_spawn("animals:silverfish",
	{"default:cobble", "default:mossycobble", "default:sandstonebrick"}, 11, 0, 7000, 2, -50)

mobs:register_egg("animals:silverfish", "Silverfish", "default_copper_block.png", 1)


-- fake stone block (monster egg)
minetest.register_node("animals:stone", {
	tiles = {"default_stone.png"},
	groups = {cracky = 3},
	drop = 'default:cobble',
	sounds = default.node_sound_stone_defaults(),
	on_destruct = function(pos)
		for n = 0, math.random(0, 4) do
			minetest.add_entity(pos, "animals:silverfish")
		end
	end
})

-- generate monster egg inside normal stone
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "animals:stone",
	wherein        = "default:stone",
	clust_scarcity = 10 * 10 * 10,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = -31000,
	y_max          = -50,
})
