/************************************************************************
Avalon-MM Interface VGA Text mode display

Register Map:
0x000-0x0257 : VRAM, 80x30 (2400 byte, 600 word) raster order (first column then row)
0x258        : control register

VRAM Format:
X->
[ 31  30-24][  23 -  16][ 15  14-8 ][  7 - 0   ]
[IV1][CODE1][FGN1][BKG1][IV0][CODE0][FGN0][BGN0]

Palette Format:
[31-28][27-24][ 23-20][19-16][ 15-12][11-8][ 7-4  ][ 3-0 ]
[unused][Red1][Green1][Blue1][unused][Red0][Green0][Blue0]

CODEn = Glyph code from IBM codepage 437


VSYNC signal = bit which flips on every Vsync (time for new frame), used to synchronize software
BKG_R/G/B = Background color, flipped with foreground when IVn bit is set
FGD_R/G/B = Foreground color, flipped with background when Inv bit is set

************************************************************************/
`define NUM_REGS 601 //80*30 characters / 4 characters per register
`define CTRL_REG 600 //index of control register

module vga_text_avl_interface (
	// Avalon Clock Input, note this clock is also used for VGA, so this must be 50Mhz
	// We can put a clock divider here in the future to make this IP more generalizable
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,					// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,			// Avalon-MM Byte Enable
	input  logic [11:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,		// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,		// Avalon-MM Read Data
	
	// Exported Conduit (mapped to VGA port - make sure you export in Platform Designer)
	output logic [3:0]  red, green, blue,	// VGA color channels (mapped to output pins in top-level)
	output logic hs, vs						// VGA HS/VS
);

//logic [31:0] LOCAL_REG       [`NUM_REGS]; // Registers
//put other local variables here

lab72ocm0 ocm1(.address_a(AVL_ADDR), .address_b(charIdx), .byteena_a(AVL_BYTE_EN), .clock(CLK), .data_a(AVL_WRITEDATA), .data_b(32'b0), .wren_a(AVL_WRITE&~AVL_ADDR[11]), .wren_b(1'b0), .q_a(avl_temp), .q_b(codes));
// based on MSB of addr, AVL_READDATA is either avl_temp or stuff from palette register



logic blank, sync, VGA_Clk, shape_on;
logic [9:0] drawxsig, drawysig, charIdx;
logic [6:0] xpos, ypos, charcode, curcharshapex, curcharshapey, shape_sizex, shape_sizey;
logic [3:0] yaddr, FRED, BRED, FBLU, BBLU, FGRN, BGRN, FGD_IDX, BKG_IDX;
logic [7:0] chardata, Line;
logic [11:0] vramIdx;
logic [10:0] fontAddr;
logic [31:0] codes, avl_temp;
logic [6:0] curcode;
logic [7:0][31:0] palette;


//Declare submodules..e.g. VGA controller, ROMS, etc


vga_controller vgac1(.Clk(CLK), .Reset(RESET), .hs(hs), .vs(vs), .pixel_clk(VGA_Clk), .blank(blank), .sync(sync), .DrawX(drawxsig), .DrawY(drawysig));
font_rom	fr1(.addr(fontAddr), .data(chardata)); 


// Read and write from AVL interface to register block, note that READ waitstate = 1, so this should be in always_ff
always_ff @(posedge CLK) begin

if(AVL_WRITE && AVL_CS && AVL_ADDR[11])	
	begin
		case(AVL_BYTE_EN)
				4'b1111: palette[AVL_ADDR[2:0]] <= AVL_WRITEDATA; //Write full 32-bits.
				4'b1100: palette[AVL_ADDR[2:0]][31:16] <= AVL_WRITEDATA[31:16]; //Write the two upper bytes.
				4'b0011: palette[AVL_ADDR[2:0]][15:0] <= AVL_WRITEDATA[15:0]; //Write the two lower bytes.
				4'b1000: palette[AVL_ADDR[2:0]][31:24] <= AVL_WRITEDATA[31:24]; //Write byte 3 only.
				4'b0100: palette[AVL_ADDR[2:0]][23:16] <= AVL_WRITEDATA[23:16]; //Write byte 2 only.
				4'b0010: palette[AVL_ADDR[2:0]][15:8] <= AVL_WRITEDATA[15:8]; //Write byte 1 only.
				4'b0001: palette[AVL_ADDR[2:0]][7:0] <= AVL_WRITEDATA[7:0]; //Write byte 0 only.
		endcase
	end
		
if(AVL_READ && AVL_CS && AVL_ADDR[11])				
	begin
		 AVL_READDATA <= palette[AVL_ADDR[2:0]];
	end

end


//handle drawing (may either be combinational or sequential - or both).

always_comb begin

//vram index based on draw x draw y

	
	xpos = drawxsig[9:3]; //used to be xpos = drawxsig/8;

	ypos = drawysig[9:4]; //used to be ypos = drawysig/16;
	yaddr = drawysig[3:0];



	//index into fontrom based on draw x draw y
	vramIdx =  (ypos*80) + xpos; //used to be 32

	charIdx = vramIdx[11:1];
	if(vramIdx[0] == 1'b0) 
	begin
		curcode = codes[14:8];
		IVn = codes[15];
		FGD_IDX = codes[7:4];
		BKG_IDX = codes[3:0];
	end
	else 
	begin
		curcode = codes[30:24];
		IVn = codes[31];
		FGD_IDX = codes[23:20];
		BKG_IDX = codes[19:16];

		
	end
	
	if(FGD_IDX[0] == 1'b0) 
	begin
		FRED = palette[FGD_IDX/2][11:8]; //24-21: FGR, 20-17: FGG, 16-13:FGB, 12-9: BGR, 8-5: BGG, 4-1:BGB
		FGRN = palette[FGD_IDX/2][7:4];
		FBLU = palette[FGD_IDX/2][3:0];
	end
	else 
	begin
		FRED = palette[FGD_IDX/2][27:24]; //24-21: FGR, 20-17: FGG, 16-13:FGB, 12-9: BGR, 8-5: BGG, 4-1:BGB
		FGRN = palette[FGD_IDX/2][23:20];
		FBLU = palette[FGD_IDX/2][19:16];
	end
	if(BKG_IDX[0] == 1'b0)
	begin
		BRED = palette[BKG_IDX/2][11:8];
		BGRN = palette[BKG_IDX/2][7:4];
		BBLU = palette[BKG_IDX/2][3:0];
	end
	else
	begin
		BRED = palette[BKG_IDX/2][27:24];
		BGRN = palette[BKG_IDX/2][23:20];
		BBLU = palette[BKG_IDX/2][19:16];
	end

		
	fontAddr = curcode*16 + drawysig[3:0];
	Line = chardata;
	shape_on = Line[7-drawxsig[2:0]];

end



always_ff @(posedge VGA_Clk) begin




	if (blank)	//if not in blanking interval
			begin
				if (shape_on) 	//if chardata = 1
				begin
					red <= ~IVn ? FRED : BRED;	//checks inverse bit
					green <= ~IVn ? FGRN : BGRN;
					blue <= ~IVn ? FBLU : BBLU;
				end
				
				else 	//if chardata = 0
				begin
					red <=~IVn ? BRED : FRED;	//checks inverse bit
					green <= ~IVn ? BGRN : FGRN;
					blue <= ~IVn ? BBLU : FBLU;
				end
		end
			
		
	
	else 	//if in blanking interval
	begin
		red <= 4'h0;
		blue <= 4'h0;
		green <= 4'h0;
	end
	

end



endmodule





