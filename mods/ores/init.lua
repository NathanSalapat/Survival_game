ores = {

material_table = {
   {'copper'},
}
}

dofile(minetest.get_modpath('ores').."/crafts.lua")
dofile(minetest.get_modpath('ores').."/items.lua")
dofile(minetest.get_modpath('ores').."/mapgen.lua")
dofile(minetest.get_modpath('ores').."/nodes.lua")
