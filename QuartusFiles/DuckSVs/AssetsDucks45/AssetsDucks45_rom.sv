module AssetsDucks45_rom (
	input logic clock,
	input logic [11:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4095] /* synthesis ram_init_file = "./AssetsDucks45/AssetsDucks45.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
