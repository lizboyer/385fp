module mainmenu_rom (
	input logic clock,
	input logic [15:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:57343] /* synthesis ram_init_file = "./mainmenu/mainmenu.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
