module AssetsDucks_rom (
	input logic clock,
	input logic [5:0] frame,
	input logic [12:0] address,
	output logic [3:0] q,
	output logic [6:0] DuckSizeX, DuckSizeY
);
logic [3:0] q0 ,q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20 ,q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31, q32, q33, q34, q35, q36, q37, q38, q39, q40, q41, q42, q43, q44, q45, q46, q47, q48, q49, q50, q51, q52, q53, q54, q55, q56, q57, q58, q59;

//flying right
	AssetsDucks0_rom AssetsDucks0_rom0(.clock, .address(address), .q(q0));
	AssetsDucks1_rom AssetsDucks1_rom0(.clock, .address(address), .q(q1));
	AssetsDucks2_rom AssetsDucks2_rom0(.clock, .address(address), .q(q2));
	AssetsDucks3_rom AssetsDucks3_rom0(.clock, .address(address), .q(q3));
	AssetsDucks4_rom AssetsDucks4_rom0(.clock, .address(address), .q(q4));
	AssetsDucks5_rom AssetsDucks5_rom0(.clock, .address(address), .q(q5));
	AssetsDucks6_rom AssetsDucks6_rom0(.clock, .address(address), .q(q6));
	AssetsDucks7_rom AssetsDucks7_rom0(.clock, .address(address), .q(q7));
	AssetsDucks8_rom AssetsDucks8_rom0(.clock, .address(address), .q(q8));
	AssetsDucks9_rom AssetsDucks9_rom0(.clock, .address(address), .q(q9));
	AssetsDucks10_rom AssetsDucks10_rom0(.clock, .address(address), .q(q10));
	AssetsDucks11_rom AssetsDucks11_rom0(.clock, .address(address), .q(q11));
	AssetsDucks12_rom AssetsDucks12_rom0(.clock, .address(address), .q(q12));
	AssetsDucks13_rom AssetsDucks13_rom0(.clock, .address(address), .q(q13));
	AssetsDucks14_rom AssetsDucks14_rom0(.clock, .address(address), .q(q14));
	AssetsDucks15_rom AssetsDucks15_rom0(.clock, .address(address), .q(q15));
	AssetsDucks16_rom AssetsDucks16_rom0(.clock, .address(address), .q(q16));
	AssetsDucks17_rom AssetsDucks17_rom0(.clock, .address(address), .q(q17));
	AssetsDucks18_rom AssetsDucks18_rom0(.clock, .address(address), .q(q18));
	AssetsDucks19_rom AssetsDucks19_rom0(.clock, .address(address), .q(q19));
	AssetsDucks20_rom AssetsDucks20_rom0(.clock, .address(address), .q(q20));
	AssetsDucks21_rom AssetsDucks21_rom0(.clock, .address(address), .q(q21));
	AssetsDucks22_rom AssetsDucks22_rom0(.clock, .address(address), .q(q22));
	AssetsDucks23_rom AssetsDucks23_rom0(.clock, .address(address), .q(q23));
	AssetsDucks24_rom AssetsDucks24_rom0(.clock, .address(address), .q(q24));
	AssetsDucks25_rom AssetsDucks25_rom0(.clock, .address(address), .q(q25));
	AssetsDucks26_rom AssetsDucks26_rom0(.clock, .address(address), .q(q26));
	AssetsDucks27_rom AssetsDucks27_rom0(.clock, .address(address), .q(q27));
	AssetsDucks28_rom AssetsDucks28_rom0(.clock, .address(address), .q(q28));
	AssetsDucks29_rom AssetsDucks29_rom0(.clock, .address(address), .q(q29));
	AssetsDucks30_rom AssetsDucks30_rom0(.clock, .address(address), .q(q30));
	AssetsDucks31_rom AssetsDucks31_rom0(.clock, .address(address), .q(q31));
	AssetsDucks32_rom AssetsDucks32_rom0(.clock, .address(address), .q(q32));
	AssetsDucks33_rom AssetsDucks33_rom0(.clock, .address(address), .q(q33));
	AssetsDucks34_rom AssetsDucks34_rom0(.clock, .address(address), .q(q34));
	AssetsDucks35_rom AssetsDucks35_rom0(.clock, .address(address), .q(q35));
	AssetsDucks36_rom AssetsDucks36_rom0(.clock, .address(address), .q(q36));
	AssetsDucks37_rom AssetsDucks37_rom0(.clock, .address(address), .q(q37));
	AssetsDucks38_rom AssetsDucks38_rom0(.clock, .address(address), .q(q38));
	AssetsDucks39_rom AssetsDucks39_rom0(.clock, .address(address), .q(q39));
	AssetsDucks40_rom AssetsDucks40_rom0(.clock, .address(address), .q(q40));
	AssetsDucks41_rom AssetsDucks41_rom0(.clock, .address(address), .q(q41));
	AssetsDucks42_rom AssetsDucks42_rom0(.clock, .address(address), .q(q42));
	AssetsDucks43_rom AssetsDucks43_rom0(.clock, .address(address), .q(q43));
	AssetsDucks44_rom AssetsDucks44_rom0(.clock, .address(address), .q(q44));
	AssetsDucks45_rom AssetsDucks45_rom0(.clock, .address(address), .q(q45));
	AssetsDucks46_rom AssetsDucks46_rom0(.clock, .address(address), .q(q46));
	AssetsDucks47_rom AssetsDucks47_rom0(.clock, .address(address), .q(q47));
	AssetsDucks48_rom AssetsDucks48_rom0(.clock, .address(address), .q(q48));
	AssetsDucks49_rom AssetsDucks49_rom0(.clock, .address(address), .q(q49));
	AssetsDucks50_rom AssetsDucks50_rom0(.clock, .address(address), .q(q50));
	AssetsDucks51_rom AssetsDucks51_rom0(.clock, .address(address), .q(q51));
	AssetsDucks52_rom AssetsDucks52_rom0(.clock, .address(address), .q(q52));
	AssetsDucks53_rom AssetsDucks53_rom0(.clock, .address(address), .q(q53));
	AssetsDucks54_rom AssetsDucks54_rom0(.clock, .address(address), .q(q54));
	AssetsDucks55_rom AssetsDucks55_rom0(.clock, .address(address), .q(q55));
	AssetsDucks56_rom AssetsDucks56_rom0(.clock, .address(address), .q(q56));
	AssetsDucks57_rom AssetsDucks57_rom0(.clock, .address(address), .q(q57));
	AssetsDucks58_rom AssetsDucks58_rom0(.clock, .address(address), .q(q58));
	AssetsDucks59_rom AssetsDucks59_rom0(.clock, .address(address), .q(q59));

always_comb
begin
	case(frame)						//BLACK DUCK RIGHT FACING
		6'b000000: begin
			q = q0;//Ducks1
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b000001:begin
			q = q1;//Ducks2
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b000010:begin
			q = q2;//Ducks3
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b000011: begin
			q = q3;//Ducks4
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b000100: begin
			q = q4;//Ducks5
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b000101:begin
			q = q5;//Ducks6
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b000110:begin
			q = q6;//Ducks7
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b000111: begin
			q = q7;//Ducks8
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b001000:begin
			q = q8;//Ducks9
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end								//BLACK DUCK FALLING
		6'b001001:begin
			q = q9;//Ducks10
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b001010: begin
			q = q10;//Ducks11
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b001011:begin					//BLACK DUCK LEFT FACING
			q = q11;//Ducks12
			DuckSizeX = 7'b1000000;	
			DuckSizeY = 7'b1000000;
		end
		6'b001100:begin
			q = q12;//Ducks13
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b001101: begin
			q = q13;//Ducks14
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b001110: begin
			q = q14;//Ducks15
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b001111: begin
			q = q15;//Ducks16
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b010000:begin
			q = q16;//Ducks17
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b010001:begin
			q = q17;//Ducks18
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b010010: begin
			q = q18;//Ducks19
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b010011: begin
			q = q19;//Ducks20
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b010100: begin						//RED DUCK RIGHT FACING
			q = q20;//Ducks21
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b010101: begin
			q = q21;//Ducks22
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b010110: begin
			q = q22;//Ducks23
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b010111: begin
			q = q23;//Ducks24
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b011000: begin
			q = q24;//Ducks25
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b011001: begin
			q = q25;//Ducks26
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b011010: begin
			q = q26;//Ducks27
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b011011: begin
			q = q27;//Ducks28
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b011100: begin
			q = q28;//Ducks29
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b011101: begin						//RED DUCK FALLING
			q = q29;//Ducks30
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b011110: begin
			q = q30;//Ducks31
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b011111: begin						//RED DUCK LEFT FACING
			q = q31;//Ducks32
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b100000: begin						
			q = q32;//Ducks33
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b100001: begin						
			q = q33;//Ducks34
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b100010: begin						
			q = q34;//Ducks35
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b100011: begin					
			q = q35;//Ducks36
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b100100: begin					
			q = q36;//Ducks37
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b100101: begin					
			q = q37;//Ducks38
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b100110: begin					
			q = q38;//Ducks39
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b100111: begin						
			q = q39;//Ducks40
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b101000: begin					//PINK DUCK RIGHT FACING	
			q = q40;//Ducks41
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b101001: begin						
			q = q41;//Ducks42
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b101010: begin						
			q = q42;//Ducks43
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b101011: begin						
			q = q43;//Ducks44
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b101100: begin					
			q = q44;//Ducks45
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b101101: begin					
			q = q45;//Ducks46
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b101110: begin					
			q = q46;//Ducks47
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b101111: begin					
			q = q47;//Ducks48
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b110000: begin						
			q = q48;//Ducks49
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b110001: begin					//PINK DUCK FALLING	
			q = q49;//Ducks50
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b110010: begin						
			q = q50;//Ducks51
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b110011: begin					//PINK DUCK LEFT FACING
			q = q51;//Ducks52
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b110100: begin						
			q = q52;//Ducks53
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b110101: begin						
			q = q53;//Ducks54
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b110110: begin						
			q = q54;//Ducks55
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		6'b110111: begin					
			q = q55;//Ducks56
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b111000: begin					
			q = q56;//Ducks57
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b111001: begin					
			q = q57;//Ducks58
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b111010: begin					
			q = q58;//Ducks59
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		6'b111011: begin						
			q = q59;//Ducks60
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		default: 
		begin
			q = q0;
			DuckSizeX = 7'b0000000;
			DuckSizeY = 7'b0000000;
		end

	endcase
end
//
//always_ff @ (posedge clock) begin
//	q <= memory[address];
//end
endmodule

module AssetsDucks0_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks0/AssetsDucks0.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks1_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks1/AssetsDucks1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks2_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks2/AssetsDucks2.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks3_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks3/AssetsDucks3.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks4_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks4/AssetsDucks4.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks5_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks5/AssetsDucks5.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks6_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks6/AssetsDucks6.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks7_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks7/AssetsDucks7.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks8_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks8/AssetsDucks8.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks9_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks9/AssetsDucks9.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks10_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks10/AssetsDucks10.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks11_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks11/AssetsDucks11.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks12_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks12/AssetsDucks12.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks13_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks13/AssetsDucks13.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks14_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks14/AssetsDucks14.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks15_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks15/AssetsDucks15.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module AssetsDucks16_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks16/AssetsDucks16.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks17_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks17/AssetsDucks17.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks18_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks18/AssetsDucks18.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks19_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks19/AssetsDucks19.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks20_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks20/AssetsDucks20.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks21_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks21/AssetsDucks21.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks22_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks22/AssetsDucks22.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks23_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks23/AssetsDucks23.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks24_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks24/AssetsDucks24.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks25_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks25/AssetsDucks25.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks26_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks26/AssetsDucks26.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks27_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks27/AssetsDucks27.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks28_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks28/AssetsDucks28.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks29_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks29/AssetsDucks29.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks30_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks30/AssetsDucks30.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks31_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks31/AssetsDucks31.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks32_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks32/AssetsDucks32.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks33_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks33/AssetsDucks33.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks34_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks34/AssetsDucks34.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks35_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks35/AssetsDucks35.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks36_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks36/AssetsDucks36.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks37_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks37/AssetsDucks37.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks38_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks38/AssetsDucks38.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks39_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks39/AssetsDucks39.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks40_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks40/AssetsDucks40.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks41_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks41/AssetsDucks41.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks42_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks42/AssetsDucks42.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks43_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks43/AssetsDucks43.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks44_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks44/AssetsDucks44.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks45_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks45/AssetsDucks45.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks46_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks46/AssetsDucks46.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks47_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks47/AssetsDucks47.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks48_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks48/AssetsDucks48.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks49_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks49/AssetsDucks49.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks50_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks50/AssetsDucks50.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks51_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks51/AssetsDucks51.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks52_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks52/AssetsDucks52.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks53_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks53/AssetsDucks53.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks54_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks54/AssetsDucks54.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks55_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks55/AssetsDucks55.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks56_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks56/AssetsDucks56.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks57_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks57/AssetsDucks57.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks58_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4351] /* synthesis ram_init_file = "./AssetsDucks58/AssetsDucks58.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks59_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks59/AssetsDucks59.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule