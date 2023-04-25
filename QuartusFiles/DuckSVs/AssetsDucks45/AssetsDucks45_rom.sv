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