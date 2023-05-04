// //-------------------------------------------------------------------------
// //    Color_Mapper.sv                                                    --
// //    Stephen Kempf                                                      --
// //    3-1-06                                                             --
// //                                                                       --
// //    Modified by David Kesler  07-16-2008                               --
// //    Translated by Joe Meng    07-07-2013                               --
// //                                                                       --
// //    Fall 2014 Distribution                                             --
// //                                                                       --
// //    For use with ECE 385 Lab 7                                         --
// //    University of Illinois ECE Department                              --
// //-------------------------------------------------------------------------

// //nColor is the color of the pixel at that coordinate

// module  color_mapper ( input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size, Dog_X, Dog_Y, duck_killed,
// 						input logic signed [10:0] Duck_X, Duck_Y,
// 						input logic [5:0] flyaway_timer,
// 					   input logic [5:0] Frame, DuckFrame,
// 						input logic [1:0] Duck_color,
// 						input blank, vga_clk, Reset, jump2Signal, resetSignal, duckresetSignal, ANIM_Clk,  start_game_signal_int, duck_kill_signal_int,
						input logic [20:0] score, highscore,
						// output logic duck_kill_signal, start_game_signal,
// 						input signed [7:0] MouseButtons,
// 						input logic [7:0] RoundNumber,
// 						output logic [9:0] LEDR,
//                        output logic [3:0]  Red, Green, Blue );
    
	 
// assign LEDR[9] = shot_on;
// assign LEDR[8] = mouse_flag;
// assign LEDR[7:0] = shotcount;
	 
	 
	 
// //internal signals
//     logic dog_on, bg_on, ball_on, square_on1, square_on2, intermed, square_on3, count_enable, aaa_delayed, aaa, shot_on, duck_on, mouse_flag, fly_away_on, RoundNumber1_on, RoundNumber2_on;
// 	logic [1:0] count = 2'b00;
// 	logic [1:0] background;
// 	logic [6:0] DogSizeY, DogSizeX, DuckSizeX, DuckSizeY;
// 	//ball internal signals
// 	int DistX, DistY, Size, DistXabs, DistYabs;
// 	assign DistX = DrawX - BallX;
//     assign DistY = DrawY - BallY;
// 	assign DistXabs = DistX[31] ? -DistX : DistX;
// 	assign DistYabs = DistY[31] ? -DistY : DistY;
// 	assign Size = Ball_size;
// 	logic [1:0] duck_counter_on_1, duck_counter_on_2, duck_counter_on_3, duck_counter_on_4, duck_counter_on_5, duck_counter_on_6, duck_counter_on_7, duck_counter_on_8, duck_counter_on_9, duck_counter_on_10;
	  
// 	//background internal signals (comment out for better runtime for testing... comment out rom/palette instantiations at the bottom of this file as well)
// 	logic [17:0] bg_rom_address;
// 	logic [3:0] bg_rom_q;
// 	logic [3:0] bg_palette_red, bg_palette_green, bg_palette_blue;
// 	logic [3:0] bg1_palette_red, bg1_palette_green, bg1_palette_blue;
// 	assign bg_rom_address = ((DrawX * 480) / 640) + (((DrawY * 512) / 480) * 480);

// 	//main menu internal signals
// 	logic [15:0] mainmenu_rom_address;
// 	logic [3:0] mainmenu_rom_q;
// 	logic [3:0] mainmenu_palette_red, mainmenu_palette_green, mainmenu_palette_blue;
// 	assign mainmenu_rom_address = ((DrawX * 256) / 640) + (((DrawY * 224) / 480) * 256);

// 	//dog internal signals
// 	logic [13:0] dog_rom_address;
// 	logic [3:0] dog_rom_q;
// 	logic [3:0] dog_palette_red, dog_palette_green, dog_palette_blue;

// 	logic [9:0] dog_distX, dog_distY;
// 	assign dog_distX = DrawX - Dog_X;
// 	assign dog_distY = DrawY - Dog_Y;
// 	assign dog_rom_address = (dog_distX + dog_distY * 110);

	
	
// 	//RoundNumber internal signals
// 	logic [7:0] RoundNumber1_rom_address;
// 	logic [3:0] RoundNumber1_rom_q;
// 	logic [3:0] RoundNumber1_palette_red, RoundNumber1_palette_green, RoundNumber1_palette_blue;

// 	logic [7:0] RoundNumber2_rom_address;
// 	logic [3:0] RoundNumber2_rom_q;
// 	logic [3:0] RoundNumber2_palette_red, RoundNumber2_palette_green, RoundNumber2_palette_blue;

// 	logic [4:0] RoundNumber1; //RIGHT NUMBER
// 	logic [4:0] RoundNumber2; //LEFT NUMBER

// 	assign RoundNumber1_rom_address = (RoundNumber1_distX + RoundNumber1_distY * 16);
// 	assign RoundNumber1_distX = DrawX - 80;
// 	assign RoundNumber1_distY = DrawY - 400;

// 	assign RoundNumber2_rom_address = (RoundNumber2_distX + RoundNumber2_distY * 16);
// 	assign RoundNumber2_distX = DrawX - 80;
// 	assign RoundNumber2_distY = DrawY - 400;

	// Score Number internal signals

logic [7:0] scorenumber1_rom_address;
logic [3:0] scorenumber1_rom_q;
logic [3:0] scorenumber1_palette_red, scorenumber1_palette_green, scorenumber1_palette_blue;
logic [9:0] scorenumber1_distX, scorenumber1_distY;

assign scorenumber1_rom_address = (scorenumber1_distX + scorenumber1_distY * 16);
assign scorenumber1_distX = DrawX - 300;
assign scorenumber1_distY = DrawY - 400;

logic [7:0] scorenumber2_rom_address;
logic [3:0] scorenumber2_rom_q;
logic [3:0] scorenumber2_palette_red, scorenumber2_palette_green, scorenumber2_palette_blue;
logic [9:0] scorenumber2_distX, scorenumber2_distY;

assign scorenumber2_rom_address = (scorenumber2_distX + scorenumber2_distY * 16);
assign scorenumber2_distX = DrawX - 284;
assign scorenumber2_distY = DrawY - 400;

logic [7:0] scorenumber3_rom_address;
logic [3:0] scorenumber3_rom_q;
logic [3:0] scorenumber3_palette_red, scorenumber3_palette_green, scorenumber3_palette_blue;
logic [9:0] scorenumber3_distX, scorenumber3_distY;

assign scorenumber3_rom_address = (scorenumber3_distX + scorenumber3_distY * 16);
assign scorenumber3_distX = DrawX - 268;
assign scorenumber3_distY = DrawY - 400;

logic [7:0] scorenumber4_rom_address;
logic [3:0] scorenumber4_rom_q;
logic [3:0] scorenumber4_palette_red, scorenumber4_palette_green, scorenumber4_palette_blue;
logic [9:0] scorenumber4_distX, scorenumber4_distY;

assign scorenumber4_rom_address = (scorenumber4_distX + scorenumber4_distY * 16);
assign scorenumber4_distX = DrawX - 252;
assign scorenumber4_distY = DrawY - 400;

logic [7:0] scorenumber5_rom_address;
logic [3:0] scorenumber5_rom_q;
logic [3:0] scorenumber5_palette_red, scorenumber5_palette_green, scorenumber5_palette_blue;
logic [9:0] scorenumber5_distX, scorenumber5_distY;

assign scorenumber5_rom_address = (scorenumber5_distX + scorenumber5_distY * 16);
assign scorenumber5_distX = DrawX - 236;
assign scorenumber5_distY = DrawY - 400;

logic [7:0] scorenumber6_rom_address;
logic [3:0] scorenumber6_rom_q;
logic [3:0] scorenumber6_palette_red, scorenumber6_palette_green, scorenumber6_palette_blue;
logic [9:0] scorenumber6_distX, scorenumber6_distY;

assign scorenumber6_rom_address = (scorenumber6_distX + scorenumber6_distY * 16);
assign scorenumber6_distX = DrawX - 220;
assign scorenumber6_distY = DrawY - 400;


//high score internal signals
logic [7:0] highscorenumber1_rom_address;
logic [3:0] highscorenumber1_rom_q;
logic [3:0] highscorenumber1_palette_red, highscorenumber1_palette_green, highscorenumber1_palette_blue;
logic [9:0] highscorenumber1_distX, highscorenumber1_distY;

assign highscorenumber1_rom_address = (highscorenumber1_distX + highscorenumber1_distY * 16);
assign highscorenumber1_distX = DrawX - 420;
assign highscorenumber1_distY = DrawY - 350;

logic [7:0] highscorenumber2_rom_address;
logic [3:0] highscorenumber2_rom_q;
logic [3:0] highscorenumber2_palette_red, highscorenumber2_palette_green, highscorenumber2_palette_blue;
logic [9:0] highscorenumber2_distX, highscorenumber2_distY;

assign highscorenumber2_rom_address = (highscorenumber2_distX + highscorenumber2_distY * 16);
assign highscorenumber2_distX = DrawX - 404;
assign highscorenumber2_distY = DrawY - 350;

logic [7:0] highscorenumber3_rom_address;
logic [3:0] highscorenumber3_rom_q;
logic [3:0] highscorenumber3_palette_red, highscorenumber3_palette_green, highscorenumber3_palette_blue;
logic [9:0] highscorenumber3_distX, highscorenumber3_distY;

assign highscorenumber3_rom_address = (highscorenumber3_distX + highscorenumber3_distY * 16);
assign highscorenumber3_distX = DrawX - 388;
assign highscorenumber3_distY = DrawY - 350;

logic [7:0] highscorenumber4_rom_address;
logic [3:0] highscorenumber4_rom_q;
logic [3:0] highscorenumber4_palette_red, highscorenumber4_palette_green, highscorenumber4_palette_blue;
logic [9:0] highscorenumber4_distX, highscorenumber4_distY;

assign highscorenumber4_rom_address = (highscorenumber4_distX + highscorenumber4_distY * 16);
assign highscorenumber4_distX = DrawX - 372;
assign highscorenumber4_distY = DrawY - 350;

logic [7:0] highscorenumber5_rom_address;
logic [3:0] highscorenumber5_rom_q;
logic [3:0] highscorenumber5_palette_red, highscorenumber5_palette_green, highscorenumber5_palette_blue;
logic [9:0] highscorenumber5_distX, highscorenumber5_distY;

assign highscorenumber5_rom_address = (highscorenumber5_distX + highscorenumber5_distY * 16);
assign highscorenumber5_distX = DrawX - 356;
assign highscorenumber5_distY = DrawY - 350;

logic [7:0] highscorenumber6_rom_address;
logic [3:0] highscorenumber6_rom_q;
logic [3:0] highscorenumber6_palette_red, highscorenumber6_palette_green, highscorenumber6_palette_blue;
logic [9:0] highscorenumber6_distX, highscorenumber6_distY;

assign highscorenumber6_rom_address = (highscorenumber6_distX + highscorenumber6_distY * 16);
assign highscorenumber6_distX = DrawX - 340;
assign highscorenumber6_distY = DrawY - 350;

// 	//duck internal signals
// 	logic [12:0] ducks_rom_address;
// 	logic [3:0] ducks_rom_q;
// 	logic [3:0] ducks_black_palette_red, ducks_black_palette_green, ducks_black_palette_blue;
// 	logic [3:0] ducks_red_palette_red, ducks_red_palette_green, ducks_red_palette_blue;
// 	logic [3:0] ducks_pink_palette_red, ducks_pink_palette_green, ducks_pink_palette_blue;

// 	logic [9:0] duck_distX, duck_distY, duck_counter_init_x, duck_counter_init_y;
// 	logic [25:0] shotcount;
// 	assign duck_distX = DrawX - Duck_X;
// 	assign duck_distY = DrawY - Duck_Y;
// 	assign ducks_rom_address = (duck_distX + duck_distY * 64);
// 	assign duck_counter_init_x = 10'd228;
// 	assign duck_counter_init_y = 10'd424;
// 	assign background[0] = (fly_away_on) ? 1'b0 : start_game_signal_int;
// 	assign background[1] = fly_away_on; //CHANGE LATER!!!!!! (when added flyaway)
	
// 	logic [9:0] flyaway_distX, flyaway_distY;
// 	logic [12:0] flyaway_rom_address;
// 	logic [3:0] flyaway_rom_q;
// 	logic [3:0] flyaway_palette_red, flyaway_palette_green, flyaway_palette_blue;
// 	assign flyaway_distX = DrawX - 247;
// 	assign flyaway_distY = DrawY - 125;
// 	assign flyaway_rom_address = (flyaway_distX + flyaway_distY * 146);


	
// //PROCS


// 	always_comb
// 	begin: Score_Logic
// 		RoundNumber1 = RoundNumber % 10; //RIGHT NUMBER
// 		RoundNumber2 = (RoundNumber / 10); //LEFT NUMBER
// 	end

	always_comb
	begin: Score_Logic
		ScoreNumber1 = score % 10; //RIGHT NUMBER
		ScoreNumber2 = (score / 10); //LEFT NUMBER
		ScoreNumber3 = (score / 100); //LEFT NUMBER
		ScoreNumber4 = (score / 100); //LEFT NUMBER
		ScoreNumber5 = (score / 1000); //LEFT NUMBER
		ScoreNumber6 = (score / 10000); //LEFT NUMBER
	end

	always_comb
	begin: HighScore_Logic
		HighScoreNumber1 = highscore % 10; //RIGHT NUMBER
		HighScoreNumber2 = (highscore / 10); //LEFT NUMBER
		HighScoreNumber3 = (highscore / 100); //LEFT NUMBER
		HighScoreNumber4 = (highscore / 100); //LEFT NUMBER
		HighScoreNumber5 = (highscore / 1000); //LEFT NUMBER
		HighScoreNumber6 = (highscore / 10000); //LEFT NUMBER
	end
	
// 	always_comb
// 	begin:fly_away_on_proc
// 		if((flyaway_distX < 146) && (flyaway_distY < 34) && ~((flyaway_palette_red == 4'hA) && (flyaway_palette_blue == 4'hA) && (flyaway_palette_green == 4'hE)) && (flyaway_timer >= 50) && (flyaway_timer < 60))
// 			fly_away_on = 1'b1;
// 		else
// 			fly_away_on = 1'b0;
// 	end
	
// 	always_comb 
// 	begin:Main_Menu_Logic
// 		if(BallX >= 200  && BallX < 301 && BallY >= 250 && BallY < 301 && MouseButtons == 8'd1 && ~start_game_signal_int) //test, play with it
// 		begin
// 			start_game_signal = 1'b1;
// 		end
// 		else 
// 			start_game_signal = 1'b0;
// 	end			

//     always_comb
//     begin:Ball_on_proc
//         if ( DistXabs + DistYabs/*(DistX*DistX) + (DistY*DistY)*/ <= (Size/**Size*/) ) //use parametric equation for diamond (|x| + |y| = size) 
//             ball_on = 1'b1;
//         else 
//             ball_on = 1'b0;
//      end 

// 	always_comb
// 	begin:Dog_on_proc
//     	if (dog_distX < 110 && dog_distY < 86 && ~((dog_palette_red == 4'h6) && (dog_palette_blue == 4'hF) && (dog_palette_green == 4'hA)) && (resetSignal == 1'b0)) 
//     	begin
// 			if(jump2Signal == 1'b1)
// 				begin
// 				if(DrawY < 300)
// 					dog_on = 1'b1;
// 				else 
// 					dog_on = 1'b0;
// 				end
// 			else 
// 				dog_on = 1'b1;
// 		end
//     	else 
//         	dog_on = 1'b0;
//     end 

// 	always_comb
// 	begin:Duck_on_proc
// 			if (duck_distX < 64 && duck_distY < 64 && ~((/*(ducks_black_palette_red == 4'hA)  || */(ducks_red_palette_red == 4'hA) /*|| (ducks_pink_palette_red == 4'hA)*/) && (/*(ducks_black_palette_blue == 4'hA) || */(ducks_red_palette_blue == 4'hA)/* || (ducks_pink_palette_blue == 4'hA)*/) && (/*(ducks_black_palette_green  == 4'hE) || */(ducks_red_palette_green  == 4'hE) /*|| (ducks_pink_palette_green == 4'hE)*/)) && (duckresetSignal == 1'b0))
// 			begin
// 				if(Duck_Y < 237)
// 					duck_on = 1'b1;
// 				else
// 					duck_on = 1'b0;
// 			end
// 			else
// 				duck_on = 1'b0;
//     end 
	  
	//  always_comb
	//  begin:RoundNumber_on_proc
	// 		if(DrawX >= 80 && DrawX < 96 && DrawY >= 400 && DrawY < 416)
	// 			RoundNumber1_on = 1'b1;
	// 		else
	// 			RoundNumber1_on = 1'b0;
	// 		if(DrawX >= 96 && DrawX < 112 && DrawY >= 400 && DrawY < 416)
	// 			RoundNumber2_on = 1'b1;
	// 		else 
	// 			RoundNumber2_on = 1'b0;
	// 	end

	 always_comb
	 begin:ScoreNumber_on_proc
	//  if(start_game_signal) (???)
			if(scorenumber1_distX < 16 & scorenumber1_distY < 16)
				ScoreNumber1_on = 1'b1;
			else
				ScoreNumber1_on = 1'b0;
			if(scorenumber2_distX < 16 & scorenumber2_distY < 16)
				ScoreNumber2_on = 1'b1;
			else 
				ScoreNumber2_on = 1'b0;
			if(scorenumber3_distX < 16 & scorenumber3_distY < 16)
				ScoreNumber3_on = 1'b1;
			else
				ScoreNumber3_on = 1'b0;
			if(scorenumber4_distX < 16 & scorenumber4_distY < 16)
				ScoreNumber4_on = 1'b1;
			else 
				ScoreNumber4_on = 1'b0;
			if(scorenumber5_distX < 16 & scorenumber5_distY < 16)
				ScoreNumber5_on = 1'b1;
			else
				ScoreNumber5_on = 1'b0;
			if(scorenumber6_distX < 16 & scorenumber6_distY < 16)
				ScoreNumber6_on = 1'b1;
			else 
				ScoreNumber6_on = 1'b0;
		end
	
	 always_comb
	 begin:HighScoreNumber_on_proc
	 	if(start_game_signal == 0) (??)
			if(scorenumber1_distX < 16 & scorenumber1_distY < 16)
				ScoreNumber1_on = 1'b1;
			else
				ScoreNumber1_on = 1'b0;
			if(scorenumber2_distX < 16 & scorenumber2_distY < 16)
				ScoreNumber2_on = 1'b1;
			else 
				ScoreNumber2_on = 1'b0;
			if(scorenumber3_distX < 16 & scorenumber3_distY < 16)
				ScoreNumber3_on = 1'b1;
			else
				ScoreNumber3_on = 1'b0;
			if(scorenumber4_distX < 16 & scorenumber4_distY < 16)
				ScoreNumber4_on = 1'b1;
			else 
				ScoreNumber4_on = 1'b0;
			if(scorenumber5_distX < 16 & scorenumber5_distY < 16)
				ScoreNumber5_on = 1'b1;
			else
				ScoreNumber5_on = 1'b0;
			if(scorenumber6_distX < 16 & scorenumber6_distY < 16)
				ScoreNumber6_on = 1'b1;
			else 
				ScoreNumber6_on = 1'b0;
		end
	  
	  
// 	//shot counter drawing
// 	 always_comb
// 	 begin:Shot_Square_on_proc
// 			if(DrawX >= 102 && DrawX < 111 && DrawY >= 418 && DrawY < 431)
// 				square_on3 = (count == 0) ? 1'b1 : 1'b0;
// 			else
// 				square_on3 = 1'b0;
// 			if(DrawX >= 85 && DrawX < 94 && DrawY >= 418 && DrawY < 431)
// 				square_on2 = (count <= 1) ? 1'b1 : 1'b0;
// 			else
// 				square_on2 = 1'b0;
// 			if(DrawX >= 68 && DrawX < 77 && DrawY >= 418 && DrawY < 431)
// 				square_on1 = (count <= 2) ? 1'b1 : 1'b0;
// 			else 
// 				square_on1 = 1'b0;
// 		end
// 	assign count_enable = aaa & ~aaa_delayed; //positive edge trigger for bullet removal

// 	//duck counter drawing
// 	 always_comb
// 	 begin:Duck_Counter_on_proc	//duck_counter_on is red when the duck has been hit, white when it hasnt, and isnt drawn if beam isnt on it
// 		if(DrawX >= 200 && DrawX < 434 && DrawY >= 417 && DrawY < 432 && start_game_signal_int)
// 		begin
// 			if((DrawX - (duck_counter_init_x + (22*9)))*(DrawX - (duck_counter_init_x + (22*9))) + (DrawY - duck_counter_init_y)*(DrawY - duck_counter_init_y) <= 6'b100100)	//Duck_Count10
// 				duck_counter_on_10 = (duck_killed[9]) ? 2'b10 : 2'b01;	//red or white
// 			else
// 				duck_counter_on_10 = 2'b00;	//dont draw
// 			if((DrawX - (duck_counter_init_x + (22*8)))*(DrawX - (duck_counter_init_x + (22*8))) + (DrawY - duck_counter_init_y)*(DrawY - duck_counter_init_y) <= 6'b100100)	//Duck_Count9
// 				duck_counter_on_9 = (duck_killed[8]) ? 2'b10 : 2'b01;
// 			else
// 				duck_counter_on_9 = 2'b00;
// 			if((DrawX - (duck_counter_init_x + (22*7)))*(DrawX - (duck_counter_init_x + (22*7))) + (DrawY - duck_counter_init_y)*(DrawY - duck_counter_init_y) <= 6'b100100)	//Duck_Count8
// 				duck_counter_on_8 = (duck_killed[7]) ? 2'b10 : 2'b01;
// 			else
// 				duck_counter_on_8 = 2'b00;
// 			if((DrawX - (duck_counter_init_x + (22*6)))*(DrawX - (duck_counter_init_x + (22*6))) + (DrawY - duck_counter_init_y)*(DrawY - duck_counter_init_y) <= 6'b100100)
// 				duck_counter_on_7 = (duck_killed[6]) ? 2'b10 : 2'b01;
// 			else
// 				duck_counter_on_7 = 2'b00;
// 			if((DrawX - (duck_counter_init_x + (22*5)))*(DrawX - (duck_counter_init_x + (22*5))) + (DrawY - duck_counter_init_y)*(DrawY - duck_counter_init_y) <= 6'b100100)	//Duck_Count6
// 				duck_counter_on_6 = (duck_killed[5]) ? 2'b10 : 2'b01;
// 			else
// 				duck_counter_on_6 = 2'b00;
// 			if((DrawX - (duck_counter_init_x + (22*4)))*(DrawX - (duck_counter_init_x + (22*4))) + (DrawY - duck_counter_init_y)*(DrawY - duck_counter_init_y) <= 6'b100100)
// 				duck_counter_on_5 = (duck_killed[4]) ? 2'b10 : 2'b01;
// 			else
// 				duck_counter_on_5 = 2'b00;
// 			if((DrawX - (duck_counter_init_x + (22*3)))*(DrawX - (duck_counter_init_x + (22*3))) + (DrawY - duck_counter_init_y)*(DrawY - duck_counter_init_y) <= 6'b100100)//Duck_Count4
// 				duck_counter_on_4 = (duck_killed[3]) ? 2'b10 : 2'b01;
// 			else
// 				duck_counter_on_4 = 2'b00;
// 			if((DrawX - (duck_counter_init_x + (22*2)))*(DrawX - (duck_counter_init_x + (22*2))) + (DrawY - duck_counter_init_y)*(DrawY - duck_counter_init_y) <= 6'b100100)	//Duck_Count3
// 				duck_counter_on_3 = (duck_killed[2]) ? 2'b10 : 2'b01;
// 			else
// 				duck_counter_on_3 = 2'b00;
// 			if((DrawX - (duck_counter_init_x + (22*1)))*(DrawX - (duck_counter_init_x + (22*1))) + (DrawY - duck_counter_init_y)*(DrawY - duck_counter_init_y) <= 6'b100100)	//Duck_Count2
// 				duck_counter_on_2 = (duck_killed[1]) ? 2'b10 : 2'b01;
// 			else
// 				duck_counter_on_2 = 2'b00;
// 			if((DrawX - duck_counter_init_x)*(DrawX - duck_counter_init_x) + (DrawY - duck_counter_init_y)*(DrawY - duck_counter_init_y) <= 6'b100100)	//Duck_Count1
// 				duck_counter_on_1 = (duck_killed[0]) ? 2'b10 : 2'b01;
// 			else 
// 				duck_counter_on_1 = 2'b00;
// 		end
// 		else 
// 		begin
// 		duck_counter_on_10 = 2'b00;
// 		duck_counter_on_9 = 2'b00;
// 		duck_counter_on_8 = 2'b00;
// 		duck_counter_on_7 = 2'b00;
// 		duck_counter_on_6 = 2'b00;
// 		duck_counter_on_5 = 2'b00;
// 		duck_counter_on_4 = 2'b00;
// 		duck_counter_on_3 = 2'b00;
// 		duck_counter_on_2 = 2'b00;
// 		duck_counter_on_1 = 2'b00;
// 		end
// 	end

// 	//Bullet counter drawing
// 	 always_ff @ (posedge vga_clk or posedge Reset)
// 	 begin: Draw_bullets
// 			if(Reset)
// 				count <= 2'b00;
// 			else 
// 			begin
// 			 if(MouseButtons == 8'b00000010)
// 			 begin
// //					mouse_flag <= mouse_flag;
// 					if(~mouse_flag)
// 						shot_on <= 1'b1;
// 					aaa <= 1'b1;
// 					shotcount <= shotcount + 10'd1;
// 					if(shotcount > 1_000_000 && (mouse_flag == 1'b0))
// 					begin
// 						shot_on <= 1'b0;
// 						shotcount <= 0;
// 						mouse_flag <= 1;
// 					end
// 			 end
// 			 else 
// 			 begin
// 					shotcount <= 0;
// 					mouse_flag <= 0;
// 					aaa <= 1'b0;
// 					shot_on <= 1'b0;
// 			 end
					
// 			 aaa_delayed <= aaa;
// 			 if(count_enable == 1'b1 && count < 2'b11) 
// 			 begin
// 				count <= count + 2'b01;
// 				mouse_flag <= 0;
// 			end
// 			 else 
// 				begin
// 					if(duck_kill_signal_int)
// 						count <= 2'b00;
// 					else
// 						count <= count;
// 				end
// 			end
// 	 end

// 	//Duck Killed logic
// 	always_comb 
// 	begin:Duck_Killed
// 		if(BallX < Duck_X + 63 && BallX > Duck_X + 2 && BallY > Duck_Y + 2 && BallY < Duck_Y + 63 && shot_on)
// 			duck_kill_signal = 1'b1;

// 		else 
// 			duck_kill_signal = 1'b0;
// 	end
			

// //		drawing hierarchy
// 		 always_ff @ (posedge vga_clk)
// 		 begin:RGB_Display2
// 			if(blank) //added blank signal
// 			begin
// 				if(shot_on)
// 				begin
// 					if(DrawX >= BallX - 5'd25 && DrawX < BallX + 5'd26 && DrawY >= BallY - 5'd25 && DrawY < BallY + 5'd26)
// 					begin
// 						Red <= 4'hF;
// 						Green <= 4'hF;
// 						Blue <= 4'hF;
// 					end
// 					else 
// 					begin
// 						Red <= 4'h0;
// 						Green <= 4'h0;
// 						Blue <= 4'h0;
// 					end
// 				end
// 				else
// 				begin
// 	 			if ((ball_on == 1'b1)) 	//COLORING MOUSE
// 	 			begin 
// 	 				Red <= 4'hF; 		//color changed to white to more closely match color of game cursor...original orange color commented out.
// 	 				Green <= 4'hF/*55*/;
// 	 				Blue <= 4'hF/*00*/;
// 	 			end
// 				else
// 				begin
// 					if (fly_away_on == 1'b1)
// 					begin
// 						Red <= flyaway_palette_red;
// 						Green <= flyaway_palette_green;
// 						Blue <= flyaway_palette_blue;
// 					end
// 					else
// 					begin
// 						if ((dog_on == 1'b1)) 	//COLORING DOG
// 						begin 
// 							Red <= dog_palette_red;
// 							Green <= dog_palette_green;
// 							Blue <= dog_palette_blue;
// 						end  		  
// 						else 
// 						begin
// 							if((duck_on == 1'b1))
// 							begin
// 								case(Duck_color)	//COLORING DUCKS
// 									2'b00: begin
// 										Red <= ducks_black_palette_red;
// 										Green <= ducks_black_palette_green;
// 										Blue <= ducks_black_palette_blue;
// 									end
// 									2'b01: begin
// 										Red <= ducks_red_palette_red;
// 										Green <= ducks_red_palette_green;
// 										Blue <= ducks_red_palette_blue;
// 									end
// 									2'b10: begin
// 										Red <= ducks_pink_palette_red;
// 										Green <= ducks_pink_palette_green;
// 										Blue <= ducks_pink_palette_blue;
// 									end
// 									default: begin
// 										Red <= ducks_black_palette_red;
// 										Green <= ducks_black_palette_green;
// 										Blue <= ducks_black_palette_blue;
// 									end
// 								endcase
// 							end
// 							else
// 							begin
// 								if((square_on1 == 1'b1 || square_on2 == 1'b1 || square_on3 == 1'b1) && start_game_signal_int) //COLORING SHOT COUNTER
// 								begin
// 									Red <= 4'hA;
// 									Green <= 4'hA;
// 									Blue <= 4'hA;
// 								end
// 								else 
// 								begin
									if((HighScoreNumber1_on) || (HighScoreNumber2_on) || (HighScoreNumber3_on) || (HighScoreNumber4_on) || (HighScoreNumber5_on) || (HighScoreNumber6_on))
									begin
										if(HighScoreNumber1_on == 1)
										begin
											Red <= HighScorenumber1_palette_red;
											Green <= HighScorenumber1_palette_green;
											Blue <= HighScorenumber1_palette_blue;
										end
										if(HighScoreNumber2_on == 1)
										begin
											Red <= HighScorenumber2_palette_red;
											Green <= HighScorenumber2_palette_green;
											Blue <= HighScorenumber2_palette_blue;
										end
										if(HighScoreNumber3_on == 1)
										begin
											Red <= HighScorenumber3_palette_red;
											Green <= HighScorenumber3_palette_green;
											Blue <= HighScorenumber3_palette_blue;
										end
										if(HighScoreNumber4_on == 1)
										begin
											Red <= HighScorenumber4_palette_red;
											Green <= HighScorenumber4_palette_green;
											Blue <= HighScorenumber4_palette_blue;
										end
										if(HighScoreNumber5_on == 1)
										begin
											Red <= HighScorenumber5_palette_red;
											Green <= HighScorenumber5_palette_green;
											Blue <= HighScorenumber5_palette_blue;
										end
										if(HighScoreNumber6_on == 1)
										begin
											Red <= HighScorenumber6_palette_red;
											Green <= HighScorenumber6_palette_green;
											Blue <= HighScorenumber6_palette_blue;
										end
									end
									else
									begin
										if((ScoreNumber1_on) || (ScoreNumber2_on) || (ScoreNumber3_on) || (ScoreNumber4_on) || (ScoreNumber5_on) || (ScoreNumber6_on))
										begin
											if(ScoreNumber1_on == 1)
											begin
												Red <= scorenumber1_palette_red;
												Green <= scorenumber1_palette_green;
												Blue <= scorenumber1_palette_blue;
											end
											if(ScoreNumber2_on == 1)
											begin
												Red <= scorenumber2_palette_red;
												Green <= scorenumber2_palette_green;
												Blue <= scorenumber2_palette_blue;
											end
											if(ScoreNumber3_on == 1)
											begin
												Red <= scorenumber3_palette_red;
												Green <= scorenumber3_palette_green;
												Blue <= scorenumber3_palette_blue;
											end
											if(ScoreNumber4_on == 1)
											begin
												Red <= scorenumber4_palette_red;
												Green <= scorenumber4_palette_green;
												Blue <= scorenumber4_palette_blue;
											end
											if(ScoreNumber5_on == 1)
											begin
												Red <= scorenumber5_palette_red;
												Green <= scorenumber5_palette_green;
												Blue <= scorenumber5_palette_blue;
											end
											if(ScoreNumber6_on == 1)
											begin
												Red <= scorenumber6_palette_red;
												Green <= scorenumber6_palette_green;
												Blue <= scorenumber6_palette_blue;
											end
										end
										else
										begin
											// if((RoundNumber1_on) || (RoundNumber2_on))
											// begin
											// 	if(RoundNumber1_on == 1)
											// 	begin
											// 		Red <= RoundNumber1_palette_red;
											// 		Green <= RoundNumber1_palette_green;
											// 		Blue <= RoundNumber1_palette_blue;
											// 	end
											// 	if(RoundNumber2_on == 1)
											// 	begin
											// 		Red <= RoundNumber2_palette_red;
											// 		Green <= RoundNumber2_palette_green;
											// 		Blue <= RoundNumber2_palette_blue;
											// 	end
		// 									end
		// 									else
		// 									begin
		// 										if(duck_counter_on_1 > 2'b00 || duck_counter_on_2 > 2'b00 || duck_counter_on_3 > 2'b00 || duck_counter_on_4 > 2'b00 || duck_counter_on_5 > 2'b00 || duck_counter_on_6 > 2'b00 || duck_counter_on_7 > 2'b00 || duck_counter_on_8 > 2'b00 || duck_counter_on_9 > 2'b00 || duck_counter_on_10 > 2'b00)
		// 										begin
		// 											case(duck_counter_on_1)
		// 												2'b01:begin
		// 												Red <= 4'hF;
		// 												Blue <= 4'hF;
		// 												Green <= 4'hF;
		// 												end
		// 												2'b10:begin
		// 												Red <= 4'hD;
		// 												Blue <= 4'h0;
		// 												Green <= 4'h0;
		// 												end
		// 												default: ;
		// 											endcase
		// 											case(duck_counter_on_2)
		// 												2'b01:begin
		// 												Red <= 4'hF;
		// 												Blue <= 4'hF;
		// 												Green <= 4'hF;
		// 												end
		// 												2'b10:begin
		// 												Red <= 4'hD;
		// 												Blue <= 4'h0;
		// 												Green <= 4'h0;
		// 												end
		// 												default: ;
		// 											endcase
		// 											case(duck_counter_on_3)
		// 												2'b01:begin
		// 												Red <= 4'hF;
		// 												Blue <= 4'hF;
		// 												Green <= 4'hF;
		// 												end
		// 												2'b10:begin
		// 												Red <= 4'hD;
		// 												Blue <= 4'h0;
		// 												Green <= 4'h0;
		// 												end
		// 												default: ;
		// 											endcase
		// 											case(duck_counter_on_4)
		// 												2'b01:begin
		// 												Red <= 4'hF;
		// 												Blue <= 4'hF;
		// 												Green <= 4'hF;
		// 												end
		// 												2'b10:begin
		// 												Red <= 4'hD;
		// 												Blue <= 4'h0;
		// 												Green <= 4'h0;
		// 												end
		// 												default: ;
		// 											endcase
		// 											case(duck_counter_on_5)
		// 												2'b01:begin
		// 												Red <= 4'hF;
		// 												Blue <= 4'hF;
		// 												Green <= 4'hF;
		// 												end
		// 												2'b10:begin
		// 												Red <= 4'hD;
		// 												Blue <= 4'h0;
		// 												Green <= 4'h0;
		// 												end
		// 												default: ;
		// 											endcase
		// 											case(duck_counter_on_6)
		// 												2'b01:begin
		// 												Red <= 4'hF;
		// 												Blue <= 4'hF;
		// 												Green <= 4'hF;
		// 												end
		// 												2'b10:begin
		// 												Red <= 4'hD;
		// 												Blue <= 4'h0;
		// 												Green <= 4'h0;
		// 												end
		// 												default: ;
		// 											endcase
		// 											case(duck_counter_on_7)
		// 												2'b01:begin
		// 												Red <= 4'hF;
		// 												Blue <= 4'hF;
		// 												Green <= 4'hF;
		// 												end
		// 												2'b10:begin
		// 												Red <= 4'hD;
		// 												Blue <= 4'h0;
		// 												Green <= 4'h0;
		// 												end
		// 												default: ;
		// 											endcase
		// 											case(duck_counter_on_8)
		// 												2'b01:begin
		// 												Red <= 4'hF;
		// 												Blue <= 4'hF;
		// 												Green <= 4'hF;
		// 												end
		// 												2'b10:begin
		// 												Red <= 4'hD;
		// 												Blue <= 4'h0;
		// 												Green <= 4'h0;
		// 												end
		// 												default: ;
		// 											endcase
		// 											case(duck_counter_on_9)
		// 												2'b01:begin
		// 												Red <= 4'hF;
		// 												Blue <= 4'hF;
		// 												Green <= 4'hF;
		// 												end
		// 												2'b10:begin
		// 												Red <= 4'hD;
		// 												Blue <= 4'h0;
		// 												Green <= 4'h0;
		// 												end
		// 												default: ;
		// 											endcase
		// 											case(duck_counter_on_10)
		// 												2'b01:begin
		// 												Red <= 4'hF;
		// 												Blue <= 4'hF;
		// 												Green <= 4'hF;
		// 												end
		// 												2'b10:begin
		// 												Red <= 4'hD;
		// 												Blue <= 4'h0;
		// 												Green <= 4'h0;
		// 												end
		// 												default: ;
		// 											endcase
		// 										end
		// 										else
		// 										begin
		// 											case(background)
		// 												2'b00: begin
		// 													Red <= 4'hB;//mainmenu_palette_red;
		// 													Green <= 4'hB;//mainmenu_palette_green;
		// 													Blue <= 4'hB;//mainmenu_palette_blue;
		// 												end
		// 												2'b01: begin
		// 													Red <= 4'hB;//bg_palette_red;
		// 													Green <= 4'hB;//bg_palette_green;
		// 													Blue <= 4'hB;//bg_palette_blue;
		// 												end
		// 												2'b10: begin
		// 													Red <= 4'hB;//bg1_palette_red;
		// 													Green <= 4'hB;//bg1_palette_green;
		// 													Blue <= 4'hB;//bg_palette_blue;
		// 												end
		// 												default: ;
		// 											endcase
		// 										end
											end
										end
// 									end	
// 								end
// 							end
// 						end
// 					end
// 				end
// 			end
// 		end
// 		else //blanking
// 		begin
// 	 		Red <= 4'h0;
//          Green <= 4'h0;
//          Blue <= 4'h0;
// 	 	end
			
//     end 

// 	bgs0_rom bgs0_rom (
// 	.clock   (vga_clk),
// 	.address (bg_rom_address),
// 	.q       (bg_rom_q)
// 	);

// 	bgs0_palette bgs0_palette (
// 	.index (bg_rom_q),
// 	.red   (bg_palette_red),
// 	.green (bg_palette_green),
// 	.blue  (bg_palette_blue)
// 	);
	
// 	bgs1_palette bgs1_palette (
// 	.index (bg_rom_q),
// 	.red   (bg1_palette_red),
// 	.green (bg1_palette_green),
// 	.blue  (bg1_palette_blue)
// 	);

// logic negedge_vga_clk;
// assign negedge_vga_clk = ~vga_clk;

// 	AssetsDogs_rom AssetsDogs_rom (
// 		.clock   (negedge_vga_clk),
// 		.frame   (Frame),
// 		.address (dog_rom_address),	
// 		.q       (dog_rom_q),
// 		.DogSizeX,
// 		.DogSizeY
		
// 	);

// 	AssetsDogs_palette AssetsDogs_palette (
// 		.index (dog_rom_q),
// 		.red   (dog_palette_red),
// 		.green (dog_palette_green),
// 		.blue  (dog_palette_blue)
// 	);

// 	AssetsDucks_rom AssetsDucks_rom (
// 		.frame	(DuckFrame),
// 		.clock   (vga_clk),
// 		.address (ducks_rom_address),
// 		.q       (ducks_rom_q),
// 		.DuckSizeX,
// 		.DuckSizeY
		
// 	);


// 	AssetsDucks_black_palette AssetsDucks_palette1 (
// 		.index (ducks_rom_q),
// 		.red   (ducks_black_palette_red),
// 		.green (ducks_black_palette_green),
// 		.blue  (ducks_black_palette_blue)
// 	);

// 	AssetsDucks_red_palette AssetsDucks_palette2 (
// 		.index (ducks_rom_q),
// 		.red   (ducks_red_palette_red),
// 		.green (ducks_red_palette_green),
// 		.blue  (ducks_red_palette_blue)
// 	);

// 	AssetsDucks_pink_palette AssetsDucks_palette3 (
// 		.index (ducks_rom_q),
// 		.red   (ducks_pink_palette_red),
// 		.green (ducks_pink_palette_green),
// 		.blue  (ducks_pink_palette_blue)
// 	);

// 	mainmenu_rom mainmenu_rom (
// 		.clock   (vga_clk),
// 		.address (mainmenu_rom_address),
// 		.q       (mainmenu_rom_q)
// 	);

// 	mainmenu_palette mainmenu_palette (
// 		.index (mainmenu_rom_q),
// 		.red   (mainmenu_palette_red),
// 		.green (mainmenu_palette_green),
// 		.blue  (mainmenu_palette_blue)
// 	);
	
	
// 	flyaway_rom flyaway_rom (
// 		.clock   (negedge_vga_clk),
// 		.address (flyaway_rom_address),
// 		.q       (flyaway_rom_q)
// 	);

// 	flyaway_palette flyaway_palette (
// 		.index (flyaway_rom_q),
// 		.red   (flyaway_palette_red),
// 		.green (flyaway_palette_green),
// 		.blue  (flyaway_palette_blue)
// 	);

//     RoundNumbers_rom RoundNumbers1_rom (
// 		.clock   (negedge_vga_clk),
// 		.address (RoundNumber1_rom_address),
// 		.q       (RoundNumber1_rom_q),
// 		.insert_number (RoundNumber1)
// 	);

//     RoundNumbers_rom RoundNumbers2_rom (
// 		.clock   (negedge_vga_clk),
// 		.address (RoundNumber2_rom_address),
// 		.q       (RoundNumber2_rom_q),
// 		.insert_number (RoundNumber2)
// 	);

// 	RoundNumbers_palette RoundNumbers1_palette (
// 		.index (RoundNumber1_rom_q),
// 		.red   (RoundNumber1_palette_red),
// 		.green (RoundNumber1_palette_green),
// 		.blue  (RoundNumber1_palette_blue)
// 	);

// 	RoundNumbers_palette RoundNumbers2_palette (
// 		.index (RoundNumber2_rom_q),
// 		.red   (RoundNumber2_palette_red),
// 		.green (RoundNumber2_palette_green),
// 		.blue  (RoundNumber2_palette_blue)
// 	);

ScoreNumbers_rom Score1_rom (
	.clock   (scorenumber1_negedge_vga_clk),
	.address (scorenumber1_rom_address),
	.q       (scorenumber1_rom_q)
	.input_number (ScoreNumber1)
);

ScoreNumbers_palette Score1_palette (
	.index (scorenumber1_rom_q),
	.red   (scorenumber1_palette_red),
	.green (scorenumber1_palette_green),
	.blue  (scorenumber1_palette_blue)
);

ScoreNumbers_rom Score2_rom (
	.clock   (scorenumber2_negedge_vga_clk),
	.address (scorenumber2_rom_address),
	.q       (scorenumber2_rom_q)
	.input_number (ScoreNumber2)
);

ScoreNumbers_palette Score2_palette (
	.index (scorenumber2_rom_q),
	.red   (scorenumber2_palette_red),
	.green (scorenumber2_palette_green),
	.blue  (scorenumber2_palette_blue)
);

ScoreNumbers_rom Score3_rom (
	.clock   (scorenumber3_negedge_vga_clk),
	.address (scorenumber3_rom_address),
	.q       (scorenumber3_rom_q)
	.input_number (ScoreNumber3)
);

ScoreNumbers_palette Score3_palette (
	.index (scorenumber3_rom_q),
	.red   (scorenumber3_palette_red),
	.green (scorenumber3_palette_green),
	.blue  (scorenumber3_palette_blue)
);

ScoreNumbers_rom Score4_rom (
	.clock   (scorenumber4_negedge_vga_clk),
	.address (scorenumber4_rom_address),
	.q       (scorenumber4_rom_q)
	.input_number (ScoreNumber4)
);

ScoreNumbers_palette Score4_palette (
	.index (scorenumber4_rom_q),
	.red   (scorenumber4_palette_red),
	.green (scorenumber4_palette_green),
	.blue  (scorenumber4_palette_blue)
);

ScoreNumbers_rom Score5_rom (
	.clock   (scorenumber5_negedge_vga_clk),
	.address (scorenumber5_rom_address),
	.q       (scorenumber5_rom_q)
	.input_number (ScoreNumber5)
);

ScoreNumbers_palette Score5_palette (
	.index (scorenumber5_rom_q),
	.red   (scorenumber5_palette_red),
	.green (scorenumber5_palette_green),
	.blue  (scorenumber5_palette_blue)
);

ScoreNumbers_rom Score6_rom (
	.clock   (scorenumber6_negedge_vga_clk),
	.address (scorenumber6_rom_address),
	.q       (scorenumber6_rom_q)
	.input_number (ScoreNumber6)
);

ScoreNumbers_palette Score6_palette (
	.index (scorenumber6_rom_q),
	.red   (scorenumber6_palette_red),
	.green (scorenumber6_palette_green),
	.blue  (scorenumber6_palette_blue)
);

HighScoreNumbers_rom HighScore1_rom (
	.clock   (HighScorenumber1_negedge_vga_clk),
	.address (HighScorenumber1_rom_address),
	.q       (HighScorenumber1_rom_q)
	.input_number (HighScoreNumber1)
);

HighScoreNumbers_palette HighScore1_palette (
	.index (HighScorenumber1_rom_q),
	.red   (HighScorenumber1_palette_red),
	.green (HighScorenumber1_palette_green),
	.blue  (HighScorenumber1_palette_blue)
);

HighScoreNumbers_rom HighScore2_rom (
	.clock   (HighScorenumber2_negedge_vga_clk),
	.address (HighScorenumber2_rom_address),
	.q       (HighScorenumber2_rom_q)
	.input_number (HighScoreNumber2)
);

HighScoreNumbers_palette HighScore2_palette (
	.index (HighScorenumber2_rom_q),
	.red   (HighScorenumber2_palette_red),
	.green (HighScorenumber2_palette_green),
	.blue  (HighScorenumber2_palette_blue)
);

HighScoreNumbers_rom HighScore3_rom (
	.clock   (HighScorenumber3_negedge_vga_clk),
	.address (HighScorenumber3_rom_address),
	.q       (HighScorenumber3_rom_q)
	.input_number (HighScoreNumber3)
);

HighScoreNumbers_palette HighScore3_palette (
	.index (HighScorenumber3_rom_q),
	.red   (HighScorenumber3_palette_red),
	.green (HighScorenumber3_palette_green),
	.blue  (HighScorenumber3_palette_blue)
);

HighScoreNumbers_rom HighScore4_rom (
	.clock   (HighScorenumber4_negedge_vga_clk),
	.address (HighScoreumber4_rom_address),
	.q       (HighScorenumber4_rom_q)
	.input_number (HighScoreNumber4)
);

HighScoreumbers_palette HighScore4_palette (
	.index (HighScorenumber4_rom_q),
	.red   (HighScorenumber4_palette_red),
	.green (HighScorenumber4_palette_green),
	.blue  (HighScorenumber4_palette_blue)
);

HighScoreumbers_rom HighScore5_rom (
	.clock   (HighScorenumber5_negedge_vga_clk),
	.address (HighScorenumber5_rom_address),
	.q       (HighScorenumber5_rom_q)
	.input_number (HighScoreNumber5)
);

HighScoreNumbers_palette HighScore5_palette (
	.index (HighScorenumber5_rom_q),
	.red   (HighScorenumber5_palette_red),
	.green (HighScorenumber5_palette_green),
	.blue  (HighScorenumber5_palette_blue)
);

HighScoreNumbers_rom HighScore6_rom (
	.clock   (HighScorenumber6_negedge_vga_clk),
	.address (HighScorenumber6_rom_address),
	.q       (HighScorenumber6_rom_q)
	.input_number (HighScoreNumber6)
);

HighScoreNumbers_palette HighScore6_palette (
	.index (HighScorenumber6_rom_q),
	.red   (HighScorenumber6_palette_red),
	.green (HighScorenumber6_palette_green),
	.blue  (HighScorenumber6_palette_blue)
);
    
// endmodule
