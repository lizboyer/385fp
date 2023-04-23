//NOTES
//4/6/23
Added Assets Folder

Important info fixed function graphics:

Vertical coordinates (VGA coords):
- Sky background: 0 to 360
- Dirt background: 460 to 480
- Three bottom boxes (shots, ducks, score): 410 to 450

Horizontal coordinates (VGA coords):
- Shots box: 40 to 120
- Ducks box: 160 to 480
- Score box: 520 to 620


//menu screen with modes, top score, and year

//dog starts at ~ 11, 290, 
//walks until ~ 267, 290, sniffing twice (once in the middle, once at end of walk)
//big *** eyes and jumps behind grass
	//492, 518, -> 580, 500 -> 650,630

//birds come out, fly randomly in linear fashion until hit
	//if not hit within 5 seconds, screen goes pink, "fly away" pops up
	//if not hit in 6 seconds, bird disappears
	//if all three shots used, bird disappears
	//if bird disappears, dog laugh emote.

randomization for ducks:
	randomize using 50MHz clock + modulo
		randomize between 3 duck colors
		randomize between 4 directions of duck flight ("NW", "W", "NE", and "E"... see sprites for explanation)
		randomize 4 bit starting X position of duck 
		randomize X position of dog popping up (holding duck after a duck is killed) 
		