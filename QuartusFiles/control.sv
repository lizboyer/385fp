module dog_control (input  logic Clk, Reset, ANIM_Clk,  /*Run*/
                output logic [9:0] Dog_X, Dog_Y,
				output logic [4:0] Frame,
				output logic [3:0] end_walk, end_sniff, startjump, end_surprised, go_to_jump_2, end_jump_2, waitcount1
					 );

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
			end_walk <= 0;
			end_sniff <= 0;
			startjump <= 0;
			end_surprised <= 0;
			go_to_jump_2 <= 0;
			end_jump_2 <= 0;
		  end
        else 
		  begin
         curr_state <= next_state;
			end_walk <= end_walk + 4'b0001;
			end_sniff <= end_sniff + 4'b0001;
			startjump <= startjump + 4'b0001;
			end_surprised <= end_surprised + 4'b0001;
			go_to_jump_2 <= go_to_jump_2 + 4'b0001;
			end_jump_2 <= end_jump_2 + 4'b0001;
		  end
    end

    // Assign outputs based on state
	always_comb
    begin
		Dog_X = 0;
		Dog_Y = 0;
	

		next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state) 

            R :    if (Reset)
                       next_state = Walk1;
            Walk1:    next_state = Walk2;
            Walk2:    next_state = Walk3;
			Walk3:    next_state = Walk4;
			Walk4:	   if(end_walk == 4)
						next_state = Sniff1;
					else
						next_state = Walk1;
			Sniff1:	   next_state = Sniff2;
			Sniff2:    if(end_sniff == 3)
						  begin 
							 if(startjump == 1)	//if ready to be surprised
								 next_state = Surprised1;
							 if(startjump == 0)
								 next_state = Walk1;
						  end
						  else							//sniff again
							 next_state = Sniff1;
			Surprised1:    if(end_surprised == 2)
								next_state = Jump1;
			Jump1:	   if(go_to_jump_2 == 5)
							next_state = Jump2;
			Jump2:   	if(end_jump_2 == 5)
							next_state = H;
            H :    if(Reset)	//holds, was ~Run
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
				Dog_X = Dog_X + Step_size;
				Frame = 5'b00001;
		      end

	   	   Walk2: 
		      begin
				Dog_X = Dog_X + Step_size;
				Frame = 5'b00010;
		      end

	   	   Walk3: 
		      begin
				Dog_X = Dog_X + Step_size;
				Frame = 5'b00011;
		      end

	   	   Walk4: 
		      begin
				Dog_X = Dog_X + Step_size;
				Frame = 5'b00011;
		      end

		   Sniff1:
		   	  begin
				Frame = 5'b00100;
			  end
		   Sniff2:
		   	  begin
				Frame = 5'b00101;
			  end
			Surprised1:
		   	  begin
				Frame = 5'b00110;
			  end
			Jump1:
		   	  begin
				Dog_X = Dog_X;
				Frame = 5'b00111;
				//jump equation
			  end
			Jump2:
		   	  begin
				Dog_X = Dog_X;
				Frame = 5'b01000;
				//jump equation
			  end
	   	   H: 
		      begin
				Dog_X = Dog_X;
				Frame = 5'b00000;
		      end	

	   	   default: ;
        endcase
    end

endmodule