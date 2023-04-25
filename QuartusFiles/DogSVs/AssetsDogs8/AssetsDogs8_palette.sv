module AssetsDogs9_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h6, 4'hA, 4'hF},//0
	{4'h5, 4'h2, 4'h0},//1
	{4'h9, 4'h4, 4'h0},//2, should be 3
	{4'h0, 4'h0, 4'h0},//3, should be 4
	{4'h6, 4'hA, 4'hF},//4
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF}
};

assign {red, green, blue} = palette[index];

endmodule
