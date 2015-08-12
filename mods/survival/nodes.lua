local barrel_formspec =
	'size[8,9]'..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	'list[current_name;main;0,0.3;8,4;]'..
	'list[current_player;main;0,4.85;8,1;]'..
	'list[current_player;main;0,6.08;8,3;8]'..
	default.get_hotbar_bg(0,4.85)

minetest.register_node('survival:barrel', {
	description = 'Barrel',
	drawtype = 'mesh',
	mesh = 'survival_barrel.obj',
	tiles = {'survival_barrel.png'},
	groups = {choppy=2,oddly_breakable_by_hand=2},
	paramtype = 'light',
	paramtype2 = 'facedir',
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string('formspec', barrel_formspec)
		meta:set_string('infotext', 'Barrel')
		local inv = meta:get_inventory()
		inv:set_size('main', 8*4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty('main')
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log('action', player:get_player_name()..
				' moves stuff in barrel at '..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log('action', player:get_player_name()..
				' moves stuff to barrel at '..minetest.pos_to_string(pos))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log('action', player:get_player_name()..
				' takes stuff from barrel at '..minetest.pos_to_string(pos))
	end,
})

minetest.override_item('default:dirt_with_grass',{
	drop = {
		max_items = 2,
		items = {
			{
			items = {'survival:slug_raw'},
			rarity = 30,
			},
			{
			items = {'survival:worm_raw'},
			rarity = 30,
			},
			{
			items = {'survival:centipede_raw'},
			rarity = 30,
			},
			{
			items = {'survival:milipede_raw'},
			rarity = 30,
			},
			{
			items = {'default:dirt'},
			},
		},
	},
})
--This will probably need to be a few nodes to show the states it can be in.
minetest.register_node('survival:spigot', {
	description = 'spigot',
	drawtype = 'mesh',
	mesh = 'spigot.obj',
	tiles = {{name='default_wood.png'},{name='default_clay.png'}},
--	inventory_image = 'placeholder.png',
	groups = {choppy=2, dig_immediate=2,},
	paramtype = 'light',
	paramtype2 = 'facedir',
	selection_box = {
		type = 'fixed',
		fixed = {-.35, -.2, 0, .35, .5, .5}, -- Right, Bottom, Back, Left, Top, Front
		},
	collision_box = {
		type = 'fixed',
		fixed = {-.35, -.2, 0, .35, .5, .5}, -- Right, Bottom, Back, Left, Top, Front
		},
    on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size('main', 8*4)
		inv:set_size('sap', 1)
		meta:set_string('formspec',
			'size[8,9]'..
			'label[1,0;You need a bucket to collect sap.]' ..
               'list[current_name;sap;1,1.5;1,1]'..
               'list[current_player;main;0,5;8,4;]')
		meta:set_string('infotext', 'Sap Spigot')
	end,
	on_timer = function(pos, elapsed)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		local timer = minetest.get_node_timer(pos)
		if inv:contains_item('sap', 'bucket:bucket_empty') then --make sure the bucket is still there
			inv:set_stack('sap', 1,'survival:bucket_sap')
			meta:set_string('infotext', 'bucket filled with sap, please replace.')
			timer:stop()
			return
		end
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		local timer = minetest.get_node_timer(pos)
		if inv:contains_item('sap', 'bucket:bucket_empty') then
			timer:start(240)
			meta:set_string('infotext', 'gathering sap.. this could take a while.')
		end
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		local timer = minetest.get_node_timer(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string('infotext', 'You need a bucket to collect sap.')
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if listname == 'sap' then
			if stack:get_name() == ('bucket:bucket_empty') then
				return 1
			else
				return 0
			end
		end
	end,
	after_place_node = function(pos, placer, itemstack)
		local n = minetest.get_node(pos) --get the location of the placed node
		if not n or not n.param2 then
			minetest.remove_node(pos)
			return true
		end
		local dir = minetest.facedir_to_dir(n.param2)
		local p1 = {x=pos.x+dir.x, y=pos.y, z=pos.z+dir.z} --node placed on
		local p2 = {x=pos.x+dir.x, y=pos.y+1, z=pos.z+dir.z} --node above previous
		local p3 = {x=pos.x+dir.x, y=pos.y-1, z=pos.z+dir.z} --node below first
		local n2 = minetest.get_node_or_nil(p1)
		local n3 = minetest.get_node_or_nil(p2)
		local n4 = minetest.get_node_or_nil(p3)
			if n2.name and n3.name and n4.name ~= 'default:tree' then
				minetest.remove_node(pos)
				return true
				--TODO make the spigot place only one node above the ground.
			end
	end,
})

minetest.register_node('survival:sleeping_bag', {
	description = 'sleeping bag',
	drawtype = 'mesh',
	mesh = 'survival_sleeping_bag.obj',
	tiles = {'wool_white.png'},
	groups = {choppy=2, snappy=3,},
	paramtype = 'light',
	paramtype2 = 'facedir',
	selection_box = {
		type = 'fixed',
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.2, 1.5}, -- Right, Bottom, Back, Left, Top, Front
		},
	collision_box = {
		type = 'fixed',
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.2, 1.5},
		},
	after_place_node = function(pos, placer, itemstack)
			local n = minetest.get_node_or_nil(pos) --get the location of the placed node
			if not n or not n.param2 then
				minetest.remove_node(pos) --???
				return true
			end
			local dir = minetest.facedir_to_dir(n.param2) --figure out what direction the node is facing
			local p = {x=pos.x+dir.x, y=pos.y, z=pos.z+dir.z}  --position
			local n2 = minetest.get_node_or_nil(p)  --what node is next in line after the node we placed?
			local def = minetest.registered_items[n2.name] or nil
			if not n2 or not def or not def.buildable_to then --remove the node if it shouldn't be placeable.
				minetest.remove_node(pos)
				return true
			end
		end,
	on_rightclick = function(pos, node, clicker)
			beds.on_rightclick(pos, clicker)
	end,
})

minetest.register_node('survival:leafy_bed', {
	description = 'bed of leaves',
	drawtype = 'mesh',
	mesh = 'survival_leafy_bed.obj',
	tiles = {'default_grass.png^default_jungleleaves.png'},
	groups = {choppy=2, snappy=3,},
	drop = {
		max_items = 4,
		items = {
			{
			items = {'survival:slug_raw'},
			rarity = 60,
			},
			{
			items = {'default:stick 4'},
			rarity = 10,
			},
			{
			items = {'default:stick 3'},
			rarity = 10,
			},
			{
			items = {'default:leaves 3'},
			rarity = 10,
			},
			{
			items = {'default:leaves 1'},
			},
		},
	},
	paramtype = 'light',
	paramtype2 = 'facedir',
	selection_box = {
		type = 'fixed',
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.2, 1.5}, -- Right, Bottom, Back, Left, Top, Front
		},
	collision_box = {
		type = 'fixed',
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.2, 1.5}, -- Right, Bottom, Back, Left, Top, Front
		},
	after_place_node = function(pos, placer, itemstack)
			local n = minetest.get_node_or_nil(pos) --get the location of the placed node
			if not n or not n.param2 then
				minetest.remove_node(pos)
				return true
			end
			local dir = minetest.facedir_to_dir(n.param2) --figure out what direction the node is facing
			local p = {x=pos.x+dir.x, y=pos.y, z=pos.z+dir.z}
			local n2 = minetest.get_node_or_nil(p)
			local def = minetest.registered_items[n2.name] or nil
			if not n2 or not def or not def.buildable_to then --remove the node if it shouldn't be placeable.
				minetest.remove_node(pos)
				return true
			end
		end,
	on_rightclick = function(pos, node, clicker)
			beds.on_rightclick(pos, clicker)
	end,
})

minetest.register_node('survival:sand_with_food', {
	description = 'Sand',
	tiles = {'default_sand.png'},
	is_ground_content = true,
	groups = {crumbly=3, falling_node=1, sand=1, not_in_creative_inventory=1},
	sounds = default.node_sound_sand_defaults(),
		drop = {
		max_items = 2,
		items = {
			{
			items = {'survival:oyster_raw'},
			rarity = 2,
			},
			{
			items = {'survival:mussel_raw'},
			rarity = 2,
			},
			{
			items = {'default:sand'},
			},
			},
		},
})

minetest.register_node('survival:well_bottom', {
	description = 'well bottom',
	drawtype = 'mesh',
	mesh = 'survival_well_bottom.obj',
	tiles = {'default_cobble.png'},
	groups = {cracky=3, stone=2},
	paramtype = 'light',
	paramtype2 = 'facedir',
	sounds = default.node_sound_stone_defaults(),
	selection_box = {
		type = 'fixed',
		fixed = {-0.6, -0.5, -0.6, 0.6, .3, .6}, -- Right, Bottom, Back, Left, Top, Front
		},
	after_place_node = function(pos, placer, itemstack)
		local n = minetest.get_node(pos)
		if not n or not n.param2 then
			minetest.remove_node(pos)
			return true
		end
		local dir = minetest.facedir_to_dir(n.param2)
		local b1 = {x=pos.x, y=pos.y-1, z=pos.z}
		local b2 = {x=pos.x, y=pos.y-2, z=pos.z}
		local b3 = {x=pos.x-dir.x, y=pos.y, z=pos.z-dir.z}
		local n1 = minetest.get_node_or_nil(b1)
		local n2 = minetest.get_node_or_nil(b2)
		local n3 = minetest.get_node_or_nil(b3)
		local def = minetest.registered_items[n2.name] or nil
		if not n1 and n2 or not def.buildable_to then --not really sure if this is the best code, but it works.
			minetest.remove_node(pos)
			return true
		end
		if minetest.get_item_group(n3.name, 'soil') < 3 then
			minetest.remove_node(pos)
			minetest.set_node(pos,{name = 'air'})
			minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z},{name = 'survival:well_bottom', param2=n.param2})
		end
	end,
	})

minetest.register_node('survival:well_top', {
	description = 'well top',
	drawtype = 'mesh',
	mesh = 'survival_well_top.obj',
	tiles = {'default_wood.png'},
	groups = {choppy=2,oddly_breakable_by_hand=2, attached_node=1},
	paramtype = 'light',
	paramtype2 = 'facedir',
	selection_box = {
		type = 'fixed',
		fixed = {-0.6, -0.6, -0.6, 0.6, .4, .6}, -- Right, Bottom, Back, Left, Top, Front
		},
	after_place_node = function(pos, placer, itemstack)
		local n = minetest.get_node(pos)
		if not n or not n.param2 then
			minetest.remove_node(pos)
			return true
		end
		local p = {x=pos.x, y=pos.y-1, z=pos.z}
		local p2 = {x=pos.x, y=pos.y-2, z=pos.z}
		local n2 = minetest.get_node_or_nil(p)
		local n3 = minetest.get_node_or_nil(p2)
		if n3.name ~= 'air' or n2.name ~= 'survival:well_bottom' then
			minetest.remove_node(pos)
			return true
		end
	end,
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size('main', 8*4)
		inv:set_size('pail', 1)
		meta:set_string('formspec',
			'size[8,6]'..
			'label[2,.5;You need something to gather water in.]' ..
               'list[current_name;pail;1,.5;1,1]'..
               'list[current_player;main;0,2;8,4;]')
		meta:set_string('infotext', 'Well')
	end,
	on_timer = function(pos, elapsed)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		local timer = minetest.get_node_timer(pos)
		if inv:contains_item('pail', 'bucket:bucket_empty') then
			inv:set_stack('pail', 1,'bucket:bucket_water')
			timer:stop()
			return
		elseif inv:contains_item('pail', 'thirsty:steel_canteen') then
			inv:set_stack('pail', 1,({name='thirsty:steel_canteen', wear=1,}))
			timer:stop()
			return
		elseif inv:contains_item('pail', 'thirsty:bronze_canteen') then
			inv:set_stack('pail', 1,({name='thirsty:bronze_canteen', wear=1,}))
			timer:stop()
		end
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		local timer = minetest.get_node_timer(pos)
		if inv:contains_item('pail', 'bucket:bucket_empty') then
			timer:start(7)
		elseif inv:contains_item('pail', 'thirsty:steel_canteen') then
			timer:start(6)
		elseif inv:contains_item('pail', 'thirsty:bronze_canteen') then
			timer:start(7)
		end
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		local chance = math.random(1,20)
		if chance == 2 then
		-- Let's change the formspec'
			local meta = minetest.env:get_meta(pos)
			local inv = meta:get_inventory()
			inv:set_size('main', 8*4)
			inv:set_size('pail', 0)
			meta:set_string('formspec',
			'size[8,6]'..
			'label[2,.5;This well has dried up!]' ..
               'list[current_player;main;0,2;8,4;]')
            meta:set_string('infotext', 'Dead Well')
            -- Now let's fill the well with dirt, so it has to be dug again.
            for i=2,4 do
				minetest.set_node({x=pos.x, y=pos.y-i, z=pos.z},{name = 'default:dirt'})
				end
		end
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if listname == 'pail' then
			if stack:get_name() == ('bucket:bucket_empty') then
				return 1
			elseif stack:get_name() == ('thirsty:steel_canteen') then
				return 1
			elseif stack:get_name() == ('thirsty:bronze_canteen') then
				return 1
			else
				return 0
			end
		end
	end,
})

minetest.register_node('survival:stone_with_salt', {
	description = 'Salt Ore',
	tiles = {'default_stone.png^survival_salt_ore.png'},
	is_ground_content = true,
	groups = {cracky=3},
	drop = 'survival:salt_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node('survival:bird_nest', {
	description = 'Bird Nest',
	drawtype = 'mesh',
	mesh = 'survival_nest.obj',
	tiles = {'survival_nest.png'},
	groups = {flammable=1, snappy=1, crumbly=3},
	drop = {
		max_items = 2,
		items = {
			{
			items = {'survival:nesting 4'},
			},
			{
			items = {'default:gold_lump'},
			rarity = 15,
			},
			{
			items = {'default:mese_crystal'},
			rarity = 25,
			},
		},
	},
})
