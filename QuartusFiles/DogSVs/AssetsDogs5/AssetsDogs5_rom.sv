module AssetsDogs5_rom (
	input logic clock,
	input logic [13:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:9459] /* synthesis ram_init_file = "./AssetsDogs5/AssetsDogs5.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
