//-------------------------------------------------------------------------
//      ECE 385 - Summer 2021 Lab 7 Top-level                            --
//                                                                       --
//      Updated Fall 2021 as Lab 7                                       --
//      For use with ECE 385                                             --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module finalproject (

     ///////// Clocks /////////
     input    MAX10_CLK1_50,

     ///////// KEY /////////
     input    [ 1: 0]   KEY,

     ///////// SW /////////
     input    [ 9: 0]   SW,

     ///////// LEDR /////////
     output   [ 9: 0]   LEDR,

     ///////// HEX /////////
     output   [ 7: 0]   HEX0,
     output   [ 7: 0]   HEX1,
     output   [ 7: 0]   HEX2,
     output   [ 7: 0]   HEX3,
     output   [ 7: 0]   HEX4,
     output   [ 7: 0]   HEX5,

     ///////// SDRAM /////////
     output             DRAM_CLK,
     output             DRAM_CKE,
     output   [12: 0]   DRAM_ADDR,
     output   [ 1: 0]   DRAM_BA,
     inout    [15: 0]   DRAM_DQ,
     output             DRAM_LDQM,
     output             DRAM_UDQM,
     output             DRAM_CS_N,
     output             DRAM_WE_N,
     output             DRAM_CAS_N,
     output             DRAM_RAS_N,

     ///////// VGA /////////
     output             VGA_HS,
     output             VGA_VS,
     output   [ 3: 0]   VGA_R,
     output   [ 3: 0]   VGA_G,
     output   [ 3: 0]   VGA_B,





     ///////// ARDUINO /////////
     inout    [15: 0]   ARDUINO_IO,
     inout              ARDUINO_RESET_N 

);

logic Reset_h, vssig, blank, sync, VGA_Clk, ANIM_Clk, Run, jump2Signal, resetSignal, duckresetSignal, duck_kill_signal, start_game_signal, start_game_signal_int, duck_kill_signal_int, gameoversignal, fly_away, shoot_enable, out_of_shots;
logic [1:0] count;
logic [20:0] score, highscore;
//=======================================================
//  REG/WIRE declarations
//=======================================================
	logic SPI0_CS_N, SPI0_SCLK, SPI0_MISO, SPI0_MOSI, USB_GPX, USB_IRQ, USB_RST;
	logic [3:0] hex_num_4, hex_num_3, hex_num_1, hex_num_0; //4 bit input hex digits
	logic [1:0] signs;
	logic [1:0] hundreds;
	logic [9:0] drawxsig, drawysig, ballxsig, ballysig, ballsizesig;
	logic [3:0] Red, Blue, Green;
	logic [4:0] Frame;
	logic [5:0] DuckFrame, flyaway_timer;
	logic [7:0] keycode, RoundNumber;
	logic signed [7:0] MouseX, MouseY, MouseButtons;
	logic signed [10:0] Duck_X, Duck_Y;
	logic [9:0] BackgroundX, BackgroundY, BackgroundSizeX, BackgroundSizeY, DogX, DogY, DogSizeX, DogSizeY;
	logic [9:0] Dog_X, Dog_Y, Dog_rand_X, Duck_start_rand_X, duck_killed;
	logic [1:0] Duck_color_rand, Duck_direction_rand, Num_repeats_rand, Duck_color;


//=======================================================
//  Structural coding
//=======================================================
	assign ARDUINO_IO[10] = SPI0_CS_N;
	assign ARDUINO_IO[13] = SPI0_SCLK;
	assign ARDUINO_IO[11] = SPI0_MOSI;
	assign ARDUINO_IO[12] = 1'bZ;
	assign SPI0_MISO = ARDUINO_IO[12];
	
	assign ARDUINO_IO[9] = 1'bZ;
	assign USB_IRQ = ARDUINO_IO[9];
	
	//Assignments specific to Sparkfun USBHostShield-v13
	//assign ARDUINO_IO[7] = USB_RST;
	//assign ARDUINO_IO[8] = 1'bZ;
	//assign USB_GPX = ARDUINO_IO[8];
		
	//Assignments specific to Circuits At Home UHS_20
	assign ARDUINO_RESET_N = USB_RST;
	assign ARDUINO_IO[8] = 1'bZ;
	//GPX is unconnected to shield, not needed for standard USB host - set to 0 to prevent interrupt
	assign USB_GPX = 1'b0;
	
	//HEX drivers to convert numbers to HEX output
	HexDriver hex_driver4 (hex_num_4, HEX4[6:0]);
	assign HEX4[7] = 1'b1;
	
	HexDriver hex_driver3 (hex_num_3, HEX3[6:0]);
	assign HEX3[7] = 1'b1;
	
	HexDriver hex_driver1 (hex_num_1, HEX1[6:0]);
	assign HEX1[7] = 1'b1;
	
	HexDriver hex_driver0 (hex_num_0, HEX0[6:0]);
	assign HEX0[7] = 1'b1;
	
	//fill in the hundreds digit as well as the negative sign
	assign HEX5 = {1'b1, ~signs[1], 3'b111, ~hundreds[1], ~hundreds[1], 1'b1};
	assign HEX2 = {1'b1, ~signs[0], 3'b111, ~hundreds[0], ~hundreds[0], 1'b1};
	
	
	assign {Reset_h}=~ (KEY[0]); 
	assign Run = ~(KEY[1]);
	assign VGA_R = Red;
	assign VGA_B = Blue;
	assign VGA_G = Green;

	//assign signs = 2'b00;
	//assign hex_num_4 = 4'h4;
	//assign hex_num_3 = 4'h3;
	//assign hex_num_1 = 4'h1;
	//assign hex_num_0 = 4'h0;
	
	//remember to rename the SOC as necessary
		finalprojectqsys u0 (
		.clk_clk                           (MAX10_CLK1_50),    //clk.clk
		.reset_reset_n                     (1'b1),             //reset.reset_n
		.altpll_0_locked_conduit_export    (),    			   //altpll_0_locked_conduit.export
		.altpll_0_phasedone_conduit_export (), 				   //altpll_0_phasedone_conduit.export
		.altpll_0_areset_conduit_export    (),     			   //altpll_0_areset_conduit.export
   
		.key_external_connection_export    (KEY),    		   //key_external_connection.export

		//SDRAM
		.sdram_clk_clk(DRAM_CLK),            				   //clk_sdram.clk
	   .sdram_wire_addr(DRAM_ADDR),               			   //sdram_wire.addr
		.sdram_wire_ba(DRAM_BA),                			   //.ba
		.sdram_wire_cas_n(DRAM_CAS_N),              		   //.cas_n
		.sdram_wire_cke(DRAM_CKE),                 			   //.cke
		.sdram_wire_cs_n(DRAM_CS_N),                		   //.cs_n
		.sdram_wire_dq(DRAM_DQ),                  			   //.dq
		.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),                //.dqm
		.sdram_wire_ras_n(DRAM_RAS_N),              		   //.ras_n
		.sdram_wire_we_n(DRAM_WE_N),                		   //.we_n

		//USB SPI	
		.spi0_SS_n(SPI0_CS_N),
		.spi0_MOSI(SPI0_MOSI),
		.spi0_MISO(SPI0_MISO),
		.spi0_SCLK(SPI0_SCLK),
		
		//USB GPIO
		.usb_rst_export(USB_RST),
		.usb_irq_export(USB_IRQ),
		.usb_gpx_export(USB_GPX),
		
		//LEDs and HEX
		.hex_digits_export({hex_num_4, hex_num_3, hex_num_1, hex_num_0}),
//		.leds_export({hundreds, signs, LEDR}),
		.keycode_export(keycode),
		
//		//VGA
//		.vga_port_red (VGA_R),
//		.vga_port_green (VGA_G),
//		.vga_port_blue (VGA_B),
//		.vga_port_hs (VGA_HS),
//		.vga_port_vs (VGA_VS)

		//MOUSE
		
		.mouse_x_ext_export(MouseX),
		.mouse_y_ext_export(MouseY),
		.mouse_buttons_ext_export(MouseButtons)
		
	 );

	vga_controller vga1 (.Clk(MAX10_CLK1_50), .Reset(Reset_h), .hs(VGA_HS), .vs(VGA_VS), .pixel_clk(VGA_Clk), .clk_10Hz(ANIM_Clk), .blank(blank), .sync(sync), .DrawX(drawxsig), .DrawY(drawysig));
    cursor cursor1 (.MouseX, .MouseY, .MouseButtons,.Reset(Reset_h), .frame_clk(VGA_VS), .keycode, .BallX(ballxsig), .BallY(ballysig), .BallS(ballsizesig), .blank);
	color_mapper cm1(.score, .highscore, .out_of_shots, .shoot_enable, .fly_away, .gameoversignal, .count, .RoundNumber, .flyaway_timer, .duck_kill_signal_int, .start_game_signal_int, .duck_killed, .start_game_signal, .duck_kill_signal, .duckresetSignal, .Duck_color,.vga_clk(VGA_Clk), .Frame(Frame), .DuckFrame(DuckFrame), .BallX(ballxsig), .BallY(ballysig), .DrawX(drawxsig), .DrawY(drawysig), .Ball_size(ballsizesig), .Red, .Green, .Blue, .blank, .MouseButtons, .Reset(Reset_h)/*, .LEDR*/, .Dog_X, .Dog_Y, .Duck_X, .Duck_Y, .jump2Signal, .resetSignal); 
	control cont1 (.score, .highscore, .out_of_shots, .shoot_enable, .fly_away, .gameoversignal, .count, .RoundNumber, .flyaway_timer, .duck_kill_signal_int, .start_game_signal_int, .duck_killed, .start_game_signal, .duck_kill_signal, .duckresetSignal, .Dog_rand_X(Dog_rand_X), .Duck_color, .Clk(MAX10_CLK1_50), .Reset(Reset_h), .ANIM_Clk, .Dog_X, .Dog_Y, .Duck_X, .Duck_Y, .Frame, .DuckFrame, .Duck_color_rand(Duck_color_rand), .Duck_direction_rand(Duck_direction_rand), .Duck_start_rand_X(Duck_start_rand_X), .Run, .LEDR, .jump2Signal, .resetSignal, .Num_repeats_rand(Num_repeats_rand));
	Randomization rand1(.Reset(Reset_h)/*,.LEDR*/, .Clk(MAX10_CLK1_50), .ANIM_Clk, .Dog_rand_X, .Duck_start_rand_X, .Duck_color_rand, .Duck_direction_rand, .Num_repeats_rand);


endmodule
