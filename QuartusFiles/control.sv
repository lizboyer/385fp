module control (input  logic Clk, Reset, ANIM_Clk, Run, duck_kill_signal, start_game_signal, 
					input logic [1:0] Duck_color_rand, Duck_direction_rand, Num_repeats_rand,	//NEW
					input logic [9:0] Dog_rand_X, Duck_start_rand_X,	//NEW
					input logic [1:0] count,

                	output logic [9:0] Dog_X, Dog_Y, LEDR, duck_killed, Dog_Y_int,
						output logic signed [10:0] Duck_X, Duck_Y,
					output logic jump2Signal, resetSignal, duckresetSignal, duck_bounce_signal, start_game_signal_int, duck_kill_signal_int, gameoversignal, fly_away, shoot_enable, out_of_shots,
					output logic [20:0] score, 
					output logic [20:0] highscore,
					output logic [4:0] Frame,
					output logic [5:0] DuckFrame,
					output logic [7:0] RoundNumber,
					output logic [1:0] Duck_color,
					output logic [5:0] flyaway_timer,
					output logic [3:0] end_walk, end_sniff, startjump, end_surprised, go_to_jump_2, end_jump_2, waitcount1, flycounter1, duck_shocked
					 );
					

				assign LEDR[3:0] = duck_number;
				assign LEDR[7:4] = duck_killed_total;
				assign LEDR[8] = (curr_state == NewRound);
				assign LEDR[9] = (curr_state == GameOver);
				
				
				
				

    // Declare signals curr_state, next_state of type enum
    // with enum values for states
    enum logic [5:0] {R, MainMenu, Walk1, Walk2, Walk3, Walk4, Sniff1, Sniff2, Surprised1, Jump1, Jump2, Wait1, DuckStart1, DuckStart2, Duck1, Duck2, Duck3, Duck4, H, DuckHit, Bounce1, Bounce2, DuckFall, DogUp, DogStay, DogDown, FlyOff, DogLaugh1, DogLaugh1_Up, DogLaugh1_Down, DogLaugh2, EndRound, GameOver, NewRound}   curr_state, next_state; 
	logic [3:0] Step_size_lg_x = 4'd15;
	logic [3:0] Step_size_sm_x = 4'd12;
	logic [3:0] Step_size_sm_y = 4'd2;
	logic [3:0] Step_size_lg_y = 4'd10;
	logic [3:0] duck_number;
	logic [5:0] DuckFrameInit;
	logic [9:0] Dog_rand_x_int;
	logic [9:0] Dog_Up_Step, Dog_Down_Step, Dog_Up_Step_int;
	logic [3:0] duck_killed_total;
	logic [4:0] doglaugh1_up_count;
	logic [4:0] doglaugh1_down_count; 	
	logic [4:0] flyoff_count;
	logic [4:0] stoplaugh_count;
	logic [5:0] gameover_count;
	logic [4:0] newround_count;
	logic [4:0] endround_count;


	logic signed [9:0] Duck_start, Duck_X_step, Duck_Y_step;
	logic [2:0] Duck_direction, Duck_direction_int;
	logic [2:0] Num_repeats;
	logic [4:0] dogup_count;
	logic [4:0] dogstay_count;
	logic [4:0] dogdown_count;
	
	//updates flip flop, current state is the only one
     always_ff @ (posedge ANIM_Clk or posedge Reset)  
    begin
       if (Reset)
			begin
			flyaway_timer <= 0;
         curr_state <= MainMenu;
			end_walk <=  4'b0000;
			end_sniff <= 4'b0000;
			startjump <= 4'b0000;
			end_surprised <= 4'b0000;
			go_to_jump_2 <= 4'b0000;
			end_jump_2 <= 4'b0000;
			waitcount1 <= 4'b0000;
			flycounter1 <= 4'b0000;
			Duck_X <= 400;
			Duck_Y <= 300;
			duck_shocked <= 4'b0000;
			duck_bounce_signal <= 1'b0;
			duck_killed <= 10'b0000000000;
			duck_number <= 0;	
//			Dog_Up_Step <= 0;
			Dog_Down_Step <= 0;
			RoundNumber <= 1;
			dogup_count <= 0;
			dogstay_count <= 0;
			dogdown_count <= 0;
			shoot_enable <= 1'b0;
			gameoversignal <= 1'b0;
			end
        else 
		  begin
		  	if(curr_state == Walk4) 
				begin
				end_walk <= end_walk + 4'b0001;
				if(end_walk == 8)
					end_walk <= 0;
				end
			if(curr_state == Sniff2)
				begin
				startjump <= startjump + 4'b0001;
				if(startjump == 1)
					startjump <= 0;
				end_sniff <= end_sniff + 4'b0001;
				if(end_sniff == 2)
					end_sniff <= 0;
				end
			if(curr_state == Surprised1)
				end_surprised <= end_surprised + 4'b0001;
			if(curr_state == Jump1)
				go_to_jump_2 <= go_to_jump_2 + 4'b0001;
				if(go_to_jump_2 == 9)
					go_to_jump_2 <= 0;
			if(curr_state == Jump2)
				end_jump_2 <= end_jump_2 + 4'b0001;
				if(end_jump_2 == 10)
					end_jump_2 <= 0;
			if(curr_state == Wait1)
				waitcount1 <= waitcount1 + 4'b0001;
					if(waitcount1 == 7)
		  				waitcount1 <= 0;
			if(curr_state == Duck4)
			begin
				Num_repeats <= Num_repeats_rand + 4'd3;
				flycounter1 <= flycounter1 + 4'b0001;
				if(flycounter1 == Num_repeats)
				begin
					Duck_direction <= Duck_direction_rand;
					flycounter1 <= 0;
				end
			end
			if(curr_state == DuckHit)
				begin
					duck_shocked <= duck_shocked + 4'b0001;
					duck_killed[duck_number-1] = 1'b1;
					if(duck_shocked == 15)
						duck_shocked <= 0;
					case(Duck_color)
					4'd0: begin		//BLACK
							if((RoundNumber >= 8'd1) && (RoundNumber < 8'd6) && duck_shocked == 0)
							begin
								score <= score + 500;
							end
							else
							begin
								if((RoundNumber >= 8'd6) && (RoundNumber < 8'd10) && duck_shocked == 0)
								begin
									score <= score + 800;
								end
								else
								begin
									if((RoundNumber >= 8'd11) && (RoundNumber < 8'd99) && duck_shocked == 0)
									begin
										score <= score + 1000;
									end
								end
							end
					end
					4'd1: begin		//RED
							if((RoundNumber >= 8'd1) && (RoundNumber < 8'd6) && duck_shocked == 0)
							begin
								score <= score + 1500;
							end
							else
							begin
								if((RoundNumber >= 8'd6) && (RoundNumber < 8'd10) && duck_shocked == 0)
								begin
									score <= score + 2400;
								end
								else
								begin
									if((RoundNumber >= 8'd11) && (RoundNumber < 8'd99) && duck_shocked == 0)
									begin
										score <= score + 3000;
									end
								end
							end
					end
					4'd2: begin	//PINK
							if((RoundNumber >= 8'd1) && (RoundNumber < 8'd6) && duck_shocked == 0)
							begin
								score <= score + 1000;
							end
							else
							begin
								if((RoundNumber >= 8'd6) && (RoundNumber < 8'd10) && duck_shocked == 0)
								begin
									score <= score + 1600;
								end
								else
								begin
									if((RoundNumber >= 8'd11) && (RoundNumber < 8'd99) && duck_shocked == 0)
									begin
										score <= score + 2000;
									end
								end
							end
					end
					endcase
				end
			if(curr_state == DuckStart1)
			begin
				out_of_shots <= 0;
				flyaway_timer <= 0;
				Duck_color <= (Duck_color_rand == 2'd3) ? 2'd0 : Duck_color_rand;
				Duck_X <= Duck_start_rand_X; //set x position via duck_x_position_rand
				Duck_Y <= 236;
				Duck_direction <= Duck_direction_rand;
				duck_number <= duck_number + 1;
			end
			if(curr_state == DuckStart2)
				begin
				flyaway_timer <= flyaway_timer + 6'd1;
				case(Duck_direction) //case statement for frame via direction
						3'b000: 	case(Duck_color) //NW
									2'b00: DuckFrameInit <= 6'd11;//Black
									2'b01: DuckFrameInit <= 6'd31;//Red
									2'b10: DuckFrameInit <= 6'd51;//Pink
									2'b11: DuckFrameInit <= 6'd11;//Black
									default: ;
								endcase
						3'b001: case(Duck_color)	//W
									2'b00: DuckFrameInit <= 6'd15; //Black
									2'b01: DuckFrameInit <= 6'd35;
									2'b10: DuckFrameInit <= 6'd55;
									2'b11: DuckFrameInit <= 6'd15;//Black
									default: ;
								endcase
						3'b010: case(Duck_color) //NE
									2'b00: DuckFrameInit <= 6'd0; //Black
									2'b01: DuckFrameInit <= 6'd20;
									2'b10: DuckFrameInit <= 6'd40;
									2'b11: DuckFrameInit <= 6'd0;//Black
									default: ;
								endcase
						3'b011: case(Duck_color)	//E
									2'b00: DuckFrameInit <= 6'd4; //Black
									2'b01: DuckFrameInit <= 6'd24;
									2'b10: DuckFrameInit <= 6'd44;
									2'b11: DuckFrameInit <= 6'd4;//Black
									default: ;
								endcase
						3'b100: case(Duck_color)  //SW
									2'b00: DuckFrameInit <= 6'd11;//Black
									2'b01: DuckFrameInit <= 6'd31;//Red
									2'b10: DuckFrameInit <= 6'd51;//Pink
									2'b11: DuckFrameInit <= 6'd11;//Black
									default: ;
								endcase
						3'b101: case(Duck_color)  //SE
									2'b00: DuckFrameInit <= 6'd0; //Black
									2'b01: DuckFrameInit <= 6'd20;
									2'b10: DuckFrameInit <= 6'd40;
									2'b11: DuckFrameInit <= 6'd0;//Black
									default: ;
								endcase
						
						default: ;
					endcase
				
				end
				
			if((curr_state == Duck1) || (curr_state == Duck2) || (curr_state == Duck3) || (curr_state == Duck4))
			begin
				if(Run)
					RoundNumber <= RoundNumber + 8'd1;
				if(count == 2'b11)
					out_of_shots <= 1'b1;
				shoot_enable <= 1'b1;
				flyaway_timer <= flyaway_timer + 6'd1;
				if(flyaway_timer >= 60)
					flyaway_timer <= 0;
				Duck_X <= Duck_X_step;
				Duck_Y <= Duck_Y_step;
				DuckFrameInit <= DuckFrameInit;
				if(curr_state == Duck1)
					DuckFrame <= DuckFrameInit;
				if(curr_state != Duck1)
					DuckFrame <= DuckFrame + 6'b000001;
				if((Duck_X <= 0 || Duck_Y <= 0 || Duck_Y >= 236 || Duck_X >= 576))
				begin
					flycounter1 <= 3'd0;
					duck_bounce_signal <= 1'b1;	
				end
			end
			
			if(curr_state == Bounce2)
			begin	
				flyaway_timer <= flyaway_timer + 6'd1;
				if(flyaway_timer >= 60)
					flyaway_timer <= 0;
				case(Duck_direction) //case statement for frame via direction
						3'b000: 	case(Duck_color) //NW
									2'b00: DuckFrameInit <= 6'd11;//Black
									2'b01: DuckFrameInit <= 6'd31;//Red
									2'b10: DuckFrameInit <= 6'd51;//Pink
									2'b11: DuckFrameInit <= 6'd11;//Black
									default: ;
								endcase
						3'b001: case(Duck_color)	//W
									2'b00: DuckFrameInit <= 6'd15; //Black
									2'b01: DuckFrameInit <= 6'd35;
									2'b10: DuckFrameInit <= 6'd55;
									2'b11: DuckFrameInit <= 6'd15;//Black
									default: ;
								endcase
						3'b010: case(Duck_color) //NE
									2'b00: DuckFrameInit <= 6'd0; //Black
									2'b01: DuckFrameInit <= 6'd20;
									2'b10: DuckFrameInit <= 6'd40;
									2'b11: DuckFrameInit <= 6'd0;//Black
									default: ;
								endcase
						3'b011: case(Duck_color)	//E
									2'b00: DuckFrameInit <= 6'd4; //Black
									2'b01: DuckFrameInit <= 6'd24;
									2'b10: DuckFrameInit <= 6'd44;
									2'b11: DuckFrameInit <= 6'd4;//Black
									default: ;
								endcase
						3'b100: case(Duck_color)  //SW
									2'b00: DuckFrameInit <= 6'd11;//Black
									2'b01: DuckFrameInit <= 6'd31;//Red
									2'b10: DuckFrameInit <= 6'd51;//Pink
									2'b11: DuckFrameInit <= 6'd11;//Black
									default: ;
								endcase
						3'b101: case(Duck_color)  //SE
									2'b00: DuckFrameInit <= 6'd0; //Black
									2'b01: DuckFrameInit <= 6'd20;
									2'b10: DuckFrameInit <= 6'd40;
									2'b11: DuckFrameInit <= 6'd0;//Black
									default: ;
								endcase
						
						default: ;
				endcase
//				Num_repeats <= 3'd5;
				duck_bounce_signal <= 1'b0;
			end
			
			if(curr_state == Bounce1)
			begin
				flyaway_timer <= flyaway_timer + 6'd1;
				if(flyaway_timer >= 60)
					flyaway_timer <= 0;
				case(Duck_direction)
						3'd0: begin
							if(Duck_Y <= 0)
							begin
								Duck_direction <= 3'd4;
								Duck_Y <= 20;
							end
							if(Duck_X <= 0)
							begin
								Duck_direction <= 3'd2;
								Duck_X <= 20;
							end
						end
						3'd1: begin
							if(Duck_Y <= 0)
							begin
								Duck_direction <= 3'd4; 
								Duck_Y <= 20;
							end
							if(Duck_X <= 0)
							begin
								Duck_direction <= 3'd3;
								Duck_X <= 20;
							end
						end
						3'd2: begin
							
							if(Duck_Y <= 0)
							begin
								Duck_direction <= 3'd5;
								Duck_Y <= 20;
							end
							else
							begin
								Duck_direction <= 3'd0;
								Duck_X <= 556;
							end
							
						end
						3'd3: begin
							
							if(Duck_Y <= 0)
							begin
								Duck_direction <= 3'd5;
								Duck_Y <= 20;
							end
							else
							begin
								Duck_direction <= 3'd1;
								Duck_X <= 556;
							end
							
						end
						3'd4: begin
							if(Duck_Y >= 236)
							begin
								Duck_direction <= 3'd0;
								Duck_Y <= 216;
							end
							if(Duck_X <= 0)
							begin
								Duck_direction <= 3'd5;
								Duck_X <= 20;
							end
						end
						3'd5: begin
							
							if(Duck_Y >= 236)
							begin
								Duck_direction <= 3'd2;
								Duck_Y <= 216;
							end
							else
							begin
								Duck_direction <= 3'd4;
								Duck_X <= 556;
							end
							
						end
						default: ;
				endcase
			end
			
			if(curr_state == MainMenu)
			begin
				gameoversignal <= 1'b0;
				duck_killed <= 0;
				RoundNumber <= 1;
				duck_number <= 0;
				duck_killed_total <= 0;
				score <= 0;
			end
				
			if(curr_state == DuckHit)
			begin
				if(duck_shocked == 14)
					duck_killed_total <= duck_killed_total + 4'd1;
				case(Duck_direction) //case statement for frame via direction
						3'b000: 	case(Duck_color) //NW
									2'b00: DuckFrame <= 6'd19;//Black
									2'b01: DuckFrame <= 6'd39;//Red
									2'b10: DuckFrame <= 6'd59;//Pink
									2'b11: DuckFrame <= 6'd19;//Black
									default: ;
								endcase
						3'b001: case(Duck_color)	//W
									2'b00: DuckFrame <= 6'd19; //Black
									2'b01: DuckFrame <= 6'd39;
									2'b10: DuckFrame <= 6'd59;
									2'b11: DuckFrame <= 6'd19;//Black
									default: ;
								endcase
						3'b010: case(Duck_color) //NE
									2'b00: DuckFrame <= 6'd8; //Black
									2'b01: DuckFrame <= 6'd28;
									2'b10: DuckFrame <= 6'd48;
									2'b11: DuckFrame <= 6'd8;//Black
									default: ;
								endcase
						3'b011: case(Duck_color)	//E
									2'b00: DuckFrame <= 6'd8; //Black
									2'b01: DuckFrame <= 6'd28;
									2'b10: DuckFrame <= 6'd48;
									2'b11: DuckFrame <= 6'd19;//Black
									default: ;
								endcase
						3'b100: case(Duck_color)  //SW
									2'b00: DuckFrame <= 6'd19;//Black
									2'b01: DuckFrame <= 6'd39;//Red
									2'b10: DuckFrame <= 6'd59;//Pink
									2'b11: DuckFrame <= 6'd19;//Black
									default: ;
								endcase
						3'b101: case(Duck_color)  //SE
									2'b00: DuckFrame <= 6'd8; //Black
									2'b01: DuckFrame <= 6'd28;
									2'b10: DuckFrame <= 6'd48;
									2'b11: DuckFrame <= 6'd8;//Black
									default: ;
								endcase
						default: ;
					endcase
				Duck_X <= Duck_X;
				Duck_Y <= Duck_Y;
			end
			if(curr_state == DuckFall)		//FALLING STATE
			begin
				Duck_X <= Duck_X;
				Duck_Y <= Duck_Y + 10;
				case(Duck_direction) //case statement for frame via direction
						3'b000: 	case(Duck_color) //NW
									2'b00: DuckFrame <= 6'd10;//Black
									2'b01: DuckFrame <= 6'd29;//Red
									2'b10: DuckFrame <= 6'd50;//Pink
									2'b11: DuckFrame <= 6'd10;//Black
									default: ;
								endcase
						3'b001: case(Duck_color)	//W
									2'b00: DuckFrame <= 6'd10; //Black
									2'b01: DuckFrame <= 6'd29;
									2'b10: DuckFrame <= 6'd50;
									2'b11: DuckFrame <= 6'd10;//Black
									default: ;
								endcase
						3'b010: case(Duck_color) //NE
									2'b00: DuckFrame <= 6'd9; //Black
									2'b01: DuckFrame <= 6'd30;
									2'b10: DuckFrame <= 6'd49;
									2'b11: DuckFrame <= 6'd9;//Black
									default: ;
								endcase
						3'b011: case(Duck_color)	//E
									2'b00: DuckFrame <= 6'd9; //Black
									2'b01: DuckFrame <= 6'd30;
									2'b10: DuckFrame <= 6'd49;
									2'b11: DuckFrame <= 6'd9;//Black
									default: ;
								endcase
						3'b100: case(Duck_color)  //SW
									2'b00: DuckFrame <= 6'd10;//Black
									2'b01: DuckFrame <= 6'd29;//Red
									2'b10: DuckFrame <= 6'd50;//Pink
									2'b11: DuckFrame <= 6'd10;//Black
									default: ;
								endcase
						3'b101: case(Duck_color)  //SE
									2'b00: DuckFrame <= 6'd9; //Black
									2'b01: DuckFrame <= 6'd30;
									2'b10: DuckFrame <= 6'd49;
									2'b11: DuckFrame <= 6'd9;//Black
									default: ;
								endcase
						default: ;
					endcase
			end
			
			if(curr_state == DogUp)
			begin
//				Dog_X <= Dog_rand_X;
				dogup_count <= dogup_count + 4'b0001;
				if(dogup_count == 5)
					dogup_count <= 0;
			end
			
			if(curr_state == DogStay)
			begin
//				Dog_X <= Dog_X;
				dogstay_count <= dogstay_count + 4'b0001;
				if(dogstay_count == 5)
					dogstay_count <= 0;
			end
			
			if(curr_state == DogDown)
			begin
//				Dog_X <= Dog_X;
				dogdown_count <= dogdown_count + 4'b0001;
				if(dogdown_count == 5)
					dogdown_count <= 0;
			end
			
			if(curr_state == FlyOff)
			begin
				flyoff_count <= flyoff_count + 5'b00001;
				if(flyoff_count >= 3)
					flyoff_count <= 0;
			end
			
			if(curr_state == DogLaugh1_Up)
			begin
				doglaugh1_up_count <= doglaugh1_up_count + 5'b00001;
				if(doglaugh1_up_count >= 5)
					doglaugh1_up_count <= 0;
			end
			
			if(curr_state == DogLaugh1_Down)
			begin
				doglaugh1_down_count <= doglaugh1_down_count + 5'b00001;
				if(doglaugh1_down_count >= 5)
					doglaugh1_down_count <= 0;
			end
			
			if((curr_state == DogLaugh1) || (curr_state == DogLaugh2))
			begin
				stoplaugh_count <= stoplaugh_count + 5'b00001;
				if(stoplaugh_count >= 5)
					stoplaugh_count <= 0;
			end
			
			if(curr_state == GameOver)
			begin
				gameover_count = gameover_count + 6'b00001;
				if(gameover_count > 50)
					gameover_count <= 0;
			end
			
			if(curr_state == EndRound)
			begin
				endround_count <= endround_count + 5'd1;
				if(endround_count > 10)
					endround_count <= 0;
				if(score > highscore)
					highscore <= score;
				if((RoundNumber >= 8'd1) && (RoundNumber < 8'd11))
				begin
					if(duck_killed_total < 6)
						gameoversignal <= 1'b1;
					else
						gameoversignal <= 1'b0;
				end
				else
				begin
					if((RoundNumber >= 8'd11) && (RoundNumber < 8'd13))
					begin
						if(duck_killed_total < 7)
							gameoversignal <= 1'b1;
						else
							gameoversignal <= 1'b0;
					end
					else
					begin
						if((RoundNumber >= 8'd13) && (RoundNumber < 8'd15))
						begin
							if(duck_killed_total < 8)
								gameoversignal <= 1'b1;
							else
								gameoversignal <= 1'b0;
						end
						else
						begin
							if((RoundNumber >= 8'd15) && (RoundNumber < 8'd20))
							begin
								if(duck_killed_total < 9)
									gameoversignal <= 1'b1;
								else
									gameoversignal <= 1'b0;
							end
							else
							begin
								if((RoundNumber >= 8'd20) && (RoundNumber < 8'd99))
								begin
									if(duck_killed_total < 10)
										gameoversignal <= 1'b1;
									else
										gameoversignal <= 1'b0;
								end
							end
						end
					end
				end
			end
			if(curr_state == NewRound)
			begin
				if(newround_count == 0)
					RoundNumber <= RoundNumber + 8'd1;
				else 
					RoundNumber <= RoundNumber;
				duck_killed <= 0;
				duck_killed_total <= 0;
				duck_number <= 0;
				end_walk <=  4'b0000;
				end_sniff <= 4'b0000;
				startjump <= 4'b0000;
				end_surprised <= 4'b0000;
				go_to_jump_2 <= 4'b0000;
				end_jump_2 <= 4'b0000;
				waitcount1 <= 4'b0000;
				newround_count = newround_count + 5'b00001;
				if(newround_count > 5)
					newround_count <= 0;
			end
         curr_state <= next_state;

		  end
    end

	///////////////////////
	// HANDLES STEP SIZE //
	///////////////////////
	
always_ff @ (posedge ANIM_Clk)
begin
	if(curr_state == DuckFall)
		Dog_rand_x_int <= Dog_rand_X;
//		Dog_Up_Step_int <= 300;
//		Dog_Up_Step <= 300;//Dog_Up_Step_int;
//		Dog_Y <= 300;

//		Dog_Up_Step <= Dog_Y;
//		Dog_Down_Step <= Dog_Y;
end

always_ff @ (posedge ANIM_Clk)
begin
	if(flyaway_timer >= 50 && flyaway_timer < 60)
		fly_away <= 1'b1;
	else 
		fly_away <= 1'b0;
end
	
	
	always_ff @ (posedge ANIM_Clk)
	begin
//		Dog_Up_Step <= Dog_Y;
//		Dog_Down_Step <= Dog_Y;
//		if(curr_state == DuckFall)
//			Dog_Up_Step <= 300;
//			Dog_rand_x_int <= Dog_rand_X;
		if(curr_state == DogUp)
//			Dog_Up_Step <= Dog_Up_Step_int;
			Dog_Up_Step <= Dog_Up_Step - 3;
		if(curr_state == DogDown)
			Dog_Down_Step <= Dog_Down_Step + 3;
		else 
			Dog_Up_Step <= Dog_Up_Step;
	end

	
	always_ff @ (posedge ANIM_Clk)
	begin
		if(curr_state == DuckStart1)
		begin
			Duck_X_step <= Duck_start_rand_X;
			Duck_Y_step <= 236;
		end
		else
		begin
			Duck_X_step <= Duck_X;
			Duck_Y_step <= Duck_Y;
		end
		if((curr_state == Duck1) || (curr_state == Duck2) || (curr_state == Duck3) || (curr_state == Duck4))
		begin
			case(Duck_direction)
				3'b000: begin	//NW
					Duck_X_step <= Duck_X_step - Step_size_sm_x;
					Duck_Y_step <= Duck_Y_step - Step_size_lg_y;
				end
				3'b001:begin		//W
					Duck_X_step <= Duck_X_step - Step_size_lg_x;
					Duck_Y_step <= Duck_Y_step - Step_size_sm_y;
				end
				3'b010:begin		//NE
					Duck_X_step <= Duck_X_step + Step_size_sm_x;
					Duck_Y_step <= Duck_Y_step - Step_size_lg_y;
				end
				3'b011:begin		//E
					Duck_X_step <= Duck_X_step + Step_size_lg_x;
					Duck_Y_step <= Duck_Y_step - Step_size_sm_y;
				end
				3'b100:begin      //SW
					Duck_X_step <= Duck_X_step - Step_size_sm_x;
					Duck_Y_step <= Duck_Y_step + Step_size_lg_y;
				end
				3'b101:begin      //SE
					Duck_X_step <= Duck_X_step + Step_size_sm_x;
					Duck_Y_step <= Duck_Y_step + Step_size_lg_y;
				end
				default: ;
			endcase
		end
	end


	
	
	
	
	///////////////////////////////////
    //		 State Machine Flow 	 //
	///////////////////////////////////
	always_comb
    begin
		Frame = 5'd0;
		Dog_X = 0;
		Dog_Y = 0;
		resetSignal = 1'b0;
		jump2Signal = 1'b0;
		duckresetSignal = 1'b1;
		start_game_signal_int = 1'b1;
		duck_kill_signal_int = 1'b0;
	

		next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state) 

            R :    
							if(Run)
                       next_state = /*Walk1*/ MainMenu; //change depending on what you are testing
							else 
								next_state = R;
			MainMenu: if(start_game_signal)
						next_state = Walk1;
            Walk1:  
						if(gameoversignal)
							next_state = MainMenu;
						else
							next_state = Walk2;
            Walk2:    next_state = Walk3;
			Walk3:    next_state = Walk4;
			Walk4:	   if(end_walk == 4 || end_walk == 7)
						next_state = Sniff1;
					else
						next_state = Walk1;
			Sniff1:	   next_state = Sniff2;
			Sniff2:    if(end_sniff == 2)
						  begin 
							 if(startjump == 1)	//if ready to be surprised
								 next_state = Surprised1;
							 if(startjump == 0)
								begin
								 next_state = Walk1;
								end
						  end
						  else							//sniff again
							 next_state = Sniff1;
			Surprised1:    if(end_surprised == 1)
								next_state = Jump1;
			Jump1:	   if(go_to_jump_2 == 9)
							next_state = Jump2;
			Jump2:   	if(end_jump_2 == 9)
							next_state = Wait1;
			Wait1:		if(waitcount1 == 6)
							next_state = DuckStart1; //initializes direction + color
			DuckStart1:
							next_state = DuckStart2; 
			DuckStart2: if(flyaway_timer >= 60)
							next_state = FlyOff;
						else
						next_state = Duck1;
			Duck1: 	if(out_of_shots)
							next_state = DogLaugh1_Up;
						else
						begin
							if(flyaway_timer >= 60)
								next_state = FlyOff;
							else
							begin
								if(duck_kill_signal == 1)
									next_state = DuckHit;
								else
								begin
									if(duck_bounce_signal == 1)
										next_state = Bounce1;
									else 
										next_state = Duck2;
								end
							end
						end
			Duck2: 	if(out_of_shots)
							next_state = DogLaugh1_Up;
						else
						begin
							if(flyaway_timer >= 60)
								next_state = FlyOff;
							else
							begin
								if(duck_kill_signal == 1)
									next_state = DuckHit;
								else
								begin
									if(duck_bounce_signal == 1)
										next_state = Bounce1;
									else 
										next_state = Duck3;
								end
							end
						end
			Duck3: 	if(out_of_shots)
							next_state = DogLaugh1_Up;
						else
						begin
							if(flyaway_timer >= 60)
								next_state = FlyOff;
							else
							begin
								if(duck_kill_signal == 1)
									next_state = DuckHit;
								else
								begin
									if(duck_bounce_signal == 1)
										next_state = Bounce1;
									else 
										next_state = Duck4;
								end
							end
						end

			Duck4: 	if(out_of_shots)
							next_state = DogLaugh1_Up;
						else
						begin
							if(flyaway_timer >= 60)
								next_state = FlyOff;
							else
							begin
								if(duck_kill_signal == 1)
									next_state = DuckHit;
								else
								begin
									if(duck_bounce_signal == 1)
										next_state = Bounce1;
									else
									begin
										if ((flycounter1 == Num_repeats))
											next_state = DuckStart2;
										else
											next_state = Duck1;
									end
								end
							end
						end
			Bounce1: if(flyaway_timer >= 60)
							next_state = FlyOff;
					 else
						next_state = Bounce2;
			Bounce2: if(flyaway_timer >= 60)
						next_state = FlyOff;
					 else
						next_state = Duck1;
			DuckHit: if(duck_shocked == 15)
							next_state = DuckFall;
			DuckFall: if(Duck_Y > 300)
							next_state = DogUp;
			DogUp: if(dogup_count >= 5)
							next_state = DogStay;
			DogStay: if(dogstay_count >= 5)
							next_state = DogDown;
			DogDown: if(duck_number >= 10)
						next_state = EndRound;
						else
						begin
							if(dogdown_count >= 5)
								next_state = DuckStart1;
						end
			FlyOff: if(flyoff_count >= 3)
							next_state = DogLaugh1_Up;
			DogLaugh1_Up: if(doglaugh1_up_count >= 5)
							next_state = DogLaugh2;
			DogLaugh2: if(stoplaugh_count >= 5)
							next_state = DogLaugh1_Down;
						else
							next_state = DogLaugh1;
			DogLaugh1: if(stoplaugh_count >= 5)
							next_state = DogLaugh1_Down;
						else
							next_state = DogLaugh2;
			DogLaugh1_Down: if(duck_number >= 10)
								next_state = EndRound;
							else
							begin
								if(doglaugh1_down_count >= 5)
									next_state = DuckStart1;
							end
			EndRound: 	if(gameoversignal)
							next_state = GameOver;
						else
						begin
							if(endround_count >= 10)
								next_state = NewRound;
						end
			GameOver:	if(gameover_count >= 50)
								next_state = MainMenu;
			NewRound:	if(newround_count >= 5)
							next_state = Walk1;
            H :   /* if(Reset)	//holds, was ~Run */
						next_state = R;
							  
        endcase
   
		  /////////////////////////////////////
		  // Assign outputs based on ‘state’ //
		  /////////////////////////////////////
        case (curr_state) 
				MainMenu:
				begin
				resetSignal = 1'b1;
				start_game_signal_int = 1'b0;
				end
	   	   R: 
	         begin
				Dog_X = 10'b0000001011;	//11
				Dog_Y = 10'd290; //290
				Frame = 5'b00000;
				resetSignal = 1'b1;
				start_game_signal_int = 1'b0;
		      end

	   	   Walk1: 
		      begin
				Dog_X = 10'b0000010011 + (32*end_walk); //19
				Dog_Y = 10'd290; //290
				Frame = 5'b00001;
		      end

	   	   Walk2: 
		      begin
				Dog_X = 10'b0000011011 + (32*end_walk); //27
				Dog_Y = 10'd290; //290
				Frame = 5'b00010;
		      end

	   	   Walk3: 
		      begin
				Dog_X = 10'b0000100011 + (32*end_walk); //35 
				Dog_Y = 10'd290; //290
				Frame = 5'b00011;
		      end

	   	   Walk4: 
		      begin
				Dog_X = 10'b0000101011 + (32*end_walk); //43
				Dog_Y = 10'd290; //290
				Frame = 5'b00011;
		      end

		   Sniff1:
		   	  begin
				Frame = 5'b00100;
				Dog_X = 10'b0000101011 + (32*end_walk); //43
				Dog_Y = 10'd290; //290
			  end
		   Sniff2:
		   	  begin
				Dog_X = 10'b0000101011 + (32*end_walk); //43
				Dog_Y = 10'd290; //290
				Frame = 5'b00101;
				
			  end
			Surprised1:
		     begin
				   Dog_X = 10'b0000101011 + (32*end_walk); //43
					Dog_Y = 10'd290; //290
					Frame = 5'b00110;
			  end
			Jump1:
		   	  begin
				  case(go_to_jump_2)
						4'd0:
						begin
						Dog_X = 10'd267; //267
						Dog_Y = 10'd290; //290
						end
						4'd1:
						begin
						Dog_X = 10'd276; //276
						Dog_Y = 10'd274; //274
						end
						4'd2:
						begin
						Dog_X = 10'd285; //285
						Dog_Y = 10'd260; //260
						end
						4'd3:
						begin
						Dog_X = 10'd294; //294
						Dog_Y = 10'd248; //248
						end
						4'd4:
						begin
						Dog_X = 10'd303; //303
						Dog_Y = 10'd238; //238
						end
						4'd5:
						begin
						Dog_X = 10'd312; //312
						Dog_Y = 10'd229; //229
						end
						4'd6:
						begin
						Dog_X = 10'd321; //321
						Dog_Y = 10'd222; //222
						end
						4'd7:
						begin
						Dog_X = 10'd330; //330
						Dog_Y = 10'd217; //217
						end
						4'd8:
						begin
						Dog_X = 10'd341; //341
						Dog_Y = 10'd213; //213
						end
						4'd9:
						begin
						Dog_X = 10'd352; //352
						Dog_Y = 10'd212; //212
						end
						default: ;
					endcase
				Frame = 5'b00111;
			  end
			Jump2:
		   	  begin
				   case(end_jump_2)
						4'd0:
						begin
						Dog_X = 10'd352;
						Dog_Y = 10'd212;
						end
						4'd1:
						begin
						Dog_X = 10'd363; //267
						Dog_Y = 10'd213; //300
						end
						4'd2:
						begin
						Dog_X = 10'd374; //276
						Dog_Y = 10'd217; //284
						end
						4'd3:
						begin
						Dog_X = 10'd383; //285
						Dog_Y = 10'd222; //270
						end
						4'd4:
						begin
						Dog_X = 10'd392; //294
						Dog_Y = 10'd229; //258
						end
						4'd5:
						begin
						Dog_X = 10'd401; //303
						Dog_Y = 10'd238; //248
						end
						4'd6:
						begin
						Dog_X = 10'd410; //312
						Dog_Y = 10'd248; //239
						end
						4'd7:
						begin
						Dog_X = 10'd419; //321
						Dog_Y = 10'd260; //232
						end
						4'd8:
						begin
						Dog_X = 10'd428; //330
						Dog_Y = 10'd274; //227
						end
						4'd9:
						begin
						Dog_X = 10'd437; //341
						Dog_Y = 10'd290; //223
						end
						default: ;
					endcase
				jump2Signal = 1'b1;
				Frame = 5'b01000;
			  end
		   Wait1: begin
				resetSignal = 1'b1;	//wait for 1 second, 10 frames
				end
		   DuckStart1: begin
			resetSignal = 1'b1;
			end
		   DuckStart2: begin
				resetSignal = 1'b1;
				duckresetSignal = 1'b0;
				
				end
		   Duck1: begin
				resetSignal = 1'b1;
				duckresetSignal = 1'b0;
			end
			Duck2: begin
				resetSignal = 1'b1;
				duckresetSignal = 1'b0;
			end
			Duck3: begin
				resetSignal = 1'b1;
				duckresetSignal = 1'b0;
			end
			Duck4: begin
				resetSignal = 1'b1;
				duckresetSignal = 1'b0;
			end
			Bounce1: begin
				resetSignal = 1'b1;
				duckresetSignal = 1'b0;
			end
			Bounce2: begin
				resetSignal = 1'b1;
				duckresetSignal = 1'b0;
			end
			DuckHit: begin
				resetSignal = 1'b1;
				duckresetSignal = 1'b0;
				duck_kill_signal_int = 1'b1;
			end
			DuckFall: begin
				resetSignal = 1'b1;
				duckresetSignal = 1'b0;
			end
			DogUp: begin
				Frame = 5'b01001;
				duckresetSignal = 1'b0;
				Dog_X = Dog_rand_x_int;
				Dog_Y = 280;
				jump2Signal = 1'b1;
			end
			DogStay: begin
				Frame = 5'b01001;
				Dog_X = Dog_rand_x_int;
				duckresetSignal = 1'b0;
				Dog_Y = 250;
				jump2Signal = 1'b1;
			end
			DogDown: begin
				Frame = 5'b01001;
				Dog_X = Dog_rand_x_int;
				duckresetSignal = 1'b0;
				Dog_Y = 280;
				jump2Signal = 1'b1;
			end
			FlyOff: begin
				duckresetSignal = 1'b0;
				resetSignal = 1'b1;
			end
			DogLaugh1: begin
				resetSignal = 1'b0;
				duckresetSignal = 1'b1;
				Dog_X = Dog_rand_x_int;
				Dog_Y = 240;
				Frame = 5'b01010; // 10
				jump2Signal = 1'b1;
			end
			DogLaugh2: begin
				resetSignal = 1'b0;
				duckresetSignal = 1'b1;
				Dog_X = Dog_rand_x_int;
				Dog_Y = 240;
				Frame = 5'b01011; // 11
				jump2Signal = 1'b1;
			end
			DogLaugh1_Up: begin
				resetSignal = 1'b0;
				duckresetSignal = 1'b1;
				Dog_X = Dog_rand_x_int;
				Dog_Y = 270;
				Frame = 5'b01010; // 10
				jump2Signal = 1'b1;
			end
			DogLaugh1_Down: begin
				resetSignal = 1'b0;
				duckresetSignal = 1'b1;
				Dog_X = Dog_rand_x_int;
				Dog_Y = 270;
				Frame = 5'b01010; // 10
				jump2Signal = 1'b1;
			end
			EndRound: begin
				resetSignal = 1'b1;
				duckresetSignal = 1'b1;
			end
			GameOver: begin
				resetSignal = 1'b1;
				duckresetSignal = 1'b1;
			end
			NewRound: begin
				resetSignal = 1'b1;
				duckresetSignal = 1'b1;
			end

//GAME LOGIC STATES WIP

	   	   H: 
		      begin
				resetSignal = 1'b1;
				Dog_X = 10'b0000101011 + (32*end_walk); //43
				Dog_Y = 10'b0100111110; //318
				Frame = 5'b00000;
		      end	

	   	   default: ;
        endcase
    end

endmodule
