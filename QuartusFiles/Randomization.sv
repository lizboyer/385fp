module Randomization( input logic Clk, 
							 input logic ANIM_Clk, rand_clk1, rand_clk2,
	 output logic [9:0] Dog_rand_X, Dog_rand_X_int,
	 output logic [9:0] Duck_start_rand_X, Duck_start_rand_X_int,
	 output logic [1:0] Duck_color_rand, Duck_color_rand_int,
	 output logic [1:0] Duck_direction_rand, Duck_direction_rand_int,
	 output logic [1:0] Num_repeats_rand, Num_repeats_rand_int
);
							 
							 
logic [9:0] count = 10'd0;

always_ff @ (posedge Clk)
begin
	count <= count + 1'b1;
end

always_ff @ (posedge rand_clk1)
begin
	Dog_rand_X <= {2'b00, count[7:0]} + 10'd50; //randomize 10 bit X of dog/duck, setting lower bound as 50, and upper bound as 561 (essentially doing count % 256 + 50)
	Duck_direction_rand <= count[1:0]; //NW, W, NE, E
	Num_repeats_rand <= count[1:0]; //map to 2 higher than count says. Aka, if 0, then repeat 2 times, if 1 repeat 3 times, etc. 
	Duck_color_rand_int <= Duck_color_rand;
	Duck_start_rand_X_int <= Duck_start_rand_X;
	
end
always_ff @ (posedge rand_clk2)
begin
	Duck_color_rand <= count[1:0]; //randomize 2 bit color/direction values by doing (color % 4)
	Duck_start_rand_X <= {2'b00, count[7:0]} + 10'd50;
	Duck_direction_rand_int <= Duck_direction_rand;
	Num_repeats_rand_int <= Num_repeats_rand;
	Dog_rand_X_int <= Dog_rand_X;
end


			
endmodule 