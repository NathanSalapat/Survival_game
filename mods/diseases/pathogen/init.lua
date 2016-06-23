--Pablo.R, 2016/04/26: Add pathogens to persistent player data.
--                     Was required a mayor rewrite of pathogen mod
--                     because the data structures of the mod was changed

pathogen = {
  pathogens = {},
  player_infections = {},
  fluids = {},
}

dofile( minetest.get_modpath( "pathogen" ) .. "/options.lua" ) --WIP
dofile( minetest.get_modpath( "pathogen" ) .. "/recipes.lua")
dofile( minetest.get_modpath( "pathogen" ) .. "/api.lua" )
dofile( minetest.get_modpath( "pathogen" ) .. "/tools.lua" )
dofile( minetest.get_modpath( "pathogen" ) .. "/crafts.lua" )
dofile( minetest.get_modpath( "pathogen" ) .. "/nodes.lua" )
dofile( minetest.get_modpath( "pathogen" ) .. "/commands.lua" )
