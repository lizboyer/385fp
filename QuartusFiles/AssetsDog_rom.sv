module AssetsDogs0_rom (
	input logic clock,
	input logic [13:0] address0, address1, address2, address3,
	output logic [3:0] q0, q1, q2, q3

	AssetsDogs0_rom AssetsDogs0_rom0(.clock, .address(q0), .q(q0))
	AssetsDogs1_rom AssetsDogs1_rom0(.clock, .address(q1), .q(q1))
	AssetsDogs2_rom AssetsDogs2_rom0(.clock, .address(q2), .q(q2))
	AssetsDogs3_rom AssetsDogs3_rom0(.clock, .address(q3), .q(q3))

);

logic [3:0] memory [0:9459] /* synthesis ram_init_file = "./AssetsDogs0/AssetsDogs0.mif" */;

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