--Formspecs for the traps

trap_empty = -- trap just built but with nothing in it.
'size[8,6]'..
'label[2.5,0;Bait the trap to catch game.]' ..
'list[current_name;bait;3.5,.6;1,1;]'..
'list[current_player;main;0,2;8,4;]'

trap_baited = -- trap has bait, just waiting for an animal.
'size[8,6]'..
'label[1,0;Check back often to see if you caught something.]' ..
'list[current_name;bait;2,.6;1,1;]'..
'list[current_name;game;5,.6;1,1;]'..
'list[current_player;main;0,2;8,4;]'

trap_game = -- trap was successful and caught something.
'size[8,6]'..
"label[1.5,0;Put the critter out of it's misery..]" ..
'list[current_name;game;1,.6;1,1;]'..
'button[2.25,1;2.25,1;free_catch;release game]'..
'button[5,1;2.25,1;butcher;harvest game]'..
'list[current_player;main;0,2;8,4;]'

trap_raided = -- oh no, looks like something stole our catch.
'size[5,2]'..
'label[.125,.25;Looks like something stole your catch.]' ..
'button[1.5,1;2,1;reset;reset trap]'

function food.liquid_storage_formspec(fruit, fullness, max)
  local formspec =
  'size[8,8]'..
  'label[0,0;Fill with the drink of your choice,]'..
  'label[0,.4;you can only add more of the same type of drink.]'..
  'label[4.5,1.2;Add liquid ->]'..
  'label[.5,1.2;Storing '..fruit..' juice.]'..
  'label[.5,1.65;Holding '..(fullness/2)..' of '..(max/2)..' cups.]'..
  'label[4.5,2.25;Take liquid ->]'..
  'label[2,3.2;(This empties the container completely)]'..
  'button[0,3;2,1;purge;Purge]'..
  'list[current_name;src;6.5,1;1,1;]'..
  'list[current_name;dst;6.5,2;1,1;]'..
  'list[current_player;main;0,4;8,5;]'
  return formspec
end

press_idle_formspec =
'size[8,7]'..
'label[1.5,0;Organic juice is just a squish away.]' ..
'label[4.3,.75;Put fruit here ->]'..
'label[3.5,1.75;Put container here ->]'..
'label[0.2,1.8;4 fruits to a glass,]'..
'label[0.2,2.1;8 fruits to a bottle,]'..
'label[0.2,2.4;16 fruits to a bucket.]'..
'button[1,1;2,1;press;Start Juicing]'..
'list[current_name;src;6.5,.5;1,1;]'..
'list[current_name;dst;6.5,1.5;1,1;]'..
'list[current_player;main;0,3;8,4;]'

press_running_formspec =
'size[8,7]'..
'label[1.5,0;Organic juice coming right up.]' ..
'label[4.3,.75;Put fruit here ->]'..
'label[3.5,1.75;Put container here ->]'..
'label[0.2,1.8;4 fruits to a glass,]'..
'label[0.2,2.1;8 fruits to a bottle,]'..
'label[0.2,2.4;16 fruits to a bucket.]'..
'button[1,1;2,1;press;Start Juicing]'..
'list[current_name;src;6.5,.5;1,1;]'..
'list[current_name;dst;6.5,1.5;1,1;]'..
'list[current_player;main;0,3;8,4;]'

press_error_formspec =
'size[8,7]'..
'label[1.5,0;You need to add more fruit.]' ..
'label[4.3,.75;Put fruit here ->]'..
'label[3.5,1.75;Put container here ->]'..
'label[0.2,1.8;4 fruits to a glass,]'..
'label[0.2,2.1;8 fruits to a bottle,]'..
'label[0.2,2.4;16 fruits to a bucket.]'..
'button[1,1;2,1;press;Start Juicing]'..
'list[current_name;src;6.5,.5;1,1;]'..
'list[current_name;dst;6.5,1.5;1,1;]'..
'list[current_player;main;0,3;8,4;]'
