--Author: Pablo.R, License: LGPL2+
--Created from Influenza pathogen demo by bas080 license WTFPL
--2016/04/26: Some fixes due to API changes  

pathogen.register_pathogen("flu", {
  description = "Highly contagious and possibly deadly for those with low health.",
  symptoms = 75,
  latent_period = 10,
  infection_period = 740,
  on_infect = function(player_name)
    local _player = minetest.get_player_by_name(player_name)
    local _pos = _player:getpos()
    minetest.sound_play("pathogen_cough", { pos = _pos, gain = 0.3 } )
    print("[Diseases] Player " .. player_name .. " caught the flu...")
  end,
  on_symptom = function(player_name)
    local _player = minetest.get_player_by_name(player_name)
    local pos = _player:getpos()
    local players_nearby = pathogen.get_players_in_radius(pos, 5)
    local hp = _player:get_hp()
    if hp <= 20 and hp >= 15 then
      _player:set_hp( hp - 2 ) 
    end
    if hp < 15 and hp >= 10 then
      _player:set_hp( hp - 1 ) 
    end
    if hp < 10 then
      if math.random(10) <= 5 then
        hp = hp - 1
      end
      _player:set_hp( hp ) 
    end
    if math.random(2) == 1 then
    minetest.sound_play("pathogen_sneeze", { pos = pos, gain = 0.5 } )
    else
    minetest.sound_play("pathogen_cough", { pos = pos, gain = 0.3 } )
    end
    for index, player_nearby in ipairs(players_nearby) do
      local player_nearby_name = player_nearby:get_player_name()
      if player_nearby_name ~= player_name then
        if math.random(3) == 1 then
          pathogen.infect("flu", player_nearby_name)
        end
      end
    end
  end
})

--Caught the flu when the player take a bath at night
--TODO: Add Other conditions
local function getFlu(dtime)
  local daytime = minetest.get_timeofday() * 24000
  if (daytime < 5000) or (daytime > 20000) then
    for _,player in ipairs(minetest.get_connected_players()) do
      --check if player is alive
      if player:get_hp() > 0 then
		local posAux = player:getpos()
        local nodeAux = minetest.get_node(posAux)
        --it is a bad time to take a bath
        if (minetest.get_item_group(nodeAux.name, "water") ~= 0) then
          pathogen.infect("flu", player:get_player_name())
        end
       end
     end
  end
end

minetest.register_globalstep(getFlu)
