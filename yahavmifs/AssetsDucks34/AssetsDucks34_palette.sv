module AssetsDucks34_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hF, 4'hF, 4'hF},//0, should be 2
	{4'hA, 4'h0, 4'h1},//1
	{4'hA, 4'hE, 4'hA},//2, should be 0
	{4'hF, 4'h7, 4'h6},//3, should be 4
	{4'h0, 4'h0, 4'h0},//4, should be 3
	{4'h0, 4'h5, 4'h0},//5
	{4'hA, 4'hE, 4'hA},//6
	{4'h0, 4'h0, 4'h0},//7, should be 3
	{4'h0, 4'h0, 4'h0},//8, should be 3
	{4'h0, 4'h0, 4'h0},//9, should be 3
	{4'h0, 4'h0, 4'h0},//10, should be 3
	{4'h0, 4'h0, 4'h0},//11, should be 3
	{4'hA, 4'hE, 4'hA},//12
	{4'h0, 4'h0, 4'h0},//13, should be 3
	{4'h0, 4'h0, 4'h0},//14, should be 3
	{4'h0, 4'h0, 4'h0}//15, should be 3
};

assign {red, green, blue} = palette[index];

endmodule
