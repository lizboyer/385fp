module AssetsDucks_rom (
	input logic clock,
	input logic [4:0] frame,
	input logic [13:0] address,
	output logic [3:0] q,
	output logic [6:0] DuckSizeX, DuckSizeY
);
logic [3:0] q0 ,q1, q2, q3, q4, q5, q6, q7, q8, q9;

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

always_comb
begin
	case(frame)
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
			DuckSizeX = 7'b1000100;
			DuckSizeY = 7'b1000000;
		end
		5'b00101:begin
			q = q5;//Ducks6
			DuckSizeX = 7'b1000100;
			DuckSizeY = 7'b1000000;
		end
		5'b00110:begin
			q = q6;//Ducks7
			DuckSizeX = 7'b1000100;
			DuckSizeY = 7'b1000000;
		end
		5'b00111: begin
			q = q7;//Ducks8
			DuckSizeX = 7'b1000100;
			DuckSizeY = 7'b1000000;
		end
		5'b01000:begin
			q = q8;//Ducks9
			DuckSizeX = 7'b1000000;
			DuckSizeY = 7'b1000000;
		end
		5'b01001:begin
			q = q9;//Ducks10
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