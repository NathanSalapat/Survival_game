-- Minetest 0.4 mod: default
-- See README.txt for licensing and other information.

-- Namespace for functions
flowers = {}

-- Map Generation
dofile(minetest.get_modpath("flowers").."/mapgen.lua")

-- Aliases for original flowers mod
minetest.register_alias("flowers:flower_dandelion_white", "flowers:dandelion_white")
minetest.register_alias("flowers:flower_dandelion_yellow", "flowers:dandelion_yellow")
minetest.register_alias("flowers:flower_geranium", "flowers:geranium")
minetest.register_alias("flowers:flower_rose", "flowers:rose")
minetest.register_alias("flowers:flower_tulip", "flowers:tulip")
minetest.register_alias("flowers:flower_viola", "flowers:viola")

-- Flower registration function
local function add_simple_flower(name, desc, box, f_groups)
	-- Common flowers' groups
	f_groups.snappy = 3
	f_groups.flammable = 2
	f_groups.flower = 1
	f_groups.flora = 1
	f_groups.attached_node = 1

	minetest.register_node("flowers:"..name.."", {
		description = desc,
		drawtype = "plantlike",
		tiles = { "flowers_" .. name .. ".png" },
		inventory_image = "flowers_" .. name .. ".png",
		wield_image = "flowers_" .. name .. ".png",
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		stack_max = 99,
		groups = f_groups,
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = box
		}
	})
end

-- Registrations using the function above
flowers.datas = {
	{"dandelion_yellow", "Yellow Dandelion", { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 }, {color_yellow=1}},
	{"geranium", "Blue Geranium", { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 }, {color_blue=1}},
	{"rose", "Rose", { -0.15, -0.5, -0.15, 0.15, 0.3, 0.15 }, {color_red=1}},
	{"tulip", "Orange Tulip", { -0.15, -0.5, -0.15, 0.15, 0.2, 0.15 }, {color_orange=1}},
	{"dandelion_white", "White dandelion", { -0.5, -0.5, -0.5, 0.5, -0.2, 0.5 }, {color_white=1}},
	{"viola", "Viola", { -0.5, -0.5, -0.5, 0.5, -0.2, 0.5 }, {color_violet=1}}
}

for _,item in pairs(flowers.datas) do
	add_simple_flower(unpack(item))
end

minetest.register_abm({
	nodenames = {"group:flower"},
	neighbors = {"group:soil"},
	interval = 50,
	chance = 25,
	action = function(pos, node)
		pos.y = pos.y - 1
		local under = minetest.get_node(pos)
		pos.y = pos.y + 1
		if under.name == "default:desert_sand" then
			minetest.set_node(pos, {name="default:dry_shrub"})
		elseif minetest.get_item_group(under.name, 'soil') == 0 then
			print 'not above group:soil'
			return
		end
		
		local light = minetest.get_node_light(pos)
		if not light or light < 10 then
			print 'not enough light'
			return
		end
		
		local pos0 = {x=pos.x-4,y=pos.y-4,z=pos.z-4}
		local pos1 = {x=pos.x+4,y=pos.y+4,z=pos.z+4}
		if #minetest.find_nodes_in_area(pos0, pos1, "group:flora_block") > 0 then
			print 'something is blocking growth'
			return
		end
		
		local flowers = minetest.find_nodes_in_area(pos0, pos1, "group:flower")
		if #flowers > 3 then
			print 'too much of group:flower in area'
			return
		end
		
		local seedling = minetest.find_nodes_in_area(pos0, pos1, "group:soil")
		print 'should be checking is there is any group:soil around'
		print (#seedling)
		if #seedling > 0 then
			seedling = seedling[math.random(#seedling)]
			seedling.y = seedling.y + 1
			light = minetest.get_node_light(seedling)
			if not light or light < 10 then
				print 'not enough light'
				return
			end
			if minetest.get_node(seedling).name == "air" then
--			if minetest.get_item_group(seedling.name, 'flora') == 1 then
				minetest.set_node(seedling, {name=node.name})
				print 'planting flower.'
			end
		end
	end,
})
