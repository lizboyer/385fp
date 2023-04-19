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

module  color_mapper ( input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
					   input blank, vga_clk,

                       output logic [3:0]  Red, Green, Blue );
    
//internal signals
    logic dog_on, bg_on, ball_on;

	//ball internal signals
	int DistX, DistY, Size, DistXabs, DistYabs;
	assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
	assign DistXabs = DistX[31] ? -DistX : DistX;
	assign DistYabs = DistY[31] ? -DistY : DistY;
	assign Size = Ball_size;
	  
	//background internal signals
	logic [17:0] bg_rom_address;
	logic [3:0] bg_rom_q;
	logic [3:0] bg_palette_red, bg_palette_green, bg_palette_blue;

	//dog internal signals
	logic [13:0] dog_rom_address;
	logic [3:0] dog_rom_q;
	logic [3:0] dog_palette_red, dog_palette_green, dog_palette_blue;


	assign bg_rom_address = ((DrawX * 480) / 640) + (((DrawY * 512) / 480) * 480);
	assign dog_rom_address = ((DrawX * 110) / 640) + (((DrawY * 86) / 480) * 110);

    always_comb
    begin:Ball_on_proc
        if ( DistXabs + DistYabs/*(DistX*DistX) + (DistY*DistY)*/ <= (Size/**Size*/) ) //use parametric equation for diamond (|x| + |y| = size) 
            ball_on = 1'b1;
        else 
            ball_on = 1'b0;
     end 

	always_comb
	
	begin:Dog_on_proc
    	if ((DrawX >= DogX) && (DrawX <= DogX + DogSizeX) && (DrawY >= DogY) && (DrawY <= DogY + DogSizeY)) 
    	begin
			dog_on = 1'b1;
		end
    	else 
        	dog_on = 1'b0;
    end 
	  
 
    always_ff @ (posedge vga_clk)
    begin:RGB_Display2
		if(blank) //added blank signal
			begin
			if ((ball_on == 1'b1)) 
			begin 
				Red <= 4'hf; 				//color changed to white to more closely match color of game cursor...original orange color commented out.
				Green <= 4'hf/*55*/;
				Blue <= 4'hf/*00*/;
			end
			
		if ((dog_on == 1'b1)) 
		begin 
				Red <= dog_palette_red;
				Green <= dog_palette_green;
				Blue <= dog_palette_blue;
		end  		  
			else 
			begin
				Red <= bg_palette_red;
				Green <= bg_palette_green;
				Blue <= bg_palette_blue;
			end 
			end
		else 
		begin
			Red <= 4'h0;
        	Green <= 4'h0;
        	Blue <= 4'h0;
		end
			
    end 

	bgs0_rom bgs0_rom (
	.clock   (vga_clk),
	.address (rom_address),
	.q       (bg_rom_q)
	);

	bgs0_palette bgs0_palette (
	.index (bg_rom_q),
	.red   (bg_palette_red),
	.green (bg_palette_green),
	.blue  (bg_palette_blue)
	);

	AssetsDog_rom AssetsDogs0_rom (
		.clock   (vga_clk),
		.address (rom_address),	//need four of these
		.q       (dog_rom_q)	//need four of these
	);

	AssetsDog_palette AssetsDogs0_palette (
		.index (dog_rom_q),
		.red   (dog_palette_red),
		.green (dog_palette_green),
		.blue  (dog_palette_blue)
	);

    
endmodule
