module AssetsDogs0_example (
	input logic [9:0] DrawX, DrawY,
	input logic vga_clk, blank,
	output logic [3:0] red, green, blue
);

logic [13:0] rom_address;
logic [3:0] rom_q;

logic [3:0] palette_red, palette_green, palette_blue;

assign rom_address = ((DrawX * 110) / 110) + (((DrawY * 86) / 86) * 110);

always_ff @ (posedge vga_clk) begin
	red <= 4'h0;
	green <= 4'h0;
	blue <= 4'h0;

	if (blank) begin
		if(DrawX >= 11 && DrawX <= 121 && DrawY >= 318 && DrawY <= 428) 
		begin
			red <= palette_red;
			green <= palette_green;
			blue <= palette_blue;
		end
	end
end

AssetsDogs_rom AssetsDogs0_rom (
	.clock   (vga_clk),
	.address (rom_address),
	.q       (rom_q),
	.frame(),
	.DogSizeX(), 
	.DogSizeY()
);

AssetsDogs_palette AssetsDogs0_palette (
	.index (rom_q),
	.red   (palette_red),
	.green (palette_green),
	.blue  (palette_blue)
);

endmodule
