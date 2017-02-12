minetest.register_node('furniture:table', {
	description = 'Table',
	drawtype = 'mesh',
	mesh = 'furniture_table.obj',
	tiles = {'default_wood.png'},
	groups = {choppy=2,oddly_breakable_by_hand=2},
	paramtype = 'light',
	paramtype2 = 'facedir',
})

minetest.register_node('furniture:wall_cabinet', {
	description = 'Wall Mounted Cabinet',
	drawtype = 'mesh',
	mesh = 'furniture_wall_cabinet.obj',
	tiles = {'default_wood.png', 'default_junglewood.png'},
	groups = {choppy=2,oddly_breakable_by_hand=2},
	paramtype = 'light',
	paramtype2 = 'facedir',
   selection_box = {
      type = 'fixed',
      fixed = {-.4, -.3, -.3, .4, .4, .5},
      },
   collision_box = {
      type = 'fixed',
      fixed = {-.4, -.3, -.3, .4, .4, .5},
      },
   on_construct = function(pos)
   	local meta = minetest.env:get_meta(pos)
   	local inv = meta:get_inventory()
   	inv:set_size('main', 6*3)
      meta:set_string('infotext', 'Cabinet')
      meta:set_string('name', 'stuff')
   	meta:set_string('formspec',
      "size[8,8.5]"..
--      default.gui_bg..
      default.gui_bg_img..
      default.gui_slots..
      'field[1.25,0.3;3,1;sname;;${name}]'..
      'button[4,0;2,1;save;Save]'..
      "list[current_name;main;1,.9;6,3;]"..
      "list[current_player;main;0,4.45;8,1;]"..
      "list[current_player;main;0,5.68;8,3;8]"..
      "listring[current_name;main]"..
      "listring[current_player;main]")
   end,
   on_receive_fields = function(pos, formname, fields, sender)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if fields ['save'] then
         meta:set_string('infotext', 'Cabinet ('..fields.sname..')')
         meta:set_string('name', fields.sname)
      end
   end,
   can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
      if inv:is_empty("main") then
         return true
      else
         return false
      end
	end,
})

minetest.register_node('furniture:spinning_wheel', {
	description = 'Spinning Wheel',
	drawtype = 'mesh',
	mesh = 'furniture_spinning_wheel.obj',
	tiles = {'furniture_spinning_wheel.png'},
	groups = {choppy=2,oddly_breakable_by_hand=2},
	paramtype = 'light',
	paramtype2 = 'facedir',
   selection_box = {
      type = 'fixed',
      fixed = {-.3, -.5, -.5, .3, .5, .5},
      },
   collision_box = {
      type = 'fixed',
      fixed = {-.3, -.5, -.5, .3, .5, .5},
      },
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size('main', 8*4)
		inv:set_size('src', 1)
		inv:set_size('dst', 1)
      meta:set_string('infotext', 'Spinning Wheel')
		meta:set_string('formspec',
			'size [8,7]'..
         'label[.5,.5;Spin thread out of other materials.]'..
         'label[.5,1;Place wool or cotton in the top slot.]'..
         'button[1,1.5;2.5,1;start;Start Spinning]'..
         'list[current_name;src;6.5,.5;1,1;]'..
         'list[current_name;dst;6.5,1.5;1,1;]'..
         'list[current_player;main;0,3;8,4;]')
	end,
   on_receive_fields = function(pos, formname, fields, sender)
      if fields ['start'] then
         local meta = minetest.env:get_meta(pos)
         local inv = meta:get_inventory()
         local timer = minetest.get_node_timer(pos)
         local instack = inv:get_stack("src", 1)
         if instack:get_name() == 'wool:white' then
            timer:start(20)
            meta:set_string('infotext', 'Spinning Wheel (Making Thread)')
         end
      end
   end,
   on_timer = function(pos)
      local meta = minetest.env:get_meta(pos)
      meta:set_string('infotext', 'Spinning Wheel')
      local timer = minetest.get_node_timer(pos)
      local inv = meta:get_inventory()
      local instack = inv:get_stack("src", 1)
      local outstack = inv:get_stack("dst", 1)
      if instack:get_name() == 'wool:white' then
         meta:set_string('infotext', 'Spinning Wheel (Making Thread)')
         local new_count = outstack:get_count() + 36
         instack:take_item(1)
         inv:set_stack('src', 1, instack)
         inv:set_stack('dst', 1,'farming:cotton '..new_count)
         timer:start(20)
      end
--[[      if instack:get_name() == 'cotton' then
         local new_count = outstack:get_count() + 3
         instack:take_item(1)
         inv:set_stack('src', 1, instack)
         inv:set_stack('dst', 1,'thread '..new_count)
         timer:start(5)
      end
      --]]
   end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
      if inv:is_empty("src") and
         inv:is_empty("dst") then
         return true
      else
         return false
      end
	end,
})

minetest.register_node('furniture:loom', {
	description = 'Weaving Loom',
	drawtype = 'mesh',
	mesh = 'furniture_loom.obj',
	tiles = {'furniture_loom.png'},
	groups = {choppy=2,oddly_breakable_by_hand=2},
	paramtype = 'light',
	paramtype2 = 'facedir',
   selection_box = {
      type = 'fixed',
      fixed = {{-.4, -.5, -.5, .4, -.35, .5},
               {-.4, -.35, -.1, .4, .22, .1},}
      },
   collision_box = {
      type = 'fixed',
      fixed = {{-.4, -.5, -.5, .4, -.35, .5},
               {-.4, -.35, -.1, .4, .22, .1},}
      },
   sounds = default.node_sound_wood_defaults(),
   on_construct = function(pos)
      local meta = minetest.env:get_meta(pos)
      local inv = meta:get_inventory()
      inv:set_size('main', 8*4)
      inv:set_size('src', 1)
      inv:set_size('dst', 1)
      meta:set_string('infotext', 'Weaving Loom')
      meta:set_string('formspec',
         'size [8,7]'..
         'label[3.5,.75;Place thread here -->]'..
         'list[current_name;src;6.5,.5;1,1;]'..
         'list[current_name;dst;6.5,1.5;1,1;]'..
         'button[1,1;2,1;start;Start]'..
         'list[current_player;main;0,3;8,4;]')
   end,
   on_receive_fields = function(pos, formname, fields, sender)
      if fields ['start'] then
         local meta = minetest.env:get_meta(pos)
         local inv = meta:get_inventory()
         local timer = minetest.get_node_timer(pos)
         local instack = inv:get_stack("src", 1)
         if instack:get_name() == 'farming:cotton' and instack:get_count() >= 9 then
            timer:start(5)
         end
      end
   end,
   on_timer = function(pos)
      local original = minetest.get_node(pos)
      minetest.swap_node(pos, {name = 'furniture:loom_fabric', param2=original.param2})
      local meta = minetest.env:get_meta(pos)
      local timer = minetest.get_node_timer(pos)
      local inv = meta:get_inventory()
      local instack = inv:get_stack("src", 1)
      local outstack = inv:get_stack("dst", 1)
      local new_count = outstack:get_count() + 1
      instack:take_item(9)
      inv:set_stack('src', 1, instack)
      inv:set_stack('dst', 1,'furniture:cloth '..new_count)
      if instack:get_name() == 'farming:cotton' and instack:get_count() >= 9 then
         timer:start(5)
      end
   end,
   can_dig = function(pos,player)
      local meta = minetest.get_meta(pos);
      local inv = meta:get_inventory()
      if inv:is_empty("src") and
         inv:is_empty("dst") then
         return true
      else
         return false
      end
   end,
})


minetest.register_node('furniture:loom_fabric', {
	description = 'Weaving Loom',
	drawtype = 'mesh',
	mesh = 'furniture_loom_fabric.obj',
	tiles = {'furniture_loom.png'},
	groups = {choppy=2,oddly_breakable_by_hand=2, not_in_creative_inventory=1},
	paramtype = 'light',
	paramtype2 = 'facedir',
   selection_box = {
      type = 'fixed',
      fixed = {{-.4, -.5, -.5, .4, -.35, .5},
               {-.4, -.35, -.1, .4, .22, .1},}
      },
   collision_box = {
      type = 'fixed',
      fixed = {{-.4, -.5, -.5, .4, -.35, .5},
               {-.4, -.35, -.1, .4, .22, .1},},
      },
   sounds = default.node_sound_wood_defaults(),
   on_construct = function(pos)
      local meta = minetest.env:get_meta(pos)
      local inv = meta:get_inventory()
      inv:set_size('main', 8*4)
      inv:set_size('src', 1)
      inv:set_size('dst', 1)
      meta:set_string('infotext', 'Weaving Loom')
      meta:set_string('formspec',
         'size [8,7]'..
         'label[3.5,.75;Place thread here -->]'..
         'list[current_name;src;6.5,.5;1,1;]'..
         'list[current_name;dst;6.5,1.5;1,1;]'..
         'button[1,1;2,1;start;Start]'..
         'list[current_player;main;0,3;8,4;]')
   end,
   on_timer = function(pos)
      local meta = minetest.env:get_meta(pos)
      local timer = minetest.get_node_timer(pos)
      local inv = meta:get_inventory()
      local instack = inv:get_stack("src", 1)
      local outstack = inv:get_stack("dst", 1)
      local new_count = outstack:get_count() + 1
      instack:take_item(9)
      inv:set_stack('src', 1, instack)
      inv:set_stack('dst', 1,'furniture:cloth '..new_count)
      if instack:get_name() == 'farming:cotton' and instack:get_count() >= 9 then
         timer:start(5)
      end
   end,
   on_metadata_inventory_take = function (pos, listname, index, stack, player)
      local meta = minetest.env:get_meta(pos)
      local inv = meta:get_inventory()
      local outstack = inv:get_stack('dst', 1)
      local outstack_count = outstack:get_count()
      if outstack_count == 0 then
         local original = minetest.get_node(pos)
         minetest.swap_node(pos, {name = 'furniture:loom', param2=original.param2})
      end
   end,
   can_dig = function(pos,player)
      local meta = minetest.get_meta(pos);
      local inv = meta:get_inventory()
      if inv:is_empty("src") and
         inv:is_empty("dst") then
         return true
      else
         return false
      end
   end,
})
