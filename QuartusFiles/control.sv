module dog_control (input  logic Clk, Reset, ANIM_Clk, Run,
                output logic [9:0] Dog_X, Dog_Y, LEDR,
					 output logic resetSignal,
				output logic [4:0] Frame,
				output logic [3:0] end_walk, end_sniff, startjump, end_surprised, go_to_jump_2, end_jump_2, waitcount1
					 );
					
				assign LEDR[2:0] = end_sniff;
				assign LEDR[3] = (curr_state == Jump1);
				assign LEDR[4] = (curr_state == Jump2);
				assign LEDR[8:5] = go_to_jump_2;
				assign LEDR[9] = Run;
				


    // Declare signals curr_state, next_state of type enum
    // with enum values for states
    enum logic [4:0] {R, Walk1, Walk2, Walk3, Walk4, Sniff1, Sniff2, Surprised1, Jump1, Jump2, H}   curr_state, next_state; 
	logic [3:0] Step_size = 4'b0100;
	// logic [9:0] Dog_X, Dog_Y; //should this be an input, or just an internal signal set to 0 at the beginning?

	//updates flip flop, current state is the only one
     always_ff @ (posedge ANIM_Clk or posedge Reset)  
    begin
       if (Reset)
			begin
			resetSignal <= 1'b1;
         curr_state <= R;
			end_walk <=  4'b0000;
			end_sniff <= 4'b0000;
			startjump <= 4'b0000;
			end_surprised <= 4'b0000;
			go_to_jump_2 <= 4'b0000;
			end_jump_2 <= 4'b0000;
			end
        else 
		  begin
			resetSignal <= 1'b0;
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
				if(go_to_jump_2 == 10)
					go_to_jump_2 <= 0;
			if(curr_state == Jump2)
				end_jump_2 <= end_jump_2 + 4'b0001;
				if(end_jump_2 == 10)
					end_jump_2 <= 0;
			
         curr_state <= next_state;

		  end
    end

    // Assign outputs based on state
	always_comb
    begin
		Dog_X = 0;
		Dog_Y = 0;
	

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
							next_state = H;
            H :   /* if(Reset)	//holds, was ~Run */
						next_state = R;
							  
        endcase
   
		  // Assign outputs based on ‘state’
        case (curr_state) 
	   	   R: 
	         begin
				Dog_X = 10'b0000001011;	//11
				Dog_Y = 10'd300; //300
//dog starts at ~ 11, 318, 
//walks until ~ 72, 318, sniffs
//walks again until ~ 142, 318
//big *** eyes and jumps behind grass
	//492, 518, -> 580, 500 -> 650,630
				Frame = 5'b00000;
		      end

	   	   Walk1: 
		      begin
				Dog_X = 10'b0000010011 + (32*end_walk); //19
				Dog_Y = 10'd300; //300
				Frame = 5'b00001;
		      end

	   	   Walk2: 
		      begin
				Dog_X = 10'b0000011011 + (32*end_walk); //27
				Dog_Y = 10'd300; //300
				Frame = 5'b00010;
		      end

	   	   Walk3: 
		      begin
				Dog_X = 10'b0000100011 + (32*end_walk); //35 
				Dog_Y = 10'd300; //300
				Frame = 5'b00011;
		      end

	   	   Walk4: 
		      begin
				Dog_X = 10'b0000101011 + (32*end_walk); //43
				Dog_Y = 10'd300; //300
				Frame = 5'b00011;
		      end

		   Sniff1:
		   	  begin
				Frame = 5'b00100;
				Dog_X = 10'b0000101011 + (32*end_walk); //43
				Dog_Y = 10'd300; //300
			  end
		   Sniff2:
		   	  begin
				Dog_X = 10'b0000101011 + (32*end_walk); //43
				Dog_Y = 10'd300; //300
				Frame = 5'b00101;
				
			  end
			Surprised1:
		     begin
				   Dog_X = 10'b0000101011 + (32*end_walk); //43
					Dog_Y = 10'd300; //300
					Frame = 5'b00110;
			  end
			Jump1:
		   	  begin
				  case(go_to_jump_2)
						4'd0:
						begin
						Dog_X = 10'd267; //267
						Dog_Y = 10'd300; //300
						end
						4'd1:
						begin
						Dog_X = 10'd276; //276
						Dog_Y = 10'd284; //284
						end
						4'd2:
						begin
						Dog_X = 10'd285; //285
						Dog_Y = 10'd270; //270
						end
						4'd3:
						begin
						Dog_X = 10'd294; //294
						Dog_Y = 10'd258; //258
						end
						4'd4:
						begin
						Dog_X = 10'd303; //303
						Dog_Y = 10'd248; //248
						end
						4'd5:
						begin
						Dog_X = 10'd312; //312
						Dog_Y = 10'd239; //239
						end
						4'd6:
						begin
						Dog_X = 10'd321; //321
						Dog_Y = 10'd232; //232
						end
						4'd7:
						begin
						Dog_X = 10'd330; //330
						Dog_Y = 10'd227; //227
						end
						4'd8:
						begin
						Dog_X = 10'd341; //341
						Dog_Y = 10'd223; //223
						end
						4'd9:
						begin
						Dog_X = 10'd352; //352
						Dog_Y = 10'd222; //222
						end
						default: ;
					endcase
				Frame = 5'b00111;
			  end
			Jump2:
		   	  begin
				   case(go_to_jump_2)
						4'd0:
						begin
						Dog_X = 10'd352;
						Dog_Y = 10'd222;
						end
						4'd1:
						begin
						Dog_X = 10'd363; //267
						Dog_Y = 10'd223; //300
						end
						4'd2:
						begin
						Dog_X = 10'd374; //276
						Dog_Y = 10'd227; //284
						end
						4'd3:
						begin
						Dog_X = 10'd383; //285
						Dog_Y = 10'd232; //270
						end
						4'd4:
						begin
						Dog_X = 10'd392; //294
						Dog_Y = 10'd239; //258
						end
						4'd5:
						begin
						Dog_X = 10'd401; //303
						Dog_Y = 10'd248; //248
						end
						4'd6:
						begin
						Dog_X = 10'd410; //312
						Dog_Y = 10'd258; //239
						end
						4'd7:
						begin
						Dog_X = 10'd419; //321
						Dog_Y = 10'd270; //232
						end
						4'd8:
						begin
						Dog_X = 10'd428; //330
						Dog_Y = 10'd284; //227
						end
						4'd9:
						begin
						Dog_X = 10'd437; //341
						Dog_Y = 10'd330; //223
						end
						default: ;
					endcase
				Frame = 5'b01000;
				//jump equation
			  end
	   	   H: 
		      begin
				Dog_X = 10'b0000101011 + (32*end_walk); //43
				Dog_Y = 10'b0100111110; //318
				Frame = 5'b00000;
		      end	

	   	   default: ;
        endcase
    end

endmodule
