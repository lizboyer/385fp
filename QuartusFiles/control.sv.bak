module dog_control (input  logic Clk, Reset, /*Run*/
                output logic [8:0] Location,
				output logic [4:0] Frame
					 );

    // Declare signals curr_state, next_state of type enum
    // with enum values of A, B, ..., F as the state values
	 // Note that the length implies a max of 8 states, so you will need to bump this up for 8-bits
    enum logic [4:0] {R, A1, A2, A3, A4, H}   curr_state, next_state; 

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
                       next_state = A1;
            A1:    next_state = A2;
            A2:    next_state = A3;
			A3:    next_state = H;
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

	   	   A1: 
		      begin
                LocationX = 13;
				LocationY = 318;
				Frame = 5'b00001;
		      end

	   	   A2: 
		      begin
                LocationX = 0;
				LocationY = 0;
				Frame = 5'b00010;
		      end

	   	   A3: 
		      begin
                LocationX = 0;
				LocationY = 0;
				Frame = 5'b00011;
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