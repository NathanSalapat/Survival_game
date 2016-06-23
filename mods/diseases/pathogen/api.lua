--Pablo.R, 2016/04/26: Add pathogens to persistent player data.
--                     Was required some rewrite of pathogen mod because
--                     the data structures of the mod must be changed
--                     Now it is not compatible with the original.


-----------
--PATHOGENS
-----------

--checks if pathogen is registered and registers if not
pathogen.register_pathogen = function(pathogen_name, definition)
  if not pathogen.get_pathogen( pathogen_name ) then
    definition.name = pathogen_name;
    pathogen.pathogens[pathogen_name] = definition
    return pathogen.pathogens[pathogen_name]
  else
    return false
  end
end


--get the table of a particular pathogen
pathogen.get_pathogen = function(pathogen_name)
  return pathogen.pathogens[pathogen_name]
end


--gives all the pathogens that are registered
pathogen.get_pathogens = function()
  return pathogen.pathogens
end


--------------
--CONTAMINENTS
--------------

--spawn the infectious juices
pathogen.spawn_fluid = function(name, pos, pathogen_name)
  if minetest.get_node(pos).name == "air" then
    local node_name = "pathogen:fluid_"..name
    minetest.set_node(pos, { name = node_name, param2=1 } )
    pathogen.contaminate(pos, pathogen_name )
  end
end


--registering a fluid(juice). This assumes that all fluids are flat on the floor
pathogen.register_fluid = function(name)
  local texture = "pathogen_fluid_"..name..".png"
  local node_name = "pathogen:fluid_"..name
  pathogen.fluids[ name ] = node_name
  minetest.register_node( node_name, {
    description= name,
    drawtype = "signlike",
    inventory_image = texture,
    tiles = { texture },
    paramtype = "light",
    paramtype2 = "wallmounted",
    walkable = false,
    sunlight_propagates = true,
    drop = "",
    groups = { oddly_breakable_by_hand = 2, crumbly = 2 },
    on_punch = function(pos, node, puncher, pointed_thing)
      local meta = minetest.get_meta( pos )
      local pathogen_name = meta:get_string("pathogen")
      local player_name = puncher:get_player_name()
      pathogen.infect(pathogen_name, player_name)
    end,
    selection_box = {
      type = "fixed",
      fixed = {-0.5, -0.5, -0.5, 0.5, -7.9/16, 0.5},
    },
  })
end


--contaminates a node which when dug infects the player that dug the node
pathogen.contaminate = function(pos, pathogen_name )
  local meta = minetest.get_meta(pos)
  if meta then
    meta:set_string('pathogen', pathogen_name)
    return true
  else
    return false
  end
end


--remove the contamination from the node
pathogen.decontaminate = function(pos)
  local meta = minetest.get_meta(pos)
  if meta then
    local str = meta:get_string('pathogen')
    if str ~= '' then
      meta:set_string('pathogen', '')
      return true
    else
      return false
    end
  else
    return false
  end
end


--used to check if the node is infected and to get the name of the pathogen
--with which it is infected
pathogen.get_contaminant = function(pos)
  local meta = minetest.get_meta(pos)
  if not meta then return false end
  local pathogen_name = meta:get_string('pathogen')
  if pathogen_name then
    if pathogen_name ~= '' then
      return pathogen_name
    else
      return false
    end
  else
    return false
  end
end


------------
--INFECTIONS
------------

--infects the player with a pathogen. If not able returns false
pathogen.infect = function(pathogen_name, player_name)

  local pathogenAux = pathogen.pathogens[pathogen_name]
  --pathogen unknown exit
  if pathogenAux == nil then return false end
  --player unknown exit
  if minetest.get_player_by_name(player_name) == nil then return false end
  
  --player infections not defined, define it
  if pathogen.player_infections[player_name] == nil then 
    pathogen.player_infections[player_name] = {}
  end

  local infection = pathogen.player_infections[player_name][pathogen_name]
  if (infection ~= nil) then
    --return false if player is immune
    if (infection.immune) then
      return false 
	  --else reinfect and exit
	  else 
      pathogen.player_infections[player_name][pathogen_name].symptom = 0
      pathogen.save_player_infection(player_name, pathogen_name)
	    return true
	  end
  end

  --Continue with first infection
  --The table containing all the data that a infection consists out of. See
  --the README.md for a more extensive explanation
  local infection = {
    symptom = 0,
    immune = false,
  }

  pathogen.player_infections[player_name][pathogen_name] = infection
  pathogen.save_player_infection(player_name, pathogen_name)
  
  --check if on_infect has been registered in pathogen, then
  --perform the on_infect command that is defined in the regiter function
  --this is not the same as the on_symptoms. It is called only once at the
  --beginning of the infection
  local on_infect = pathogenAux.on_infect
  if on_infect then
    if minetest.get_player_by_name(player_name) then
      on_infect(player_name)
	end
  end

  --schedule the first symptom
  --latent period is the time till the first symptom shows
  minetest.after(pathogen.pathogens[pathogen_name].latent_period, function()
    pathogen.perform_symptom(pathogen_name, player_name)
  end)
  return infection
end


--An infection can also be initiated without having to perform the on_infect.
pathogen.perform_symptom = function(infection_name, player_name)
  
  local pathogenAux = pathogen.pathogens[infection_name]
 
  --pathogen unknown exit
  if pathogenAux == nil then return false end
  --player unknown exit
  if minetest.get_player_by_name(player_name) == nil then return false end
  -- dead players can't be ill
  if minetest.get_player_by_name(player_name):get_hp() <= 0 then return false end

  --player infections not defined, define it
  if pathogen.player_infections[player_name] == nil then 
    pathogen.player_infections[player_name] = {}
  end

  --if player not infected, infect him
  if pathogen.player_infections[player_name][infection_name] == nil then
    pathogen.player_infections[player_name][infection_name] = {symptom = 0, immune = false}
  end

  local infectionAux = pathogen.player_infections[player_name][infection_name]
  --only keep showing symptoms if there is no immunity against the pathogen
  if infectionAux.immune then return false end
  
  --check if all symptoms have occured
  --only show symptoms if not all symptoms have occured.
  if (pathogenAux.symptoms >= infectionAux.symptom) then 
    local on_symptom = pathogenAux.on_symptom
    if on_symptom then 
      if minetest.get_player_by_name(player_name) then
        on_symptom(player_name)
      end
    end

    --set the time until the next symptom and then schedule it again
    local interval = ((pathogenAux.infection_period - pathogenAux.latent_period) / pathogenAux.symptoms)
    minetest.after(interval, function()
      pathogen.perform_symptom(infection_name, player_name)
    end)
    pathogen.player_infections[player_name][infection_name].symptom = infectionAux.symptom + 1
    pathogen.save_player_infection(player_name, infection_name)
    return true

  --survives and is now immunized, immunization lasts untill...
  elseif (infection.pathogen.symptoms < infectionAux.symptom) then
    local on_recover = pathogenAux.on_recover
    if on_recover and (pathogenAux.symptoms + 1 == symptom) then
      pathogen.immunize(infection_name, player_name)
      on_recover(player_name)
      return true
    else
      return false
    end
  else
    return false
  end
end


--immunize a player so the next symptom won't show. It also disables the
--abilty to reinfect the player. Use pathogen.disinfect to also remove
--the immunization It will also trigger the on_cured when the next symptom
--would have triggered.
pathogen.immunize = function(infection_name, player_name)

  --pathogen unknown
  if pathogenAux == nil then return false end
  --player unknown
  if minetest.get_player_by_name(player_name) == nil then return false end
  --player not infected
  if pathogen.player_infections[player_name][infection_name] == nil then return false end
  --player is immune
  if pathogen.player_infections[player_name][infection_name].immune == true then
    --do not immunize if alread y immunized, return false
    --
    return false
  else
    --else immunize the player and return true
    pathogen.player_infections[player_name][infection_name].immune = true
	pathogen.save_player_infection(player_name, infection_name)
    return true
  end
end


--removes the immunization and the infection all together
pathogen.disinfect = function(infection_name, player_name)
  if pathogen.player_infections[player_name][infection_name ] then
    --only is the is infected does it do this, return true
    pathogen.player_infections[player_name][infection_name ] = nil
	pathogen.delete_player_infection(player_name, infection_name)
    return true
  else
    -- else it will only return false
    return false
  end
end


--get an infection of a certain player
pathogen.get_infection = function( player_name,  pathogen_name )
  if player_name and pathogen_name then
    --only if the infection is registered
	if pathogen.player_infections[player_name] then
      return pathogen.player_infections[player_name][pathogen_name]
	end
  else
    --otherwise return nil
    return nil
  end
end


--gives all the infections of all the players. If not infections are defined
--it returns an empty table. That's it.
pathogen.get_infections = function( )
  return pathogen.player_infections
end


--helper function for getting the infections of a certain player
pathogen.get_player_infections = function( player_name )
  return pathogen.player_infections[player_name]
end


-------------
--PERSISTENCE
-------------

local BooleanToNumber = function (val)
 if val then
   return 1
 else
   return 0
 end
end

local NumberToBoolean = function (val)
 if val == 0 then
   return false
 else
   return true
 end
end

local BooleanToString = function (val)
 if val then
   return "true"
 else
   return "false"
 end
end

--Pablo.R: Save player infection data so it won't get lost between server reloads
pathogen.save_player_infection = function(player_name, infection_name)
  local player = minetest.get_player_by_name(player_name)
  local inv = player:get_inventory()
  local listName = "pathogen_" .. infection_name
  local infection = pathogen.player_infections[player_name][infection_name]
  
  --name = ":" because it need to be a valid minetest item
  --count = 0 == empty
  --ItemStack table format example: {name="default:apple", count=5, wear=0, metadata=""}
  inv:set_size(listName, 2)
  inv:set_stack(listName, 1, ItemStack({name = ":", count = infection.symptom}))
  inv:set_stack(listName, 2, ItemStack({name = ":", count = BooleanToNumber(infection.immune)}))
  
end


--Pablo.R: Delete player infections
pathogen.delete_player_infections = function(player_name)
  local player = minetest.get_player_by_name(player_name)
  local inv = player:get_inventory()

  for index, def in pairs (pathogen.pathogens) do
    pathogen.delete_player_infection(player_name, index)
  end
end

  
--Pablo.R: Delete player infection
pathogen.delete_player_infection = function(player_name, infection_name)
  local player = minetest.get_player_by_name(player_name)
  local inv = player:get_inventory()
  local listName = "pathogen_" .. infection_name

  if not inv:is_empty(listName) then
    inv:set_list(listName, {})
  end
  
end


--Pablo.R: reinfect the players when they rejoin the server. it remembers the
-- infection fase thus the infection continues and does not get reset.
pathogen.on_joinplayer = function(player)
  local inv = player:get_inventory()
  local player_name = player:get_player_name()
  pathogen.player_infections[player_name] = {}
  
  for index, def in pairs (pathogen.pathogens) do
    local listName = "pathogen_" .. index
    if not inv:is_empty(listName) then
      pathogen.player_infections[player_name][index] = {}
      pathogen.player_infections[player_name][index].symptom = inv:get_stack(listName, 1):get_count()
      pathogen.player_infections[player_name][index].immune = NumberToBoolean(inv:get_stack(listName, 2):get_count())
      print("[Diseases] Player " .. player_name .. " has " .. index .. " infection (symptom = " .. pathogen.player_infections[player_name][index].symptom .. ", immune = " .. BooleanToString(pathogen.player_infections[player_name][index].immune) .. ")")
    end	
  end
end


minetest.register_on_joinplayer( function( player )
  pathogen.on_joinplayer( player )
end)


---------
--HELPERS
---------

--helper to get players within the radius.
pathogen.get_players_in_radius = function( pos, radius )
  local objects = minetest.get_objects_inside_radius(pos, 5)
  local players = {}
  for index, object in ipairs(objects) do
    --loops threw all objects in within a radius
    ----
    if object:is_player() then
      --and check if the object is a player
      players[#players+1] = object
    end
  end
  return players
end


--when dying while having a pathogen it will trigger the on_death of the
--pathogen and it will remove all player infections
pathogen.on_dieplayer = function(player)
  local player_name = player:get_player_name()

  --no infections: exit
  if pathogen.player_infections[player_name] == nil then return false end
  
  --loops through the player infections
  local _infections = pathogen.player_infections[player_name]
  for index, infection in pairs(_infections) do
    local _pathogen = pathogen.get_pathogen(index)
    --checks if it is a valid and still registered pathogen
    if _pathogen then
      local on_death = _pathogen.on_death
      --it then triggers the on_death if the on_death is defined
      if on_death then
        on_death(player_name)
      end
    end
  end

  pathogen.player_infections[player_name] = {}
  pathogen.delete_player_infections(player_name)
  return false
end


--infects players that dig a node that is infected with a pathogen
pathogen.on_dignode = function( pos, digger )
  local pathogen_name = pathogen.get_contaminant( pos )
  if pathogen_name then
    local _pathogen = pathogen.get_pathogen( pathogen_name )
    local player_name = digger:get_player_name( )
    return pathogen.infect(pathogen_name, player_name)
  end
  return false
end


minetest.register_on_dignode( function( pos, oldnode, digger)
  pathogen.on_dignode( pos, digger )
end)


minetest.register_on_dieplayer( function( player )
  pathogen.on_dieplayer( player )
end)

