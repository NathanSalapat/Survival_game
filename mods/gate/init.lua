local nb_gap = 	{
		{-1, 0.1875, -0.0625, -0.5, 0.3125, 0.0625},
		{-1, -0.1875, -0.0625, -0.5, -0.3125, 0.0625},
		{0.5, 0.1875, -0.0625, 1, 0.3125, 0.0625},
		{0.5, -0.1875, -0.0625, 1, -0.3125, 0.0625}
		}

local nb_pil = 	{
		{0.5, -0.5, -0.09375, 0.5625, 0.5, 0.09375},
		{-0.5625, -0.5, -0.09375, -0.5, 0.5, 0.09375},
		{-0.5, -0.3125, -0.0625, -0.375, 0.3125, 0.0625},
		{0.375, -0.3125, -0.0625, 0.5, 0.3125, 0.0625}
		}

local function can_place(pos, n0)
	if not n0 or n0.name ~= "gate:fencegate" then
		return
	end
	local p1 = {x = pos.x, y = pos.y, z = pos.z}
	local p2 = {x = pos.x, y = pos.y, z = pos.z}
	if n0.param2 == 1 or n0.param2 == 3 then
		p1.z = p1.z - 1
		p2.z = p2.z + 1
	else
		p1.x = p1.x - 1
		p2.x = p2.x + 1
	end
	local n1 = minetest.get_node_or_nil(p1)
	local n2 = minetest.get_node_or_nil(p2)

	if n1 and n1.name == "default:fence_wood" and n2 and
			n2.name == "default:fence_wood" then
		return false
	end
	minetest.remove_node(pos)
	return true
end

local function gate_rightclick(pos, node)
	if node.name == "gate:fencegate" then
		minetest.sound_play("door_open", {gain = 0.3, max_hear_distance = 10})
		minetest.set_node(pos, {name="gate:fencegate_open", param2=node.param2})
	else
		minetest.sound_play("door_close", {gain = 0.3, max_hear_distance = 10})
		minetest.set_node(pos, {name="gate:fencegate", param2=node.param2})
	end
end

local wood_rotated = "default_wood.png^[transformR90"

minetest.register_node("gate:fencegate_open", {
	tiles = {"default_wood.png", "default_wood.png", wood_rotated,
		wood_rotated, wood_rotated, wood_rotated},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = true,
	groups = {snappy = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, not_in_inventory = 1},
	drop = 'gate:fencegate',
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.3125, 0.4375, -0.375, 0.3125, 0.5},
			{0.375, -0.3125, 0.4375, 0.5, 0.3125, 0.5},
			{-0.5, 0.1875, 0.0625, -0.375, 0.3125, 0.4375},
			{-0.5, -0.1875, 0.0625, -0.375, -0.3125, 0.4375},
			{0.375, 0.1875, 0.0625, 0.5, 0.3125, 0.4375},
			{0.375, -0.1875, 0.0625, 0.5, -0.3125, 0.4375},
			nb_pil[1], nb_pil[2],
			nb_pil[3], nb_pil[4],
			nb_gap[1], nb_gap[2],
			nb_gap[3], nb_gap[4],
			}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.3125, -0.0625, -0.375, 0.3125, 0.5},
			{0.375, -0.3125, -0.0625, 0.5, 0.3125, 0.5},
			}
	},
	on_rightclick = gate_rightclick,
})

minetest.register_node("gate:fencegate", {
	description = "Wooden fence gate",
	tiles = {"default_wood.png", "default_wood.png", wood_rotated,
		wood_rotated, wood_rotated, wood_rotated},
	inventory_image = "gate_fencegate.png",
	wield_image = "gate_fencegate.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = true,
	groups = {snappy = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			nb_pil[1], nb_pil[2],
			nb_pil[3], nb_pil[4],
			{-0.0625, -0.3125, -0.0625, 0.0625, 0.3125, 0.0625},
			{-1, 0.1875, -0.0625, 1, 0.3125, 0.0625},
			{-1, -0.1875, -0.0625, 1, -0.3125, 0.0625},
			}
	},
	selection_box = {
		type = "fixed",
		fixed = {{-0.5, -0.3125, -0.0625, 0.5, 0.3125, 0.0625}}
	},
	on_rightclick = gate_rightclick,
})

minetest.register_on_placenode(can_place)

minetest.register_craft({
	output = 'gate:fencegate',
	recipe = {
		 {'default:stick', 'group:wood', 'default:stick'},
		 {'default:stick', 'group:wood', 'default:stick'},
	}
})
