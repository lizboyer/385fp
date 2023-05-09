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
