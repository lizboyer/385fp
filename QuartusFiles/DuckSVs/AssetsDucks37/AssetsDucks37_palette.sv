module AssetsDucks37_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hA, 4'hE, 4'hA},//0
	{4'hA, 4'h0, 4'h1},//1
	{4'h0, 4'h0, 4'h0},//2, should be 3
	{4'hF, 4'hF, 4'hF},//3, should be 2
	{4'hF, 4'h7, 4'h6},//4

};

assign {red, green, blue} = palette[index];

endmodule
