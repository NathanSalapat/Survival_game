minetest.register_node('furniture:bedside_cabinet', {
	description = 'Nightstand',
	drawtype = 'mesh',
	mesh = 'furniture_nightstand.obj',
	tiles = {'default_wood.png'},
	groups = {choppy=2,oddly_breakable_by_hand=2, furn=1},
	inventory_image = "furniture_nightstand.png",
	paramtype = 'light',
	paramtype2 = 'facedir',
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size('main', 8*4)
		inv:set_size('storage', 3*3)
		inv:set_size('storage1', 9*3)
		meta:set_string('formspec',
			'size [9,10.5]'..
			'bgcolor[#00000000;false]'..
			'background[9,10.5;0,0;nightstand.png;true]'..
			'list[current_name;storage;3,0;3,3;]'..
			'list[current_name;storage1;0,3;9,3]'..
			'list[current_player;main;0.5,6.5;8,4;]')
		meta:set_string('infotext', 'Bedside Cabinet')
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty('storage') and inv:is_empty('storage1')
	end,
})
