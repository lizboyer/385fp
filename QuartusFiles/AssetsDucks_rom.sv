module AssetsDucks_rom (
	input logic clock,
	input logic [4:0] frame,
	input logic [13:0] address,
	output logic [3:0] q,
	output logic [6:0] DuckSizeX, DuckSizeY
);
logic [3:0] q0 ,q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20 ,q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31, q32, q33, q34, q35, q36, q37, q38, q39;

//flying right
	AssetsDuck0_rom AssetsDucks0_rom0(.clock, .address(address), .q(q0));
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

always_comb
begin
	case(frame)						//BLACK DUCK RIGHT FACING
		5'b00000: begin
			q = q0;//Ducks1
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		5'b00001:begin
			q = q1;//Ducks2
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		5'b00010:begin
			q = q2;//Ducks3
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		5'b00011: begin
			q = q3;//Ducks4
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		5'b00100: begin
			q = q4;//Ducks5
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		5'b00101:begin
			q = q5;//Ducks6
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		5'b00110:begin
			q = q6;//Ducks7
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		5'b00111: begin
			q = q7;//Ducks8
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		5'b01000:begin
			q = q8;//Ducks9
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end								//BLACK DUCK FALLING
		5'b01001:begin
			q = q9;//Ducks10
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		5'b01010: begin
			q = q10;//Ducks11
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		5'b01011:begin					//BLACK DUCK LEFT FACING
			q = q11;//Ducks12
			DuckSizeX = 7'b1000000;	
			DuckSizeY = 7'b1000000;
		end
		5'b01100:begin
			q = q12;//Ducks13
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		5'b01101: begin
			q = q13;//Ducks14
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		5'b01101: begin
			q = q14;//Ducks15
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		5'b01110: begin
			q = q15;//Ducks16
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		5'b01111:begin
			q = q16;//Ducks17
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		5'b10000:begin
			q = q17;//Ducks18
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		5'b10001: begin
			q = q18;//Ducks19
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		5'b10010: begin
			q = q19;//Ducks20
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		5'b10010: begin						//RED DUCK RIGHT FACING
			q = q20;//Ducks21
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		5'b10010: begin
			q = q21;//Ducks22
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		5'b10010: begin
			q = q22;//Ducks23
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		5'b10010: begin
			q = q23;//Ducks24
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		5'b10010: begin
			q = q24;//Ducks25
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		5'b10010: begin
			q = q25;//Ducks26
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		5'b10010: begin
			q = q26;//Ducks27
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		5'b10010: begin
			q = q27;//Ducks28
			DuckSizeX = 7'b1000100; //68
			DuckSizeY = 7'b1000000;
		end
		5'b10010: begin
			q = q28;//Ducks29
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		5'b10010: begin						//RED DUCK FALLING
			q = q29;//Ducks30
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		5'b10010: begin
			q = q30;//Ducks31
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

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks0/AssetsDucks2.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDucks3_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks0/AssetsDucks3.mif" */;

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