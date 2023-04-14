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

module  color_mapper ( input        [9:0] CursorX, CursorY, DrawX, DrawY, Cursor_size, 
                                        DogX, DogY
                                    [11:0] DogColor, BackgroundColor
                       output logic [3:0]  Red, Green, Blue );
    
    logic cursor_on, dog_on, bg_on;
	 
 /* Old Ball: Generated square box by checking if the current pixel is within a square of length
    2*Ball_Size, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
	 
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 12 available multipliers on the chip!  Since the multiplicants are required to be signed,
	  we have to first cast them from logic to int (signed by default) before they are multiplied). */
	  
    int DistX, DistY, Size;
	assign DistX = DrawX - CursorX;
    assign DistY = DrawY - CursorY;
    assign Size = Cursor_size;
	  
    //Whether or not to draw cursor
    always_comb
    begin:Ball_on_proc
        if ( ( DistX*DistX + DistY*DistY) <= (Size * Size) ) 
            ball_on = 12'b111111111111;
        else 
            ball_on = 12'b000000000000;
     end 

    //Whether or not to draw dog
    // always_comb
    // begin:Dog_on_proc
    //     if ( /*draw is on the dog*/ ) 
    //         dog_on = /*pixel from dog sprite*/;
    //     else 
    //         dog_on = 12'b000000000000;
    //  end 

    always_comb
    begin:Bg_on_proc
        if ( /*draw is on the bg*/ ) 
            bg_on = /*pixel from bg sprite*/;
        else 
            bg_on = 12'b000000000000;
     end 
       
    always_comb
    begin:RGB_Display
        if ((ball_on == 12'b111111111111)) 
        begin 
            Red = 4'hf;
            Green = 4'hf;
            Blue = 4'hf;
        end      
        // if ((dog_on == 1'b1)) 
        // begin 
        //     Red = dog_on[11:8]
        //     Green = dog_on[7:4]
        //     Blue = dog_on[3:0]
        // end    
        else 
        begin 
            Red = bg_on[11:8]
            Green = bg_on[7:4]
            Blue = bg_on[3:0]
        end      
    end 
    
endmodule
