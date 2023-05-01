module flyaway_rom (
	input logic clock,
	input logic [12:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:4963] /* synthesis ram_init_file = "./flyaway/flyaway.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
