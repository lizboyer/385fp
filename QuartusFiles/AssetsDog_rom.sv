module AssetsDog0_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:2199] /* synthesis ram_init_file = "./AssetsDog0/AssetsDog0.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDog1_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:2192] /* synthesis ram_init_file = "./AssetsDog1/AssetsDog1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module AssetsDog2_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:2119] /* synthesis ram_init_file = "./AssetsDog2/AssetsDog2.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDog3_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:2235] /* synthesis ram_init_file = "./AssetsDog3/AssetsDog3.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDog4_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:2199] /* synthesis ram_init_file = "./AssetsDog4/AssetsDog4.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDog5_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:2119] /* synthesis ram_init_file = "./AssetsDog5/AssetsDog5.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule