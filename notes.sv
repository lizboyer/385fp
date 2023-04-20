//NOTES
//4/6/23
Added Assets Folder
Color Palette: 
Duck(Green)
Black: Duh
Green: 
	R:21 0001 
	G:58 0011 
	B:10 0000 
Pink:
	R:240
	G:120
	B:103
Brown(Light): 
	R:146 
	G:78
	B:27
Brown(Dark): 
	R:76
	G:35
	B:8
Tan:
	R:242
	G:215
	B:171
Blue:
	R:115
	G:173
	B:171
Light Green:
	R:157
	G:211
	B:65
Dark Green:
	R:33
	G:80
	B:18
Green Score Text: 
	R:146
	G:204
	B:35
Red Duck Meter:
	R:167
	G:59
	B:43
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

//dog starts at ~ 11, 318, 
//walks until ~ 72, 318, sniffs
//walks again until ~ 142, 318
//big *** eyes and jumps behind grass
	//492, 518, -> 580, 500 -> 650,630

//birds come out, fly randomly in linear fashion until hit
	//if not hit within 5 seconds, screen goes pink, "fly away" pops up
	//if not hit in 6 seconds, bird disappears
	//if all three shots used, bird disappears
	//if bird disappears, dog laugh emote.