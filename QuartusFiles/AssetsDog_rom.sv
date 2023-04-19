module AssetsDogs_rom (
	input logic clock,
	input logic [4:0] frame,
	input logic [13:0] address,
	output logic [3:0] q
);

// logic [3:0] memory [0:9459] /* synthesis ram_init_file = "./AssetsDogs0/AssetsDogs0.mif" */;
logic [3:0] q0 ,q1, q2, q3; /* synthesis ram_init_file = "./AssetsDogs0/AssetsDogs0.mif" */;


	AssetsDogs0_rom AssetsDogs0_rom0(.clock, .address(address), .q(q0))
	AssetsDogs1_rom AssetsDogs1_rom0(.clock, .address(address), .q(q1))
	AssetsDogs2_rom AssetsDogs2_rom0(.clock, .address(address), .q(q2))
	AssetsDogs3_rom AssetsDogs3_rom0(.clock, .address(address), .q(q3))


always_comb
begin
	case(frame)
		5'b00000: q = q0;//walk1
		5'b00001: q = q1;//walk2
		5'b00010: q = q2;//walk3
		5'b00011: q = q3;//walk4
		// 5'b00100: q = q4;//sniff1
		// 5'b00101: q = q5;//sniff2
		// 5'b00110: q = q6;//surprised1
		// 5'b00111: q = q7;//jump1
		// 5'b01000: q = q8;//jump2
	endcase
end

always_ff @ (posedge clock) begin
	q <= memory[address];
end
endmodule

module AssetsDogs0_rom (
	input logic clock,
	input logic [13:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:9459] /* synthesis ram_init_file = "./AssetsDogs0/AssetsDogs0.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDogs1_rom (
	input logic clock,
	input logic [13:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:9459] /* synthesis ram_init_file = "./AssetsDogs1/AssetsDogs1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDogs2_rom (
	input logic clock,
	input logic [13:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:9459] /* synthesis ram_init_file = "./AssetsDogs2/AssetsDogs2.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDogs3_rom (
	input logic clock,
	input logic [13:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:9459] /* synthesis ram_init_file = "./AssetsDogs3/AssetsDogs3.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule