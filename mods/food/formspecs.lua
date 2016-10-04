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

function food.barrel_formspec(fullness)
	local formspec =  -- Used for the liquid storing barrels.
   'size[8,8]'..
      'label[0,0;Fill the barrel with the drink of your choice,]'..
      'label[0,.4;you can only add more of the same type of drink.]'..
      'label[4.5,1.2;Add liquid ->]'..
      'label[.75,1.75;This barrel is '..((fullness/128)*100)..'% full]'..
      'label[4.5,2.25;Take liquid ->]'..
      'label[2,3.2;(This empties the barrel completely)]'..
      'button[0,3;2,1;purge;Purge]'..
      'list[current_name;src;6.5,1;1,1;]'..
      'list[current_name;dst;6.5,2;1,1;]'..
      'list[current_player;main;0,4;8,5;]'
   return formspec
end
