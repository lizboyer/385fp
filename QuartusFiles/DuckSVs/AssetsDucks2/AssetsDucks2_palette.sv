module AssetsDucks2_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h0, 4'h0, 4'h0},//0, should be 1
	{4'hA, 4'hE, 4'hA},//1, should be 0
	{4'hA, 4'hE, 4'hA},//2, should be 0
	{4'hF, 4'h7, 4'h6},//3
	{4'h0, 4'h5, 4'h0},//4
	{4'h0, 4'h0, 4'h0},//5, should be 0
	{4'hA, 4'hE, 4'hA},//6
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA},
	{4'hF, 4'hF, 4'hF},//12, should be 2
	{4'hF, 4'hF, 4'hF},//13, should be 2
	{4'h0, 4'h0, 4'h0},//14, should be 1
	{4'hA, 4'hE, 4'hA}
};

assign {red, green, blue} = palette[index];

endmodule
