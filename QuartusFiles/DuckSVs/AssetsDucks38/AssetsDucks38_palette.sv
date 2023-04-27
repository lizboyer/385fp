module AssetsDucks38_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'h0, 4'h1},
	{4'hF, 4'hF, 4'hF},//2, should be 3
	{4'h0, 4'h0, 4'h0},//3, should be 2
	{4'hF, 4'h7, 4'h6},//4
	{4'h0, 4'h5, 4'h0},//5
	{4'h0, 4'h5, 4'h0},//6, should be 5
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA}
};

assign {red, green, blue} = palette[index];

endmodule
