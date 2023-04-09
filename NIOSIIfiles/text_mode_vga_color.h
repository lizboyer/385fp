 

 #ifndef TEXT_MODE_VGA_COLOR_H_ 
 #define TEXT_MODE_VGA_COLOR_H_
 #define COLUMNS 80
 #define ROWS 30

 #include <system.h>
 #include <alt_types.h>
 struct TEXT_VGA_STRUCT {
	alt_u8 VRAM [ROWS*COLUMNS*2]; //Week 2 - extended VRAM
	//modify this by adding const bytes to skip to palette, or manually compute palette
	alt_u8 unused [0x1fff - 0x12bf]; //unused memory
	alt_u8 palette [32];

};

 struct COLOR{
 	char name [20];
 	alt_u8 red;
 	alt_u8 green;
 	alt_u8 blue;
 };
 
 
 //you may have to change this line depending on your platform designer
 static volatile struct TEXT_VGA_STRUCT* vga_ctrl = VGA_TEXT_MODE_CONTROLLER_0_BASE;
 
 //CGA colors with names
 static struct COLOR colors[]= 
{{"Black", 0x0, 0x0, 0x0}
{"White", 0xf, 0xf, 0xf}
{"Green", 0x1, 0x3, 0x0}
{"Pink", 0xf, 0x7, 0x6}
{"BrownLight", 0x9, 0x4, 0x1}
{"BrownDark", 0x4, 0x2, 0x0}
{"Tan", 0xf, 0xd, 0xa}
{"Blue", 0x7, 0xa, 0xa}
{"LightGreen", 0x9, 0xd, 0x4}
{"DarkGreen", 0x2, 0x5, 0x1}
{"GreenScoreText", 0x9, 0xc, 0x2}
{"RedDuckMeter", 0xa, 0x3, 0x2}
}