//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------

//nColor is the color of the pixel at that coordinate

module  color_mapper ( input        [9:0] BallX, BallY, DogX, DogY, DrawX, DrawY, Ball_size, DogSizeX, DogSizeY, BackgroundX, BackgroundY, BackgroundSizeX, BackgroundSizeY,
							  input blank, 

                        input [79:0][109:0][3:0] Dogs0, 
                        input [85:0][109:0][3:0] Dogs1, 
                        input [79:0][109:0][3:0] Dogs2, 
                        input [85:0][109:0][3:0] Dogs3, 
                        input [479:0][511:0][3:0] Bgs0,

                        output logic [3:0]  Red, Green, Blue );
    
    logic dog_on, bg_on, ball_on;
	 logic [3:0] temp;
	 logic [11:0] value;
//	 cursor_color_mapper ccm1(.BallX, .BallY, .DrawX, .DrawY, .Ball_size, .blank, .Red, .Green, .Blue);

	 int DistX, DistY, Size, DistXabs, DistYabs;
	 assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
	 assign DistXabs = DistX[31] ? -DistX : DistX;
	 assign DistYabs = DistY[31] ? -DistY : DistY;
    assign Size = Ball_size;
	  
    always_comb
    begin:Ball_on_proc
        if ( DistXabs + DistYabs/*(DistX*DistX) + (DistY*DistY)*/ <= (Size/**Size*/) ) //use parametric equation for diamond (|x| + |y| = size) 
            ball_on = 1'b1;
        else 
            ball_on = 1'b0;
     end 

	      always_comb
    begin:Bg_on_proc
        if ((DrawX >= BackgroundX) && (DrawX <= BackgroundX + BackgroundSizeX) && (DrawY >= BackgroundY) && (DrawY <= BackgroundY + BackgroundSizeY)) 
        begin
				bg_on = 1'b1;
            temp = Bgs0[DrawY-BackgroundY][DrawX-BackgroundX];  //where in the background it is drawing
		  end
        else 
				temp = 4'b1111;
            bg_on = 1'b0;
     end 
	  

    always_comb
    begin:Color_conversion
        case(temp)
            4'b0000: value =  12'b000000000000; //1
            4'b0001: value =  12'b111111111111; // 2
            4'b0010: value =  12'b000100110000; // 3
            4'b0011: value =  12'b111101110110; // 4
            4'b0100: value =  12'b100101000001; // 5
            4'b0101: value =  12'b010000100000; // 6
            4'b0110: value =  12'b111111011010; // 7
            4'b0111: value =  12'b100111010100; // 8
            4'b1000: value =  12'b001001010001; // 9
            4'b1001: value =  12'b100111000010; // 10
            4'b1010: value =  12'b101000110010; // 11
				default: value =  12'b001110101000;
        endcase
    end
	 
    always_comb
    begin:RGB_Display2
		if(blank) //added blank signal
		begin
        if ((ball_on == 1'b1)) 
        begin 
            Red = 4'hf; 				//color changed to white to more closely match color of game cursor...original orange color commented out.
            Green = 4'hf/*55*/;
            Blue = 4'hf/*00*/;
        end
		
        if ((bg_on == 1'b1)) 
        begin 
            Red = value[11:8];
            Green = value[7:4];
            Blue = value[3:0];
        end  		  
        else 
        begin 
            Red = 4'h0; 
            Green = 4'h0;
            Blue = 4'h0;/*8'h7f - DrawX[9:3]*/;
        end   
		end
		else 
		begin
			Red = 4'h0;
         Green = 4'h0;
         Blue = 4'h0;
		end
			
    end 




    //whether or not to draw background



//    always_comb
//    begin:RGB_Display
//	 
////        if ((ball_on == 1'b1)) 
////        begin 
////            Red = 4'hf;
////            Green = 4'hf;
////            Blue = 4'hf;
////        end      
//        // if ((dog_on == 1'b1)) 
//        // begin 
//        //     Red = value[11:8]
//        //     Green = value[7:4]
//        //     Blue = value[3:0]
//        // end    
//		if(blank)
//		
//        else
//        begin
//            Red = 4'h0;
//            Green = 4'h0;
//            Blue = 4'h0;
//        end
//		end
//		else
//		begin
//			Red = 4'h0;
//         Green = 4'h0;
//         Blue = 4'h0;
//      end
//			
//    end 
    
endmodule
