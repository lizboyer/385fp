module AssetsDucks12_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hA, 4'hE, 4'hA},
	{4'h0, 4'h0, 4'h0},
	{4'hF, 4'hF, 4'hF},
	{4'hF, 4'h7, 4'h6},
	{4'h0, 4'h5, 4'h0},//4
	{4'h0, 4'h0, 4'h0},//5, should be 1
	{4'hA, 4'hE, 4'hA},//6, should be 0
	{4'h0, 4'h5, 4'h0},//7, should be 4
	{4'h0, 4'h5, 4'h0},//8, should be 4
	{4'h0, 4'h5, 4'h0},//9, should be 4
	{4'h0, 4'h5, 4'h0},//10, should be 4
	{4'h0, 4'h5, 4'h0},//11, should be 4
	{4'hA, 4'hE, 4'hA},//12, should be 0
	{4'h0, 4'h5, 4'h0},//13, should be 4
	{4'h0, 4'h5, 4'h0},//14, should be 4
	{4'h0, 4'h5, 4'h0}//15, should be 4
};

assign {red, green, blue} = palette[index];

endmodule
