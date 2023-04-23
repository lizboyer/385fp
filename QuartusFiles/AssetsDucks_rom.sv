module AssetsDucks_rom (
	input logic clock,
	input logic [4:0] frame,
	input logic [13:0] address,
	output logic [3:0] q,
	output logic [6:0] DuckSizeX, DuckSizeY
);
logic [3:0] q0 ,q1, q2, q3;

//flying right
	AssetsDuck0_rom AssetsDucks0_rom0(.clock, .address(address), .q(q0));
	AssetsDucks1_rom AssetsDucks1_rom0(.clock, .address(address), .q(q1));
	AssetsDucks2_rom AssetsDucks2_rom0(.clock, .address(address), .q(q2));
	AssetsDucks3_rom AssetsDucks3_rom0(.clock, .address(address), .q(q3));
	// AssetsDucks4_rom AssetsDucks4_rom0(.clock, .address(address), .q(q4));
	// AssetsDucks5_rom AssetsDucks5_rom0(.clock, .address(address), .q(q5));
	// AssetsDucks6_rom AssetsDucks6_rom0(.clock, .address(address), .q(q6));
	// AssetsDucks7_rom AssetsDucks7_rom0(.clock, .address(address), .q(q7));
	// AssetsDucks8_rom AssetsDucks8_rom0(.clock, .address(address), .q(q8));


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
		// 5'b00100: begin
		// 	q = q4;//sniff1
		// 	DogSizeX = 7'b1101110;
		// 	DogSizeY = 7'b1010110;
		// end
		// 5'b00101: begin
		// 	q = q5;//sniff2
		// 	DogSizeX = 7'b1101110;
		// 	DogSizeY = 7'b1010110;
		// end
		// 5'b00110: begin
		// 	q = q6;//surprised1
		// 	DogSizeX = 7'b1101110;
		// 	DogSizeY = 7'b1100000;
		// end
		// 5'b00111: begin
		// 	q = q7;//jump1
		// 	DogSizeX = 7'b1101110;
		// 	DogSizeY = 7'b1100000;
		// end
		// 5'b01000: begin
		// 	q = q8;//jump2
		// 	DogSizeX = 7'b1101110;
		// 	DogSizeY = 7'b1100000;
		// end
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