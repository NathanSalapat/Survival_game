--Formspecs for the traps

trap_empty = --trap just built but with nothing in it.
			'size[8,6]'..
			'label[2,0;Bait the trap to catch game.]' ..
			'list[current_name;bait;3.5,.6;1,1;]'..
            'list[current_player;main;0,2;8,4;]'

trap_baited = --trap has bait, just waiting for an animal.
			'size[8,6]'..
			'label[1,0;Check back often to see if you caught something.]' ..
			'list[current_name;bait;2,.6;1,1;]'..
			'list[current_name;game;5,.6;1,1;]'..
            'list[current_player;main;0,2;8,4;]'

trap_game = --trap was successful and caught something.
			'size[8,6]'..
			"label[2,0;Put the critter out of it's misery..]" ..
			'list[current_name;bait;2,.6;1,1;]'..
			'list[current_name;game;5,.6;1,1;]'..
            'list[current_player;main;0,2;8,4;]'

trap_raided = --oh no, looks like something stole our catch.
			'size[8,6]'..
			'label[2,0;Looks like something stole your catch.]' ..
			'list[current_name;bait;3.5,.6;1,1;]'..
            'list[current_player;main;0,2;8,4;]'
