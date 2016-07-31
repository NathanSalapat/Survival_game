
local path = minetest.get_modpath("animals")

-- Intllib
local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s) return s end
end
mobs.intllib = S

-- Animals
-- Creators of the models listed behind the file load lines.

dofile(path .. "/chicken.lua") -- JKmurray
dofile(path .. "/cow.lua") -- NathanS21
dofile(path .. "/rat.lua") -- PilzAdam
dofile(path .. "/sheep.lua") -- PilzAdam
dofile(path .. "/warthog.lua") -- KrupnoPavel
dofile(path .. "/bunny.lua") -- ExeterDad
dofile(path .. "/kitten.lua") -- Jordach/BFD
dofile(path .. "/goat.lua") -- NathanS21
dofile(path .. "/dog.lua") -- NathanS21
dofile(path .. "/silverfish.lua") -- NathanS21
dofile(path .. "/materials.lua") -- animal materials, not food though, that's in the food mod.

print (S("[MOD] Mobs Redo 'Animals' loaded"))
