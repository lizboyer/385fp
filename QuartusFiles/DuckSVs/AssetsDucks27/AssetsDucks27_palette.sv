module AssetsDucks27_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hA, 4'h0, 4'h1},//0, should be 1
	{4'hA, 4'h0, 4'h1},//1, should be 1
	{4'hF, 4'hF, 4'hF},//2
	{4'h0, 4'h0, 4'h0},//3
	{4'hF, 4'h7, 4'h6},//4
	{4'h0, 4'h5, 4'h0},//5
	{4'h0, 4'h5, 4'h0},//6, should be 5
	{4'hA, 4'hE, 4'hA},//7, should be 0
	{4'hA, 4'h0, 4'h1},//8, should be 1
	{4'hA, 4'h0, 4'h1},//9, should be 1
	{4'hA, 4'h0, 4'h1},//10, should be 1
	{4'hA, 4'h0, 4'h1},//11, should be 1
	{4'hA, 4'h0, 4'h1},//12, should be 1
	{4'hA, 4'h0, 4'h1},//13, should be 1
	{4'hA, 4'h0, 4'h1},//14, should be 1
	{4'hA, 4'h0, 4'h1}//15, should be 1
};

assign {red, green, blue} = palette[index];

endmodule
