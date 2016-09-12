--Craft Recipes

minetest.register_craft({
      output = 'food:juice_press',
      recipe = {
         {'default:stick', 'default:steel_ingot', 'default:stick'},
         {'default:stick', 'bucket:bucket_empty', 'default:stick'},
         {'stairs:slab_wood', 'stairs:slab_wood', 'vessels:drinking_glass'},
         }
})

minetest.register_craft({
      output = 'food:liquid_barrel',
      recipe = {
         {'group:wood', 'group:wood', 'group:wood'},
         {'group:wood', 'group:wood', 'group:wood'},
         {'stairs:slab_wood', '', 'stairs:slab_wood'},
         }
})

minetest.register_node('food:juice_press', {
   description = 'Juice Press',
   drawtype = 'mesh',
   mesh = 'food_press.obj',
   tiles = {name='food_press.png'},
--   inventory_image = 'foodpress.png',
   groups = {choppy=2, dig_immediate=2,},
   paramtype = 'light',
   paramtype2 = 'facedir',
   selection_box = {
      type = 'fixed',
      fixed = {-.5, -.5, -.5, .5, .5, .5},
      },
   collision_box = {
      type = 'fixed',
      fixed = {-.5, -.5, -.5, .5, .5, .5},
      },
   on_construct = function(pos)
      local meta = minetest.env:get_meta(pos)
      local inv = meta:get_inventory()
      inv:set_size('main', 8*4)
      inv:set_size('src', 1)
      inv:set_size('dst', 1)
      meta:set_string('infotext', 'Empty Juice Press')
      meta:set_string('formspec',
         'size[8,7]'..
         'label[1.5,0;Organic juice is just a squish away.]' ..
         'label[4.3,.75;Put fruit here ->]'..
         'label[3.5,1.75;Put container here ->]'..
         'button[1,1;2,1;press;Start Juicing]'..
         'list[current_name;src;6.5,.5;1,1;]'..
         'list[current_name;dst;6.5,1.5;1,1;]'..
         'list[current_player;main;0,3;8,4;]')
   end,
   on_receive_fields = function(pos, formname, fields, sender)
      local meta = minetest.env:get_meta(pos)
      local inv = meta:get_inventory()
      local timer = minetest.get_node_timer(pos)
      local instack = inv:get_stack("src", 1)
      local fruitstack = instack:get_name()
      local fruit = string.sub(fruitstack, 6, -1)
      meta:set_string('fruit', fruit)
      local outstack = inv:get_stack("dst", 1)
      local vessel = outstack:get_name()
      if vessel == 'vessels:drinking_glass'then
         if instack:get_count() >= 2 then
            meta:set_string('container', 'jc_')
            meta:set_string('fruitnumber', 2)
            meta:set_string('infotext', 'Juicing...')
            timer:start(4)
         else
            meta:set_string('infotext', 'You need more fruit.')
         end
      end
      if vessel == 'bucket:bucket_empty' then
         if instack:get_count() >= 8 then
            meta:set_string('container', 'jbu_')
            meta:set_string('fruitnumber', 8)
            meta:set_string('infotext', 'Juicing...')
            timer:start(16)
         else
            meta:set_string('infotext', 'You need more fruit.')
         end
      end
   end,
   on_timer = function(pos)
      local meta = minetest.env:get_meta(pos)
      local inv = meta:get_inventory()
      meta:set_string('infotext', 'Collect your juice.')
      local instack = inv:get_stack("src", 1)
      local outstack = inv:get_stack("dst", 1)
      local container = meta:get_string('container')
      local fruit = meta:get_string('fruit')
      local fruitnumber = tonumber(meta:get_string('fruitnumber'))
      instack:take_item(tonumber(fruitnumber))
      inv:set_stack('src', 1, instack)
      inv:set_stack('dst', 1 ,'food:'..container..fruit)
   end,
   on_metadata_inventory_take = function(pos, listname, index, stack, player)
      local meta = minetest.env:get_meta(pos)
      local inv = meta:get_inventory()
      meta:set_string('infotext', 'Ready for more juicing.')
   end,
   on_metadata_inventory_put = function(pos, listname, index, stack, player)
      local meta = minetest.env:get_meta(pos)
      local inv = meta:get_inventory()
      meta:set_string('infotext', 'Ready for juicing.')
   end,
   can_dig = function(pos)
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

minetest.register_node('food:liquid_barrel', {
   description = 'Barrel of Liquid',
   drawtype = 'mesh',
   mesh = 'food_liquid_barrel.obj',
   tiles = {name='food_barrel.png'},
--   inventory_image = 'foodbarrel.png',
   groups = {choppy=2, dig_immediate=2,},
   paramtype = 'light',
   paramtype2 = 'facedir',
   selection_box = {
      type = 'fixed',
      fixed = {-.5, -.5, -.5, .5, .5, .5},
      },
   collision_box = {
      type = 'fixed',
      fixed = {-.5, -.5, -.5, .5, .5, .5},
      },
})
