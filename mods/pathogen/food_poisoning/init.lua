pathogen.register_pathogen("food_poisoning", {
  description = "Symptoms include vomiting and loss of health.",
  symptoms = 10,
  latent_period = 10,
  infection_period = 600,
  on_infect = function( infection )
    print "gah, I've been poisoned."
    local _player = minetest.get_player_by_name( infection.player )
    local _pos = _player:getpos()
    minetest.sound_play( "pathogen_cough", { pos = _pos, gain = 0.3 } )
  end,
  on_symptom = function( infection )
    local player = minetest.get_player_by_name( infection.player )
    local pos = player:getpos()
    local burp = function()
      if math.random(2) == 1 then
        return 'pathogen_burp_1'
      else
        return 'pathogen_burp_2'
      end
    end
    local contaminate = function( pos )
      local contaminate_pos = {
        x = pos.x + math.random( -5,5 ),
        y = pos.y + math.random( -5,5 ),
        z = pos.z + math.random( -5,5 )
      }
      pathogen.contaminate( contaminate_pos )
    end
    local hp = player:get_hp()
    if hp <= 5 then
      player:set_hp( hp - 1 ) 
    end
    if math.random(25) == 1 then
      pathogen.spawn_fluid( "feces", pos, infection.pathogen )
      minetest.sound_play( "pathogen_poop", { pos = pos, gain = 0.3} )
    else
      minetest.sound_play( burp(), { pos = pos, gain = 0.3 } )
    end
    for i=0,3 do
      contaminate( pos )
    end
  end
})
