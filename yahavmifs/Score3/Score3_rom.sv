module Score3_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Score3/Score3.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
