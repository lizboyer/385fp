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

module  color_mapper ( input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size, Dog_X, Dog_Y, Duck_X, Duck_Y,
					   input logic [5:0] Frame, DuckFrame,
						input logic [1:0] Duck_color,
						input blank, vga_clk, Reset, jump2Signal, resetSignal, ANIM_Clk,
						input signed [7:0] MouseButtons,
						output logic [9:0] LEDR,
                       output logic [3:0]  Red, Green, Blue );
    
//internal signals
    logic dog_on, bg_on, ball_on, square_on1, square_on2, square_on3, count_enable, aaa_delayed, aaa, shot_on, duck_on;
	 logic [1:0] count = 2'b00;
	logic [6:0] DogSizeY, DogSizeX;
	//ball internal signals
	int DistX, DistY, Size, DistXabs, DistYabs;
	assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
	assign DistXabs = DistX[31] ? -DistX : DistX;
	assign DistYabs = DistY[31] ? -DistY : DistY;
	assign Size = Ball_size;
	  
	//background internal signals (comment out for better runtime for testing... comment out rom/palette instantiations at the bottom of this file as well)
	logic [17:0] bg_rom_address;
	logic [3:0] bg_rom_q;
	logic [3:0] bg_palette_red, bg_palette_green, bg_palette_blue;
	assign bg_rom_address = ((DrawX * 480) / 640) + (((DrawY * 512) / 480) * 480);


	//dog internal signals
	logic [13:0] dog_rom_address;
	logic [3:0] dog_rom_q;
	logic [3:0] dog_palette_red, dog_palette_green, dog_palette_blue;

	logic [9:0] dog_distX, dog_distY;
	assign dog_distX = DrawX - Dog_X;
	assign dog_distY = DrawY - Dog_Y;
	assign dog_rom_address = (dog_distX + dog_distY * 110);

	//duck internal signals
	logic [11:0] ducks_rom_address;
	logic [3:0] ducks_rom_q;
	logic [3:0] ducks_black_palette_red, ducks_black_palette_green, ducks_black_palette_blue;
	logic [3:0] ducks_red_palette_red, ducks_red_palette_green, ducks_red_palette_blue;
	logic [3:0] ducks_pink_palette_red, ducks_pink_palette_green, ducks_pink_palette_blue;

	logic [9:0] duck_distX, duck_distY;
	assign duck_distX = DrawX - Duck_X;
	assign duck_distY = DrawY - Duck_Y;
	assign ducks_rom_address = (duck_distX + duck_distY * 64);

//procs
    always_comb 
	 begin:shot_square_on
		  if(MouseButtons == 8'd2 && ANIM_Clk)
				shot_on = 1'b1;
		  else
				shot_on = 1'b0;
	 end
    always_comb
    begin:Ball_on_proc
        if ( DistXabs + DistYabs/*(DistX*DistX) + (DistY*DistY)*/ <= (Size/**Size*/) ) //use parametric equation for diamond (|x| + |y| = size) 
            ball_on = 1'b1;
        else 
            ball_on = 1'b0;
     end 

	always_comb
	begin:Dog_on_proc
    	if (dog_distX < 110 && dog_distY < 86 && ~((dog_palette_red == 4'h6) && (dog_palette_blue == 4'hF) && (dog_palette_green == 4'hA)) && (resetSignal == 1'b0)) 
    	begin
			if(jump2Signal == 1'b1)
				begin
				if(DrawY < 300)
					dog_on = 1'b1;
				else 
					dog_on = 1'b0;
				end
			else 
				dog_on = 1'b1;
		end
    	else 
        	dog_on = 1'b0;
    end 

	always_comb
	begin:Duck_on_proc
    	if (duck_distX < 64 && duck_distY < 64 && ~(((ducks_black_palette_red || ducks_red_palette_red || ducks_pink_palette_red) == 4'hA) && ((ducks_black_palette_blue || ducks_red_palette_blue || ducks_pink_palette_blue)  == 4'hA) && ((ducks_black_palette_green || ducks_red_palette_green || ducks_pink_palette_green)  == 4'hE)) && (resetSignal == 1'b0)) 
			if (DrawY < 300)	//only draw duck above y = 300
				duck_on = 1'b1;
			else
				duck_on = 1'b0;
		else
			duck_on = 1'b0;
    end 
	  
	//shot counter drawing
	 always_comb
	 begin:Shot_Square_on_proc
			if(DrawX >= 102 && DrawX < 111 && DrawY >= 418 && DrawY < 431)
				square_on3 = (count == 0) ? 1'b1 : 1'b0;
			else
				square_on3 = 1'b0;
			if(DrawX >= 85 && DrawX < 94 && DrawY >= 418 && DrawY < 431)
				square_on2 = (count <= 1) ? 1'b1 : 1'b0;
			else
				square_on2 = 1'b0;
			if(DrawX >= 68 && DrawX < 77 && DrawY >= 418 && DrawY < 431)
				square_on1 = (count <= 2) ? 1'b1 : 1'b0;
			else 
				square_on1 = 1'b0;
		end
	assign count_enable = aaa & ~aaa_delayed; //positive edge trigger for bullet removal
	 always_ff @ (posedge vga_clk)
	 begin: Draw_bullets
		 if(Reset == 1'b1)
				count <= 2'b00;
		 if(MouseButtons == 8'b00000010)
				aaa <= 1'b1;
		 else 
				aaa <= 1'b0;
		 aaa_delayed <= aaa;
		 if(count_enable == 1'b1 && count < 2'b11) 
			count <= count + 2'b01;
		 else 
			count <= count;
	 end

	//drawing hierarchy
    always_ff @ (posedge vga_clk)
    begin:RGB_Display2
		if(blank) //added blank signal
		begin
			if(shot_on)
			begin
				if(DrawX >= BallX - 5'd25 && DrawX < BallX + 5'd26 && DrawY >= BallY - 5'd25 && DrawY < BallY + 5'd26)
				begin
					Red <= 4'hF;
					Green <= 4'hF;
					Blue <= 4'hF;
				end
				else 
				begin
					Red <= 4'h0;
					Green <= 4'h0;
					Blue <= 4'h0;
				end
			end
			else 
			begin
				if ((ball_on == 1'b1)) 
				begin 
					Red <= 4'hF; 		//color changed to white to more closely match color of game cursor...original orange color commented out.
					Green <= 4'hF/*55*/;
					Blue <= 4'hF/*00*/;
				end
				else
				begin
					if ((dog_on == 1'b1)) 
					begin 
						Red <= dog_palette_red;
						Green <= dog_palette_green;
						Blue <= dog_palette_blue;
					end  		  
					else //draw bg
					begin
						if((duck_on ==1'b1))
						begin
							case(Duck_color)
								2'b00: begin
									Red <= ducks_black_palette_red;
									Green <= ducks_black_palette_green;
									Blue <= ducks_black_palette_blue;
								end
								2'b01: begin
									Red <= ducks_red_palette_red;
									Green <= ducks_red_palette_green;
									Blue <= ducks_red_palette_blue;
								end
								2'b10: begin
									Red <= ducks_pink_palette_red;
									Green <= ducks_pink_palette_green;
									Blue <= ducks_pink_palette_blue;
								end
							endcase
						end
						else
						begin
							if(square_on1 == 1'b1 || square_on2 == 1'b1 || square_on3 == 1'b1)
							begin
								Red <= 4'hA;
								Green <= 4'hA;
								Blue <= 4'hA;
							end
							else 
							begin
								Red <= /*4'hB*/bg_palette_red;
								Green <= /*4'hB*/ bg_palette_green;
								Blue <= /*4'hB*/ bg_palette_blue;
							end 
						end
					end
				end
			end
		end
		else //blanking
		begin
			Red <= 4'h0;
        	Green <= 4'h0;
        	Blue <= 4'h0;
		end
			
    end 

	bgs0_rom bgs0_rom (
	.clock   (vga_clk),
	.address (bg_rom_address),
	.q       (bg_rom_q)
	);

	bgs0_palette bgs0_palette (
	.index (bg_rom_q),
	.red   (bg_palette_red),
	.green (bg_palette_green),
	.blue  (bg_palette_blue)
	);

logic negedge_vga_clk;
assign negedge_vga_clk = ~vga_clk;

	AssetsDogs_rom AssetsDogs_rom (
		.clock   (negedge_vga_clk),
		.frame   (Frame),
		.address (dog_rom_address),	
		.q       (dog_rom_q),
		.DogSizeX,
		.DogSizeY
		
	);

	AssetsDogs_palette AssetsDogs_palette (
		.index (dog_rom_q),
		.red   (dog_palette_red),
		.green (dog_palette_green),
		.blue  (dog_palette_blue)
	);

	AssetsDucks_rom AssetsDucks_rom (
		.clock   (negedge_vga_clk),
		.address (ducks_rom_address),
		.q       (ducks_rom_q)
	);


	AssetsDucks_black_palette AssetsDucks_palette1 (
		.index (ducks_rom_q),
		.red   (ducks_black_palette_red),
		.green (ducks_black_palette_green),
		.blue  (ducks_black_palette_blue)
	);

	AssetsDucks_red_palette AssetsDucks_palette2 (
		.index (ducks_rom_q),
		.red   (ducks_red_palette_red),
		.green (ducks_red_palette_green),
		.blue  (ducks_red_palette_blue)
	);

	AssetsDucks_pink_palette AssetsDucks_palette3 (
		.index (ducks_rom_q),
		.red   (ducks_pink_palette_red),
		.green (ducks_pink_palette_green),
		.blue  (ducks_pink_palette_blue)
	);

    
endmodule
