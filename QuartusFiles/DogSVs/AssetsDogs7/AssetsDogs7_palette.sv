module AssetsDogs7_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h9, 4'h4, 4'h0},//0, should be 3
	{4'h6, 4'hA, 4'hF},//1, should be 0
	{4'h0, 4'h0, 4'h0},//2, should be 4
	{4'hF, 4'hF, 4'hF},//3, should be 2
	{4'h5, 4'h2, 4'h0},//4, should be 1
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
