module Randomization( input logic Clk, 
							 input logic ANIM_Clk,
	 output logic [9:0] Dog_rand_X,
	 output logic [9:0] Duck_start_rand_X,
	 output logic [1:0] Duck_color_rand,
	 output logic [1:0] Duck_direction_rand
);
							 
							 
logic [9:0] count = 10'd0;

always_ff @ (posedge Clk)
begin
	count <= count + 1'b1;
end

always_ff @ (posedge ANIM_Clk)
begin
	Dog_rand_X <= {2'b00, count[8:0]} + 10'd50; //randomize 10 bit X of dog/duck, setting lower bound as 50, and upper bound as 561 (essentially doing count % 256 + 50)
	Duck_start_rand_X <= {2'b00, count[8:0]} + 10'd50;
	Duck_color_rand <= count[1:0]; //randomize 2 bit color/direction values by doing (color % 4)
	Duck_direction_rand <= count[1:0];
end
			
endmodule 