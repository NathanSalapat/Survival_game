local path = minetest.get_modpath("mobs")

-- Mob Api

dofile(path.."/api.lua")

-- Animals

dofile(path.."/chicken.lua") -- JKmurray
dofile(path.."/rat.lua") -- PilzAdam
dofile(path.."/sheep.lua") -- PilzAdam
dofile(path.."/warthog.lua") -- KrupnoPavel
dofile(path.."/bunny.lua") -- ExeterDad
dofile(path.."/kitten.lua") -- Jordach/BFD
dofile(path.."/spider.lua") --

-- Mob Items
dofile(path.."/crafts.lua")

print ("[MOD] Mobs Redo loaded")
