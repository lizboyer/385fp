module AssetsDucks24_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hA, 4'hE, 4'hA},
	{4'h0, 4'h0, 4'h0},//1, should be 2
	{4'hA, 4'h0, 4'h1},//2, should be 1
	{4'hF, 4'hF, 4'hF},//3
	{4'hF, 4'h7, 4'h6},//4
	{4'h0, 4'h5, 4'h0},//5
	{4'hA, 4'h0, 4'h1},
	{4'hA, 4'h0, 4'h1},
	{4'hA, 4'h0, 4'h1},
	{4'hA, 4'h0, 4'h1},
	{4'hA, 4'h0, 4'h1},
	{4'hA, 4'h0, 4'h1},
	{4'hA, 4'h0, 4'h1},
	{4'hA, 4'h0, 4'h1},
	{4'hA, 4'h0, 4'h1},
	{4'hA, 4'h0, 4'h1}
};

assign {red, green, blue} = palette[index];

endmodule
