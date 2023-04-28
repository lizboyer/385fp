module Randomization( input logic Clk, 
							 input logic ANIM_Clk,
							 input Reset, 
	 output logic [9:0] Dog_rand_X,
	 output logic [9:0] Duck_start_rand_X, 
	 output logic [1:0] Duck_color_rand, 
	 output logic [1:0] Duck_direction_rand, 
	 output logic [1:0] Num_repeats_rand, 
	 output logic [9:0] LEDR
);
							 
		

logic [7:0] Q_reg, Q_next;
logic taps;

always_ff @ (posedge ANIM_Clk or posedge Reset)
begin
	if(Reset)
		Q_reg <= 8'd1;
	else 
		Q_reg <= Q_next;
end

assign LEDR[9:0] = Dog_rand_X;
assign taps = ~(Q_reg[7] ^ Q_reg[5] ^ Q_reg[4] ^ Q_reg[3]);
assign Dog_rand_X = {2'b00, Q_reg} + 10'd50;
assign Duck_start_rand_X = {2'b00, Q_reg} + 10'd50;
assign Duck_color_rand = Q_reg[5:4];
assign Duck_direction_rand = Q_reg[3:2];
assign Num_repeats_rand = Q_reg[1:0];
assign Q_next = {Q_reg[6:0], taps};

			
endmodule 