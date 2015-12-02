local path = minetest.get_modpath("mobs")

-- Mob Api

dofile(path.."/api.lua")

-- Animals

dofile(path.."/chicken.lua") -- JKmurray
dofile(path.."/cow.lua") -- KrupnoPavel
dofile(path.."/rat.lua") -- PilzAdam
dofile(path.."/sheep.lua") -- PilzAdam
dofile(path.."/warthog.lua") -- KrupnoPavel
dofile(path.."/bee.lua") -- KrupnoPavel
dofile(path.."/bunny.lua") -- ExeterDad
dofile(path.."/kitten.lua") -- Jordach/BFD

-- Monsters
dofile(path.."/spider.lua") -- AspireMint

-- Mob Items
dofile(path.."/crafts.lua")

print ("[MOD] Mobs Redo loaded")
