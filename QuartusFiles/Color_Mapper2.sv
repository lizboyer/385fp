////-------------------------------------------------------------------------
////    Color_Mapper.sv                                                    --
////    Stephen Kempf                                                      --
////    3-1-06                                                             --
////                                                                       --
////    Modified by David Kesler  07-16-2008                               --
////    Translated by Joe Meng    07-07-2013                               --
////                                                                       --
////    Fall 2014 Distribution                                             --
////                                                                       --
////    For use with ECE 385 Lab 7                                         --
////    University of Illinois ECE Department                              --
////-------------------------------------------------------------------------
//
////nColor is the color of the pixel at that coordinate
//
//module  color_mapper ( input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
//							  input blank, vga_clk, Reset,
//							  input signed [7:0] MouseButtons,
//								output logic [9:0] LEDR,
//                        output logic [3:0]  Red, Green, Blue );
//    
//    logic dog_on, bg_on, ball_on, square_on1, square_on2, square_on3, count_enable, aaa_delayed, aaa;
//	 logic [1:0] count = 2'b00;
//	 logic [3:0] temp;
//	 logic [11:0] value;
//	 logic [17:0] rom_address;
//	 logic [3:0] rom_q;
//	 logic [3:0] palette_red, palette_green, palette_blue;
//	 int DistX, DistY, Size, DistXabs, DistYabs; //variables for cursor
//	 assign DistX = DrawX - BallX;
//    assign DistY = DrawY - BallY;
//	 assign DistXabs = DistX[31] ? -DistX : DistX;
//	 assign DistYabs = DistY[31] ? -DistY : DistY;
//    assign Size = Ball_size;
//	 assign count_enable = aaa & ~aaa_delayed; //positive edge detector for shot counter mechanism
//	 assign rom_address = ((DrawX * 480) / 640) + (((DrawY * 512) / 480) * 480);
//	 
//	 
//	 
//	 //////////////////////////////////////// SHAPE-ON PROCEDURES ////////////////////////////////////////////
//	 
//    always_comb
//    begin:Ball_on_proc
//        if ( DistXabs + DistYabs/*(DistX*DistX) + (DistY*DistY)*/ <= (Size/**Size*/) ) //use parametric equation for diamond (|x| + |y| = size) 
//            ball_on = 1'b1;
//        else 
//            ball_on = 1'b0;
//     end 
//	 always_comb
//	 begin:Shot_Square_on_proc
//			if(DrawX >= 102 && DrawX < 111 && DrawY >= 418 && DrawY < 431)
//				square_on3 = (count == 0) ? 1'b1 : 1'b0;
//			else
//				square_on3 = 1'b0;
//			if(DrawX >= 85 && DrawX < 94 && DrawY >= 418 && DrawY < 431)
//				square_on2 = (count <= 1) ? 1'b1 : 1'b0;
//			else
//				square_on2 = 1'b0;
//			if(DrawX >= 68 && DrawX < 77 && DrawY >= 418 && DrawY < 431)
//				square_on1 = (count <= 2) ? 1'b1 : 1'b0;
//			else 
//				square_on1 = 1'b0;
//	 end
//		
//		
//	/////////////////////////////////////// VGA DISPLAY PROCEDURE ///////////////////////////////////////////
//	
//    always_ff @ (posedge vga_clk)
//    begin:RGB_Display
//		if(blank) //added blank signal
//		begin
//        if ((ball_on == 1'b1))  ////Priority #1: Ball
//        begin 
//            Red <= 4'hf; 				//color changed to white to more closely match color of game cursor...original orange color commented out.
//            Green <= 4'hf/*55*/;
//            Blue <= 4'hf/*00*/;
//        end
// 		  
//        else 
//		  begin
//				if(square_on1 == 1'b1 || square_on2 == 1'b1 || square_on3 == 1'b1) ///Priority #2: Bullet squares (SHOT box)
//				begin
//					Red <= 4'hA;
//					Green <= 4'hA;
//					Blue <= 4'hA;
//				end
//				else //// Last Priority: Background
//				begin
//					Red <= palette_red;
//					Green <= palette_green;
//					Blue <= palette_blue;
//				end
//		  end 
//		end
//		else 
//		begin
//			Red <= 4'h0;
//         Green <= 4'h0;
//         Blue <= 4'h0;
//		end
//			
//    end 
//	 
//	 always_ff @ (posedge vga_clk)
//	 begin: Draw_bullets
//		 LEDR <= count;
//		 if(MouseButtons == 8'b00000010)
//				aaa <= 1'b1;
//		 else 
//				aaa <= 1'b0;
//		 aaa_delayed <= aaa;
//		 if(count_enable == 1'b1 && count < 2'b11) 
//			count <= count + 2'b01;
//		 else 
//		 begin
//			if(Reset == 1'b1)
//				count <= 2'b00;
//			else 
//				count <= count;
//		 end
//	 end
//
//	 bgs0_rom bgs0_rom (
//	.clock   (vga_clk),
//	.address (rom_address),
//	.q       (rom_q)
//	);
//
//	bgs0_palette bgs0_palette (
//	.index (rom_q),
//	.red   (palette_red),
//	.green (palette_green),
//	.blue  (palette_blue)
//	);
//
//
//
//
//endmodule
