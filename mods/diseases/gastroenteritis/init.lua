--Author: Pablo.R, License: LGPL2+
--2016/04/26: Some fixes due to API changes  

--list of food that infect gastroenteritis
local gastroenteritis_food = {
"food:pork_raw",
"food:steak_raw",
"mobs:chicken_raw",
"mobs:meat_raw",
"mobs:steak_raw",
"mobs:chicken_raw"
}

pathogen.register_pathogen("gastroenteritis", {
  description = "Possibly deadly for those with low health (Not contagious).",
  symptoms = 100,
  latent_period = 10,
  infection_period = 1000,
  on_infect = function(player_name)
    local _player = minetest.get_player_by_name(player_name)
    local _pos = _player:getpos()
    minetest.sound_play( "pathogen_bleed", { pos = _pos, gain = 0.3 } )
    print("[Diseases] Player " .. player_name .. " caught gastroenteritis...")
  end,
  on_symptom = function(player_name)
    local _player = minetest.get_player_by_name(player_name)
    local pos = _player:getpos()
    local hp = _player:get_hp()
    if hp <= 20 and hp >= 10 then
      _player:set_hp( hp - 2 ) 
    end
    if hp < 10 then
      if math.random(10) <= 5 then
        hp = hp - 1
      end
      _player:set_hp( hp ) 
    end
     minetest.sound_play("pathogen_bleed", { pos = pos, gain = 0.5 }) --replace by proper sound
    --TODO: add compatibility with thirst
  end
})

--Caught the gastroenteritis when the player eat raw chicken meat
local function getGastroenteritis (hp_change, replace_with_item, itemstack, player, pointed_thing)

  local item = itemstack:get_name()
   
  --no player do default logic
  if not player:is_player() then
    return false
  end

  --if player eat raw meat, must caugth gastroenteritis
  for i,food in ipairs(gastroenteritis_food) do
    if food == item then
      pathogen.infect("gastroenteritis", player:get_player_name())
    end
   end

   --this force the execution of original logic after processing gastroenteritis logic
   return false
end

minetest.register_on_item_eat(getGastroenteritis)
