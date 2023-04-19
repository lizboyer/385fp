module dog_control (input  logic Clk, Reset, /*Run*/
                output logic [8:0] Dog_X_pos, Dog_Y_pos,
				output logic [4:0] Frame
					 );

    // Declare signals curr_state, next_state of type enum
    // with enum values of A, B, ..., F as the state values
	 // Note that the length implies a max of 8 states, so you will need to bump this up for 8-bits
    enum logic [4:0] {R, Walk1, Walk2, Walk3, Walk4, Sleep1, Sleep2, Surprised1, Jump1, Jump2, Walk1, H}   curr_state, next_state; 
	logic [4:0] Step_size;
	//updates flip flop, current state is the only one
    always_ff @ (posedge Clk)  
    begin
        if (Reset)
            curr_state <= R;
        else 
            curr_state <= next_state;
    end

    // Assign outputs based on state
	always_comb
    begin
	 
        
		next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state) 

            R :    if (Reset)
                       next_state = Walk1;
            Walk1:    next_state = Walk2;
            Walk2:    next_state = Walk3;
			Walk3:    next_state = Walk4;
			Walk4:	   if(end_walk == 4)
						next_state = Sleep1;
					else
						next_state = Walk1;
			Sniff1:	   next_state = Sniff2;
			Sniff2:    if(end_sniff == 3 && startjump = 1)	//if ready to be surprised
						next_state = Surprised1;
					   if(end_sniff == 3 && startjump = 0)	//if have to walk forward more
						next_state = Walk1;	
					   else							//sniff again
						next_state = Sniff1;
			Surprised1:    next_state = Jump1;
			Jump1:	   next_state = Jump2;
			Jump2:    next_state = Walk1;
			Walk1:	   if(waitcount1 == 5)
						next_state = H;
            H :    if(Reset)	//holds, was ~Run
						next_state = R;
							  
        endcase
   
		  // Assign outputs based on ‘state’
        case (curr_state) 
	   	   R: 
	         begin
                LocationX = 11;
				LocationY = 318;
				Frame = 5'b00000;
		      end

	   	   Walk1: 
		      begin
				Dog_X_pos = Dox_X_pos + Step_size
				Frame = 5'b00001;
		      end

	   	   Walk2: 
		      begin
				Dog_X_pos = Dox_X_pos + Step_size
				Frame = 5'b00010;
		      end

	   	   Walk3: 
		      begin
				Dog_X_pos = Dox_X_pos + Step_size
				Frame = 5'b00011;
		      end

	   	   Walk4: 
		      begin
				Dog_X_pos = Dox_X_pos + Step_size
				Frame = 5'b00011;
		      end

		   Sleep1:
		   	  begin
				Frame = 5'b00100;
			  end
		   Sleep2:
		   	  begin
				Frame = 5'b00101;
			  end
			Surprised1:
		   	  begin
				Frame = 5'b00110;
			  end
			Jump1:
		   	  begin
				Frame = 5'b00111;
				//jump equation
			  end
			Jump2:
		   	  begin
				Frame = 5'b01000;
				//jump equation
			  end
	   	   H: 
		      begin
                LocationX = 0;
				LocationY = 0;
				Frame = 5'b00000;
		      end	

	   	   default:  //default case, can also have default assignments for Ld_A and Ld_B before case
		      begin 
                LocationX = 0;
				LocationY = 0;
				Frame = 5'b00000;
		      end
        endcase
    end

endmodule