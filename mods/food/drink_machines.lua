--Craft Recipes

minetest.register_craft({
      output = 'food:juice_press',
      recipe = {
         {'default:stick', 'default:steel_ingot', 'default:stick'},
         {'default:stick', 'bucket:bucket_empty', 'default:stick'},
         {'stairs:slab_wood', 'stairs:slab_wood', 'food:drinking_glass'},
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
      if fields ['press'] then
         local meta = minetest.env:get_meta(pos)
         local inv = meta:get_inventory()
         local timer = minetest.get_node_timer(pos)
         local instack = inv:get_stack("src", 1)
         local fruitstack = instack:get_name()
         if minetest.get_item_group(fruitstack, 'juiceable') > 0 then
            local mod, fruit = fruitstack:match("([^:]+):([^:]+)")
            meta:set_string('fruit', fruit)
            local outstack = inv:get_stack("dst", 1)
            local vessel = outstack:get_name()
            if vessel == 'food:drinking_glass' then
               if instack:get_count() >= 4 then
                  meta:set_string('container', 'jcu_')
                  meta:set_string('fruitnumber', 4)
                  meta:set_string('infotext', 'Juicing...')
                  timer:start(4)
               else
                  meta:set_string('infotext', 'You need more fruit.')
               end
            end
            if vessel == 'food:bottle' then
               if instack:get_count() >= 4 then
                  meta:set_string('container', 'jbo_')
                  meta:set_string('fruitnumber', 8)
                  meta:set_string('infotext', 'Juicing...')
                  timer:start(8)
               else
                  meta:set_string('infotext', 'You need more fruit.')
               end
            end
            if vessel == 'bucket:bucket_empty' then
               if instack:get_count() >= 16 then
                  meta:set_string('container', 'jbu_')
                  meta:set_string('fruitnumber', 16)
                  meta:set_string('infotext', 'Juicing...')
                  timer:start(16)
               else
                  meta:set_string('infotext', 'You need more fruit.')
               end
            end
            if vessel == 'default:papyrus' then
               if instack:get_count() >= 2 then
                  local under_node = {x=pos.x, y=pos.y-1, z=pos.z}
                  local under_node_name = minetest.get_node_or_nil(under_node)
                  if under_node_name.name == 'food:liquid_barrel' then
                     local meta_u = minetest.env:get_meta(under_node)
                     local barrel_fruit = meta_u:get_string('fruit')
                     if fruit == barrel_fruit or barrel_fruit == 'empty' then
                        meta:set_string('container', 'tube')
                        meta:set_string('fruitnumber', 2)
                        meta:set_string('infotext', 'Juicing...')
                        meta_u:set_string('fruit', fruit)
                        timer:start(4)
                     else
                        meta:set_string('infotext', "You can't mix juices.")
                     end
                  else
                     meta:set_string('infotext', 'You need more fruit.')
                  end
               end
            end
         end
      end
   end,
   on_timer = function(pos)
      local meta = minetest.env:get_meta(pos)
      local inv = meta:get_inventory()
      local container = meta:get_string('container')
      local instack = inv:get_stack("src", 1)
      local outstack = inv:get_stack("dst", 1)
      local fruit = meta:get_string('fruit')
      local fruitnumber = tonumber(meta:get_string('fruitnumber'))
      if container == 'tube' then --Still needs to take fruit from juice press.
         local timer = minetest.get_node_timer(pos)
         local under_node = {x=pos.x, y=pos.y-1, z=pos.z}
         local under_node_name = minetest.get_node_or_nil(under_node)
         local meta_u = minetest.env:get_meta(under_node)
         local fullness = tonumber(meta_u:get_string('fullness'))
         instack:take_item(tonumber(fruitnumber))
         inv:set_stack('src', 1, instack)
         if fullness + 2 > 128 then
            timer:stop()
            meta:set_string('infotext', 'Barrel is full of juice.')
            return
         else
         local fullness = fullness + 2
         meta_u:set_string('fullness', fullness)
         meta_u:set_string('infotext', 'Barrel of '..fruit..' juice. '..(math.floor((fullness/128)*100))..' % full.')
         meta_u:set_string('formspec', food.barrel_formspec(fullness))
         if instack:get_count() >= 2 then
            timer:start(4)
         else
            meta:set_string('infotext', 'You need more fruit.')
         end
      end
      else
      meta:set_string('infotext', 'Collect your juice.')
      instack:take_item(tonumber(fruitnumber))
      inv:set_stack('src', 1, instack)
      inv:set_stack('dst', 1 ,'food:'..container..fruit)
   end
   end,
   on_metadata_inventory_take = function(pos, listname, index, stack, player)
      local timer = minetest.get_node_timer(pos)
      local meta = minetest.env:get_meta(pos)
      local inv = meta:get_inventory()
      timer:stop()
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

function food.drinks_barrel_sub(liq_vol, ves_typ, pos)
   local meta = minetest.env:get_meta(pos)
   local fullness = tonumber(meta:get_string('fullness'))
   if fullness - liq_vol < 0 then
      return
   else
   local fruit = meta:get_string('fruit')
   local inv = meta:get_inventory()
   local fullness = fullness - liq_vol
   meta:set_string('fullness', fullness)
   meta:set_string('infotext', 'Barrel of '..fruit..' juice. '..(math.floor((fullness/128)*100))..' % full.')
   meta:set_string('formspec', food.barrel_formspec(fullness))
   if ves_typ == 'jcu' or ves_typ == 'jbo' or ves_typ == 'jbu' then
      inv:set_stack('dst', 1, 'food:'..ves_typ..'_'..fruit)
   end
   if ves_typ == 'thirsty:bronze_canteen' then
      inv:set_stack('dst', 1, {name="thirsty:bronze_canteen", count=1, wear=60, metadata=""})
   end
   if ves_typ == 'thirsty:steel_canteen' then
      inv:set_stack('dst', 1, {name="thirsty:steel_canteen", count=1, wear=40, metadata=""})
   end
   end
end

function food.drinks_barrel_add(liq_vol, ves_typ, pos)
   local meta = minetest.env:get_meta(pos)
   local fullness = tonumber(meta:get_string('fullness'))
   if fullness + liq_vol > 128 then
      return
   else
   local fruit = meta:get_string('fruit')
   local inv = meta:get_inventory()
   local fullness = fullness + liq_vol
   meta:set_string('fullness', fullness)
   inv:set_stack('src', 1, ves_typ)
   meta:set_string('infotext', 'Barrel of '..fruit..' juice. '..(math.floor((fullness/128)*100))..' % full.')
   meta:set_string('formspec', food.barrel_formspec(fullness))
   end
end

function food.drinks_barrel(pos, inputstack)
   local meta = minetest.env:get_meta(pos)
   local vessel = string.sub(inputstack, 6, 8)
   if vessel == 'jcu' then
      local liq_vol = 2
      local ves_typ = 'food:drinking_glass'
      food.drinks_barrel_add(liq_vol, ves_typ, pos)
   end
   if vessel == 'jbo' then
      local liq_vol = 4
      local ves_typ = 'food:bottle'
      food.drinks_barrel_add(liq_vol, ves_typ, pos)
   end
   if vessel == 'jbu' then
      local liq_vol = 16
      local ves_typ = 'bucket:bucket_empty'
      food.drinks_barrel_add(liq_vol, ves_typ, pos)
   end
end

minetest.register_node('food:liquid_barrel', {
   description = 'Barrel of Liquid',
   drawtype = 'mesh',
   mesh = 'food_liquid_barrel.obj',
   tiles = {name='food_barrel.png'},
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
      meta:set_string('fullness', 0)
      meta:set_string('fruit', 'empty')
      meta:set_string('infotext', 'Empty Drink Barrel')
      meta:set_string('formspec', 'size[8,8]'..
      'label[0,0;Fill the barrel with the drink of your choice,]'..
      'label[0,.4;you can only add more of the same type of drink.]'..
      'label[4.5,1.2;Add liquid ->]'..
      'label[.75,1.75;The barrel is empty]'..
      'label[4.5,2.25;Take liquid ->]'..
      'label[2,3.2;(This empties the barrel completely)]'..
      'button[0,3;2,1;purge;Purge]'..
      'list[current_name;src;6.5,1;1,1;]'..
      'list[current_name;dst;6.5,2;1,1;]'..
      'list[current_player;main;0,4;8,5;]')
   end,
   on_metadata_inventory_put = function(pos, listname, index, stack, player)
      local meta = minetest.env:get_meta(pos)
      local inv = meta:get_inventory()
      local instack = inv:get_stack("src", 1)
      local outstack = inv:get_stack('dst', 1)
      local inputstack = instack:get_name()
      local outputstack = outstack:get_name()
      local fruit = string.sub(inputstack, 10, -1)
      local fruit_in = meta:get_string('fruit')
      if fruit_in == 'empty' then
         meta:set_string('fruit', fruit)
         local vessel = string.sub(inputstack, 6, 8)
         food.drinks_barrel(pos, inputstack)
      end
      if fruit == fruit_in then
         local vessel = string.sub(inputstack, 6, 8)
         food.drinks_barrel(pos, inputstack)
      end
      if outputstack == 'food:drinking_glass' then
         food.drinks_barrel_sub(2, 'jcu', pos)
      end
      if outputstack == 'food:bottle' then
         food.drinks_barrel_sub(4, 'jbo', pos)
      end
      if outputstack == 'bucket:bucket_empty' then
         food.drinks_barrel_sub(16, 'jbu', pos)
      end
      if outputstack == 'thirsty:steel_canteen' then
         food.drinks_barrel_sub(20, 'thirsty:steel_canteen', pos)
      end
      if outputstack == 'thirsty:bronze_canteen' then
         food.drinks_barrel_sub(30, 'thirsty:bronze_canteen', pos)
      end
   end,
   on_receive_fields = function(pos, formname, fields, sender)
      if fields['purge'] then
         local meta = minetest.env:get_meta(pos)
         local fullness = 0
         meta:set_string('fullness', 0)
         meta:set_string('fruit', 'empty')
         meta:set_string('infotext', 'Empty Drink Barrel')
         meta:set_string('formspec', food.barrel_formspec(fullness))
      end
   end,
})
