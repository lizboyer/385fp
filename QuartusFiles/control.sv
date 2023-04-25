module dog_control (input  logic Clk, Reset, ANIM_Clk, Run,
					input logic [1:0] Duck_color_rand, Duck_direction_rand;	//NEW
					input logic [9:0] dog_rand_X, Duck_start_rand_X;	//NEW

                	output logic [9:0] Dog_X, Dog_Y, Duck_X, Duck_Y, LEDR,
					output logic jump2Signal, resetSignal,
					output logic [4:0] Frame,
					output logic [5:0] DuckFrame,
					output logic [3:0] end_walk, end_sniff, startjump, end_surprised, go_to_jump_2, end_jump_2, waitcount1, flycounter1
					 );
					
				assign LEDR[2:0] = end_sniff;
				assign LEDR[3] = (curr_state == Jump1);
				assign LEDR[4] = (curr_state == Jump2);
				assign LEDR[8:5] = end_jump_2;
				assign LEDR[9] = Run;
				

    // Declare signals curr_state, next_state of type enum
    // with enum values for states
    enum logic [4:0] {R, Walk1, Walk2, Walk3, Walk4, Sniff1, Sniff2, Surprised1, Jump1, Jump2, Wait1, DuckStart1, DuckStart2, Duck1, Duck2, Duck3, Duck4, H}   curr_state, next_state; 
	logic [3:0] Step_size = 4'b0100;
	logic [1:0] Duck_color;
	logic [9:0] Duck_start;
	logic [1:0] Duck_direction;
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
		  				waitcount1 <=0;
			if(curr_state == Duck4)
				begin
				flycounter1 <= flycounter1 + 4'b0001;
				if(flycounter1 == 2)
					flycounter1 <= 0;
				end
			
         curr_state <= next_state;

		  end
    end

    // Assign outputs based on state
	always_comb
    begin
		Dog_X = 0;
		Dog_Y = 0;
		Duck_X = 0;
		Duck_Y = 0;
		resetSignal = 1'b0;
		jump2Signal = 1'b0;
	

		next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state) 

            R :    
							if(Run)
                       next_state = Walk1;
							else 
								next_state = R;
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
							next_state == DuckStart1; //initializes direction + color
			DuckStart1:	next_state = DuckStart2; // 
			DuckStart2: next_state = Duck1;
			Duck1: next_state = Duck2;
			Duck2: next_state = Duck3;
			Duck3: next_state = Duck4;
			Duck4: 		if(flycounter1 == 1)
							next_state = H;
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
		   Wait1: ;	//wait for 1 second, 10 frames
		   DuckStart1: begin
				Duck_color = Duck_color_rand;
				Duck_start = Duck_start_rand_X;
				Duck_X = Duck_start; //set x position via duck_x_position_rand
				Duck_Y = 300;
			end
		   DuckStart2: Duck_direction = Duck_direction_rand;		   
		   Duck1: begin
				case(Duck_direction) //case statement for frame via direction
					2'b00: 	case(Duck_color) //NW
								2'b00: DuckFrame = 6'd11;//Black
								2'b01: DuckFrame = 6'd31;//Red
								2'b10: DuckFrame = 6'd51;//Pink
								default: ;
							endcase
					2'b01: case(Duck_color)	//W
								2'b00: DuckFrame = 6'd15; //Black
								2'b01: DuckFrame = 6'd35;
								2'b10: DuckFrame = 6'd55;
								default: ;
							endcase
					2'b10: case(Duck_color) //NE
								2'b00: DuckFrame = 6'd0; //Black
								2'b01: DuckFrame = 6'd20;
								2'b10: DuckFrame = 6'd40;
								default: ;
							endcase
					2'b11: case(Duck_color)	//E
								2'b00: DuckFrame = 6'd4; //Black
								2'b01: DuckFrame = 6'd24;
								2'b10: DuckFrame = 6'd44;
								default: ;
							endcase
					default: ;
				endcase
			end
			Duck2: ;
			Duck3: ;
			Duck4: ; 


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
