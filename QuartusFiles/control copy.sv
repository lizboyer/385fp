module dog_control (input  logic Clk, Reset, ANIM_Clk, Run, duck_kill_signal, start_game_signal,
					input logic [1:0] Duck_color_rand, Duck_direction_rand, Num_repeats_rand,	//NEW
					input logic [9:0] Dog_rand_X, Duck_start_rand_X,	//NEW

                	output logic [9:0] Dog_X, Dog_Y, Duck_X, Duck_Y, LEDR,
					output logic jump2Signal, resetSignal, duckresetSignal, duck_bounce_signal,
					output logic [4:0] Frame,
					output logic [5:0] DuckFrame,
					output logic [1:0] Duck_color,
					output logic [3:0] end_walk, end_sniff, startjump, end_surprised, go_to_jump_2, end_jump_2, waitcount1, flycounter1, duck_shocked
					 );
					

				assign LEDR[0] = (Duck_X == 0 || Duck_X == 640 || Duck_Y == 0 || Duck_Y == 460);
				assign LEDR[1] = (curr_state == Bounce);
				assign LEDR[2] = (curr_state == Duck1);
				assign LEDR[3] = (curr_state == Duck2);
				assign LEDR[4] = (curr_state == Duck3);
				assign LEDR[5] = (curr_state == Duck4);
				
				
				
				

    // Declare signals curr_state, next_state of type enum
    // with enum values for states
    enum logic [4:0] {R, MainMenu, Walk1, Walk2, Walk3, Walk4, Sniff1, Sniff2, Surprised1, Jump1, Jump2, Wait1, DuckStart1, DuckStart2, Duck1, Duck2, Duck3, Duck4, H, DuckHit, Bounce}   curr_state, next_state; 
	logic [3:0] Step_size_lg_x = 4'd15;
	logic [3:0] Step_size_sm_x = 4'd12;
	logic [3:0] Step_size_sm_y = 4'd2;
	logic [3:0] Step_size_lg_y = 4'd10;
	logic [5:0] DuckFrameInit;

	logic [9:0] Duck_start, Duck_X_step, Duck_Y_step;
	logic [2:0] Duck_direction;
	//updates flip flop, current state is the only one
     always_ff @ (posedge ANIM_Clk or posedge Reset)  
    begin
       if (Reset)
			begin
         	curr_state <= R;
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
				flycounter1 <= flycounter1 + 4'b0001;
				if(flycounter1 == Num_repeats_rand + 4'd3)
					flycounter1 <= 0;
				Duck_direction <= Duck_direction_rand;
				end
			if(curr_state == DuckHit)
				begin
					duck_shocked <= duck_shocked + 4'b0001;
					if(duck_shocked == 15)
						duck_shocked <= 0;
				end
			if(curr_state == DuckStart1)
			begin
				Duck_color <= Duck_color_rand;
				Duck_X <= Duck_start_rand_X; //set x position via duck_x_position_rand
				Duck_Y <= 300;
				Duck_direction <= Duck_direction_rand;
			end
			if(curr_state == DuckStart2)
				begin
				case(Duck_direction) //case statement for frame via direction
						3'b000: 	case(Duck_color) //NW
									2'b00: DuckFrameInit <= 6'd11;//Black
									2'b01: DuckFrameInit <= 6'd31;//Red
									2'b10: DuckFrameInit <= 6'd51;//Pink
									default: DuckFrameInit <= 6'd11;//Black
								endcase
						3'b001: case(Duck_color)	//W
									2'b00: DuckFrameInit <= 6'd15; //Black
									2'b01: DuckFrameInit <= 6'd35;
									2'b10: DuckFrameInit <= 6'd55;
									default: DuckFrameInit <= 6'd15;//Black
								endcase
						3'b010: case(Duck_color) //NE
									2'b00: DuckFrameInit <= 6'd0; //Black
									2'b01: DuckFrameInit <= 6'd20;
									2'b10: DuckFrameInit <= 6'd40;
									default: DuckFrameInit <= 6'd0;//Black
								endcase
						3'b011: case(Duck_color)	//E
									2'b00: DuckFrameInit <= 6'd4; //Black
									2'b01: DuckFrameInit <= 6'd24;
									2'b10: DuckFrameInit <= 6'd44;
									default: DuckFrameInit <= 6'd4;//Black
								endcase
						3'b100: case(Duck_color)  //SW
									2'b00: DuckFrameInit <= 6'd11;//Black
									2'b01: DuckFrameInit <= 6'd31;//Red
									2'b10: DuckFrameInit <= 6'd51;//Pink
									default: DuckFrameInit <= 6'd11;//Black
								endcase
						3'b101: case(Duck_color)  //SE
									2'b00: DuckFrameInit <= 6'd0; //Black
									2'b01: DuckFrameInit <= 6'd20;
									2'b10: DuckFrameInit <= 6'd40;
									default: DuckFrameInit <= 6'd0;//Black
								endcase
						
						default: ;
					endcase
				
				end
				
			if((curr_state == Duck1) || (curr_state == Duck2) || (curr_state == Duck3) || (curr_state == Duck4))
			begin
				DuckFrameInit <= DuckFrameInit;
				if(curr_state == Duck1)
					DuckFrame <= DuckFrameInit;
					Duck_X <= 400;
					Duck_Y <= 300;
				if(curr_state != Duck1)
					DuckFrame <= DuckFrame + 6'b000001;
					Duck_X <= Duck_X_step;
					Duck_Y <= Duck_Y_step;
				if(Duck_X == 0 || Duck_X == 640 || Duck_Y == 0 || Duck_Y == 460)
				begin
					flycounter1 <= 3'd0;
					if(Duck_direction == 3'd1) //W
					begin
						if(Duck_Y == 0)
							Duck_direction <= 3'd4; 
						else 
							Duck_direction <= 3'd3;
					end
					if(Duck_direction == 3'd3) //E
					begin
						if(Duck_Y == 0)
							Duck_direction <= 3'd5;
						else
							Duck_direction <= 3'd1;
					end
					if(Duck_direction == 3'd0) //NW
					begin
						if(Duck_Y == 0)
							Duck_direction <= 3'd4;
						else 
							Duck_direction <= 3'd2;
					end
					if(Duck_direction == 3'd2) //NE
					begin
						if(Duck_Y == 0)
							Duck_direction <= 3'd5;
						else
							Duck_direction <= 3'd0;
					end
					if(Duck_direction == 3'd4) //SW
					begin
						if(Duck_Y == 460)
							Duck_direction <= 3'd0;
						else
							Duck_direction <= 3'd5;
					end
					if(Duck_direction == 3'd5) //SE
					begin
						if(Duck_Y == 460)
							Duck_direction <= 3'd2;
						else
							Duck_direction <= 3'd4;
					end
					
					duck_bounce_signal <= 1'b1;	
				end
						
				
			end
			
			if(curr_state == Bounce)
			begin
				case(Duck_direction) //case statement for frame via direction
						3'b000: 	case(Duck_color) //NW
									2'b00: DuckFrameInit <= 6'd11;//Black
									2'b01: DuckFrameInit <= 6'd31;//Red
									2'b10: DuckFrameInit <= 6'd51;//Pink
									default: DuckFrameInit <= 6'd11;//Black
								endcase
						3'b001: case(Duck_color)	//W
									2'b00: DuckFrameInit <= 6'd15; //Black
									2'b01: DuckFrameInit <= 6'd35;
									2'b10: DuckFrameInit <= 6'd55;
									default: DuckFrameInit <= 6'd15;//Black
								endcase
						3'b010: case(Duck_color) //NE
									2'b00: DuckFrameInit <= 6'd0; //Black
									2'b01: DuckFrameInit <= 6'd20;
									2'b10: DuckFrameInit <= 6'd40;
									default: DuckFrameInit <= 6'd0;//Black
								endcase
						3'b011: case(Duck_color)	//E
									2'b00: DuckFrameInit <= 6'd4; //Black
									2'b01: DuckFrameInit <= 6'd24;
									2'b10: DuckFrameInit <= 6'd44;
									default: DuckFrameInit <= 6'd4;//Black
								endcase
						3'b100: case(Duck_color)  //SW
									2'b00: DuckFrameInit <= 6'd11;//Black
									2'b01: DuckFrameInit <= 6'd31;//Red
									2'b10: DuckFrameInit <= 6'd51;//Pink
									default: DuckFrameInit <= 6'd11;//Black
								endcase
						3'b101: case(Duck_color)  //SE
									2'b00: DuckFrameInit <= 6'd0; //Black
									2'b01: DuckFrameInit <= 6'd20;
									2'b10: DuckFrameInit <= 6'd40;
									default: DuckFrameInit <= 6'd0;//Black
								endcase
						
						default: ;
				endcase
				duck_bounce_signal <= 1'b0;
			end

			if(curr_state == DuckHit)
			begin
				case(Duck_direction) //case statement for frame via direction
						3'b000: 	case(Duck_color) //NW
									2'b00: DuckFrameInit <= 6'd19;//Black
									2'b01: DuckFrameInit <= 6'd39;//Red
									2'b10: DuckFrameInit <= 6'd59;//Pink
									default: DuckFrameInit <= 6'd19;//Black
								endcase
						3'b001: case(Duck_color)	//W
									2'b00: DuckFrameInit <= 6'd19; //Black
									2'b01: DuckFrameInit <= 6'd39;
									2'b10: DuckFrameInit <= 6'd59;
									default: DuckFrameInit <= 6'd19;//Black
								endcase
						3'b010: case(Duck_color) //NE
									2'b00: DuckFrameInit <= 6'd8; //Black
									2'b01: DuckFrameInit <= 6'd28;
									2'b10: DuckFrameInit <= 6'd48;
									default: DuckFrameInit <= 6'd19;//Black
								endcase
						3'b011: case(Duck_color)	//E
									2'b00: DuckFrameInit <= 6'd8; //Black
									2'b01: DuckFrameInit <= 6'd28;
									2'b10: DuckFrameInit <= 6'd48;
									default: DuckFrameInit <= 6'd19;//Black
								endcase
						3'b100: case(Duck_color)  //SW
									2'b00: DuckFrameInit <= 6'd19;//Black
									2'b01: DuckFrameInit <= 6'd39;//Red
									2'b10: DuckFrameInit <= 6'd59;//Pink
									default: DuckFrameInit <= 6'd19;//Black
								endcase
						3'b101: case(Duck_color)  //SE
									2'b00: DuckFrameInit <= 6'd8; //Black
									2'b01: DuckFrameInit <= 6'd28;
									2'b10: DuckFrameInit <= 6'd48;
									default: DuckFrameInit <= 6'd19;//Black
								endcase
						default: ;
					endcase
				Duck_X <= Duck_X;
				Duck_Y <= Duck_Y;
			end

         curr_state <= next_state;

		  end
    end
	// HANDLES STEP SIZE //
	always_ff @ (posedge ANIM_Clk)
	begin
		Duck_X_step <= Duck_X;
		Duck_Y_step <= Duck_Y;
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


    // Assign outputs based on state //
	always_comb
    begin
		Frame = 5'd0;
		Dog_X = 0;
		Dog_Y = 0;
		resetSignal = 1'b0;
		jump2Signal = 1'b0;
		duckresetSignal = 1'b1;
	

		next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state) 

            R :    
							if(Run)
                       next_state = /*Walk1*/ DuckStart1; //change depending on what you are testing
							else 
								next_state = R;
			MainMenu: if(start_game_signal)
						next_state = Walk1;
            Walk1:    next_state = Walk2;
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
			DuckStart1:	next_state = DuckStart2; // 
			DuckStart2: next_state = Duck1;
			Duck1: 	if(duck_kill_signal == 1)
						next_state = DuckHit;
						else
						begin
							if(duck_bounce_signal == 1)
								next_state = Bounce;
							else 
								next_state = Duck2;							//ADD FLY AWAY COUNTERS/LOGIC
						end
			Duck2: if(duck_kill_signal == 1)
						next_state = DuckHit;
					 else
					 begin
						 if(duck_bounce_signal == 1)
							next_state = Bounce;
						 else
							next_state = Duck3;
					 end
			Duck3: if(duck_kill_signal == 1)
						next_state = DuckHit;
					 else
					 begin
						 if(duck_bounce_signal == 1)
							next_state = Bounce;
						else
							next_state = Duck4;
					 end
			Duck4: 	if(duck_kill_signal == 1)
						next_state = DuckHit;
						else
						begin
							if(duck_bounce_signal == 1)
								next_state = Bounce;
							else
							begin
								if ((flycounter1 == Num_repeats_rand + 4'd3))
									next_state = DuckStart2;
								else
									next_state = Duck1;
							end
						end
			Bounce:	next_state = Duck1;
			DuckHit: if(duck_shocked == 15)
							next_state = DuckStart1;
            H :   /* if(Reset)	//holds, was ~Run */
						next_state = R;
							  
        endcase
   
		  // Assign outputs based on ‘state’
        case (curr_state) 
	   	   R: 
	         begin
				Dog_X = 10'b0000001011;	//11
				Dog_Y = 10'd290; //290
				Frame = 5'b00000;
				resetSignal = 1'b1;
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
			Bounce: begin
				resetSignal = 1'b1;
				duckresetSignal = 1'b0;
			end
			DuckHit: begin
				resetSignal = 1'b1;
				duckresetSignal = 1'b0;
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