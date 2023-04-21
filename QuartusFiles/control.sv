module dog_control (input  logic Clk, Reset, ANIM_Clk, Run,
                output logic [9:0] Dog_X, Dog_Y, LEDR,
				output logic [4:0] Frame,
				output logic [3:0] end_walk, end_sniff, startjump, end_surprised, go_to_jump_2, end_jump_2, waitcount1
					 );
					
				assign LEDR[2:0] = end_sniff;
				assign LEDR[3] = (curr_state == Walk1);
				assign LEDR[4] = (curr_state == Sniff1);
				assign LEDR[5] = (curr_state == Surprised1);
				assign LEDR[6] = (curr_state == R);
				assign LEDR[7] = (curr_state == H);
				assign LEDR[8] = Reset;
				assign LEDR[9] = Run;
				


    // Declare signals curr_state, next_state of type enum
    // with enum values for states
    enum logic [4:0] {R, Walk1, Walk2, Walk3, Walk4, Sniff1, Sniff2, Surprised1, Jump1, Jump2, H}   curr_state, next_state; 
	logic [3:0] Step_size = 4'b0100;
	// logic [9:0] Dog_X, Dog_Y; //should this be an input, or just an internal signal set to 0 at the beginning?

	//updates flip flop, current state is the only one
     always_ff @ (posedge ANIM_Clk)  
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
			if(curr_state == Jump2)
				end_jump_2 <= end_jump_2 + 4'b0001;
			
//			startjump <= startjump + 4'b0001;
//			end_surprised <= end_surprised + 4'b0001;
//			go_to_jump_2 <= go_to_jump_2 + 4'b0001;
//			end_jump_2 <= end_jump_2 + 4'b0001;
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
			Walk4:	   if(end_walk == 3 || end_walk == 7)
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
			Jump1:	   if(go_to_jump_2 == 4)
							next_state = Jump2;
			Jump2:   	if(end_jump_2 == 4)
							next_state = H;
            H :    if(Run)	//holds, was ~Run
						next_state = R;
							  
        endcase
   
		  // Assign outputs based on ‘state’
        case (curr_state) 
	   	   R: 
	         begin
				Dog_X = 10'b0000001011;	//11
				Dog_Y = 10'b0100111110;	//318
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
				Dog_Y = 10'b0100111110; //318
				Frame = 5'b00001;
		      end

	   	   Walk2: 
		      begin
				Dog_X = 10'b0000011011 + (32*end_walk); //27
				Dog_Y = 10'b0100111110; //318
				Frame = 5'b00010;
		      end

	   	   Walk3: 
		      begin
				Dog_X = 10'b0000100011 + (32*end_walk); //35 
				Dog_Y = 10'b0100111110; //318
				Frame = 5'b00011;
		      end

	   	   Walk4: 
		      begin
				Dog_X = 10'b0000101011 + (32*end_walk); //43
				Dog_Y = 10'b0100111110; //318
				Frame = 5'b00011;
		      end

		   Sniff1:
		   	  begin
				Frame = 5'b00100;
				Dog_X = 10'b0000101011 + (32*end_walk); //43
				Dog_Y = 10'b0100111110; //318
			  end
		   Sniff2:
		   	  begin
				Dog_X = 10'b0000101011 + (32*end_walk); //43
				Dog_Y = 10'b0100111110; //318
				Frame = 5'b00101;
				
			  end
			Surprised1:
		     begin
				   Dog_X = 10'b0000101011 + (32*end_walk); //43
					Dog_Y = 10'b0100111110; //318
					Frame = 5'b00110;
			  end
			Jump1:
		   	  begin
				   Dog_X = 10'b0000101011 + (32*end_walk); //43
					Dog_Y = 10'b0100111110; //318
				Frame = 5'b00111;
				//jump equation
			  end
			Jump2:
		   	  begin
				   Dog_X = 10'b0000101011 + (32*end_walk); //43
					Dog_Y = 10'b0100111110; //318
				Frame = 5'b01000;
				//jump equation
			  end
	   	   H: 
		      begin
				Dog_X = 10'b0000010011; //19
				Dog_Y = 10'b0100111110; //318
				Frame = 5'b00000;
		      end	

	   	   default: ;
        endcase
    end

endmodule
