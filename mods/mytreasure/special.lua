local function calc_velocity(pos1, pos2, old_vel, power)
	local vel = vector.direction(pos1, pos2)
	vel = vector.normalize(vel)
	vel = vector.multiply(vel, power)

	-- Divide by distance
	local dist = vector.distance(pos1, pos2)
	dist = math.max(dist, 1)
	vel = vector.divide(vel, dist)

	-- Add old velocity
	vel = vector.add(vel, old_vel)
	return vel
end

local radius = tonumber(minetest.setting_get("chest_radius") or 3)

local function entity_physics(pos, radius)
	radius = radius * 2
	local objs = minetest.get_objects_inside_radius(pos, radius)
	for _, obj in pairs(objs) do
		local obj_pos = obj:getpos()
		local obj_vel = obj:getvelocity()
		local dist = math.max(1, vector.distance(pos, obj_pos))

		if obj_vel ~= nil then
			obj:setvelocity(calc_velocity(pos, obj_pos,
					obj_vel, radius * 10))
		end

		local damage = (4 / dist) * radius
		obj:set_hp(obj:get_hp() - damage)
	end
end

local function explode(pos, radius)
	local pos = vector.round(pos)
	local vm = VoxelManip()
	local pr = PseudoRandom(os.time())
	local p1 = vector.subtract(pos, radius)
	local p2 = vector.add(pos, radius)
	local minp, maxp = vm:read_from_map(p1, p2)
	local a = VoxelArea:new({MinEdge = minp, MaxEdge = maxp})
	local data = vm:get_data()

	local drops = {}
	local p = {}

	local kaboom = minetest.get_content_id("mytreasure:kaboom")

	for z = -radius, radius do
	for y = -radius, radius do
	local vi = a:index(pos.x + (-radius), pos.y + y, pos.z + z)
	for x = -radius, radius do
		if (x * x) + (y * y) + (z * z) <=
				(radius * radius) + pr:next(-radius, radius) then
			local cid = data[vi]
			p.x = pos.x + x
			p.y = pos.y + y
			p.z = pos.z + z
			if 
					cid == kaboom then
		minetest.remove_node(pos)
			end
		end
		vi = vi + 1
	end
	end
	end

	return 
end

local function boom(pos)
	minetest.sound_play("tnt_explode", {pos=pos, gain=1.5, max_hear_distance=2*64})
	minetest.get_node_timer(pos):start(0.5)

  	minetest.add_particlespawner(50, 0.4,
		pos, pos,
		{x=4, y=1.2, z=4}, {x=-4, y=4, z=-4},
		{x=0, y=-6, z=0}, {x=0, y=-10, z=0},
		0.5, 2,
		0.2, 5,
		true, "mytreasure_boom.png")

	local drops = explode(pos, radius)
	entity_physics(pos, radius)
end
local function coins(pos)
  	minetest.add_particlespawner(50, 0.4,
		pos, pos,
		{x=2, y=0.2, z=2}, {x=-2, y=2, z=-2},
		{x=0, y=-6, z=0}, {x=0, y=-10, z=0},
		0.5, 2,
		0.2, 5,
		true, "mytreasure_coin.png")
end
	


minetest.register_node("mytreasure:dungeon",{
	description = "Dungeon Treasure",
	drawtype = "mesh",
	mesh = "mytreasure_chest.obj",
	tiles = {"mytreasure_chestdungeon.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 2,
	visual_scale = 0.5,
	groups = {cracky = 2, choppy=2, not_in_creative_inventory=1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
		}
	},
	drop = {
		max_items = 3,
		items = {
		{
		items = {"default:diamond 10"},
		rarity = 30, 
		},
		{
		items = {"default:mese_crystal 10"},
		rarity = 1,
		},
		{
		items = {"default:gold_lump 25"},
		rarity = 3,
		},
		{
		items = {"default:goldblock 3"},
		rarity = 30,
		},
		{
		items = {"default:mossycobble 99"},
		rarity = 1,
		},
		{
		items = {"default:obsidian 25"},
		rarity = 25,
		},
		{
		items = {"default:iron_lump 99"},
		rarity = 10,
		},
		{
		items = {"default:chest_locked"},
		rarity = 15,
		},
		{
		items = {"default:coalblock 20"},
		rarity = 20,
		},
		{
		items = {"default:obsidian_glass 99"},
		rarity = 25,
		},
		{
		items = {"wool:white 99"},
		rarity = 3,
		},
		{
		items = {"default:tree 99"},
		rarity = 3,
		},
		{
		items = {"default:papyrus 10"},
		rarity = 3,
		},
		{
		items = {"default:copper_lump 10"},
		rarity = 8,
		},

		},
	},
on_destruct = coins,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mytreasure:dungeon",
	wherein        = "default:mossycobble",
	clust_scarcity = 30*30*30,
	clust_num_ores = 1,
	clust_size     = 1,
	height_min     = -31000,
	height_max     = -150,
})

--Dungeon2 - places scheme
minetest.register_node("mytreasure:dungeon2",{
	description = "Dungeon 2 Treasure",
	drawtype = "mesh",
	mesh = "mytreasure_chest.obj",
	tiles = {"mytreasure_chestdungeon.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "",
	light_source = 2,
	visual_scale = 0.5,
	groups = {cracky = 2, choppy=2, not_in_creative_inventory=1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
		}
	},
after_destruct = function(pos, oldnode)
local schem = minetest.get_modpath("mytreasure").."/schems/dungeon.mts"
	minetest.place_schematic({x=pos.x-5,y=pos.y-2,z=pos.z-5},schem,0, 0, true)
end,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mytreasure:dungeon2",
	wherein        = "stone",
	clust_scarcity = 30*30*30,
	clust_num_ores = 1,
	clust_size     = 1,
	height_min     = -31000,
	height_max     = -50,
})

--Wool - places scheme
minetest.register_node("mytreasure:wool",{
	description = "Wool Treasure",
	drawtype = "mesh",
	mesh = "mytreasure_chest.obj",
	tiles = {"mytreasure_chestdungeon.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "",
	light_source = 2,
	visual_scale = 0.5,
	groups = {cracky = 2, choppy=2, not_in_creative_inventory=1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
		}
	},
after_destruct = function(pos, oldnode)
local schem = minetest.get_modpath("mytreasure").."/schems/wool.mts"
	minetest.place_schematic({x=pos.x-5,y=pos.y-2,z=pos.z-5},schem,0, 0, true)
end,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mytreasure:wool",
	wherein        = "stone",
	clust_scarcity = 30*30*30,
	clust_num_ores = 1,
	clust_size     = 1,
	height_min     = -31000,
	height_max     = -50,
})
--Cavex - places scheme
minetest.register_node("mytreasure:cavex",{
	description = "Cavex Treasure",
	drawtype = "mesh",
	mesh = "mytreasure_chest.obj",
	tiles = {"mytreasure_chest.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "default:stick",
	light_source = 2,
	visual_scale = 0.5,
	groups = {cracky = 2, choppy=2, not_in_creative_inventory=1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
		}
	},
after_destruct = function(pos, oldnode)
local schem = minetest.get_modpath("mytreasure").."/schems/chestx.mts"
	minetest.place_schematic(pos,schem,0, 0, true)
end,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mytreasure:cavex",
	wherein        = "air",
	clust_scarcity = 80*80*80,
	clust_num_ores = 1,
	clust_size     = 1,
	height_min     = -31000,
	height_max     = -50,
})
--Exploding Chest

minetest.register_node("mytreasure:exploding",{
	description = "Exploding Chest",
	drawtype = "mesh",
	mesh = "mytreasure_chest.obj",
	tiles = {"mytreasure_chestm.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 4,
	visual_scale = 0.5,
	groups = {not_in_creative_inventory=1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
		}
	},
	on_punch = function(pos, node, puncher, pointed_thing)
		minetest.set_node(pos, {name="mytreasure:kaboom"})
			minetest.get_node_timer(pos):start(2)
	end
})

minetest.register_node("mytreasure:kaboom",{
	description = "Kaboom",
	drawtype = "mesh",
	mesh = "mytreasure_chest.obj",
	tiles = {
		{name="mytreasure_chestkaboom.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=0.2}},
		},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 13,
	visual_scale = 0.75,
	groups = {not_in_creative_inventory=1, explody = 1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.375, -0.375, 0.375, 0.375, 0.375},
		}
	},
	on_timer = boom,
	
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mytreasure:exploding",
	wherein        = "air",
	clust_scarcity = 60*60*60,
	clust_num_ores = 1,
	clust_size     = 1,
	height_min     = -31000,
	height_max     = -150,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mytreasure:exploding",
	wherein        = "stone",
	clust_scarcity = 60*60*60,
	clust_num_ores = 1,
	clust_size     = 1,
	height_min     = -31000,
	height_max     = -150,
})

--Desert Treasure

minetest.register_node("mytreasure:desert",{
	description = "Desert Treasure",
	drawtype = "mesh",
	mesh = "mytreasure_chest.obj",
	tiles = {"mytreasure_chestdesert.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 6,
	visual_scale = 0.5,
	groups = {cracky = 2, choppy=2, not_in_creative_inventory=1},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.25, -0.25, 0.25, 0.25, 0.25},
		}
	},
	drop = {
		max_items = 3,
		items = {
		{
		items = {"default:diamond 3"},
		rarity = 30, 
		},
		{
		items = {"default:mese_crystal 3"},
		rarity = 1,
		},
		{
		items = {"default:gold_lump 3"},
		rarity = 3,
		},
		{
		items = {"default:desert_stone 25"},
		rarity = 30,
		},
		{
		items = {"default:wood 25"},
		rarity = 1,
		},
		{
		items = {"default:desert_sand 25"},
		rarity = 25,
		},
		{
		items = {"default:pick_steel 1"},
		rarity = 10,
		},
		{
		items = {"default:chest_locked 3"},
		rarity = 15,
		},
		{
		items = {"default:sand 25"},
		rarity = 20,
		},
		{
		items = {"default:papyrus 10"},
		rarity = 3,
		},
		{
		items = {"default:copper_lump 10"},
		rarity = 8,
		},

		},
	},
on_destruct = coins,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mytreasure:cave1",
	wherein        = "default:desert_stone",
	clust_scarcity = 40*40*40,
	clust_num_ores = 1,
	clust_size     = 1,
	height_min     = -150,
	height_max     = -15,
})


