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
		
duck file organization:
	black duck:
		right facing: 0 - 8
			NE: 0 - 3
			E: 4 - 8
		falling: 9 - 10
		left facing: 11 - 19
			NW: 11 - 14
			W: 15 - 19
	red duck:
		right facing: 20 - 28
			NE: 20 - 23
			E: 24 - 28
		falling: 29 - 30
		left facing: 31 - 39
			NW: 31 - 34
			W: 35 - 39
	pink duck:
		right facing: 40 - 48
			NE: 40 - 43
			E: 44 - 48 
		falling: 49 - 50
		left facing: 51 - 59
			NW: 51 - 54
			W: 55 - 59

Duck motion:
	300/(335-158) 

Round Number position
RoundNumber1
- Original: 80, 384
- Scaled:
RoundNumber2
- Original: 96, 384
- Scaled:

BUG NOTES:
	randomization
		duck direction and color not being randomized
	duck on screen when they shouldn't be (top left)
	duck frames not changing
	duck transparency


BUG NOTES:
	duck counter equation
	- change radius to 15
	duck mifs
	- left facing blue shot, left facing blue down, right facing blue, right facing blue down
	- red left and right, red down
	-29, 30, 48, 50, 59
	shot counter not decreasing
	duck sensitive
	duck should not be drawn past 300

BUG NOTES:
	lose via shot counter
	dog position
	fix round counter
	go to main menu

BUG NOTES:
	Game over pops up even when we go to a new round
	game over state not visted at correct times
	can lose by shot at start of game
	goes straight to duck start 1 if we lose by shot

BUG NOTES:
	losing by shots should cause dog to pop up

LAST MINUTE FIXES:
	- Dog popping up and down
	- duck killed circles
	- new round showing up before going back to main menu
	- clean up dog walk
	- mif files
	- blue min duck kill counter