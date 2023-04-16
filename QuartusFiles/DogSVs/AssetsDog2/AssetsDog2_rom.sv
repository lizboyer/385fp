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
