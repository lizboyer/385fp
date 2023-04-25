module AssetsDucks30_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hA, 4'hE, 4'hA},//0
	{4'hA, 4'h0, 4'h1},//1
	{4'hF, 4'h7, 4'h6},//2
	{4'hF, 4'hF, 4'hF},//3, should be 2
	{4'h0, 4'h0, 4'h0},//4, should be 3
	{4'hA, 4'hE, 4'hA},//5, should be 0
	{4'hA, 4'hE, 4'hA},//6
	{4'hA, 4'hE, 4'hA},//7
	{4'hA, 4'hE, 4'hA},//8
	{4'hA, 4'hE, 4'hA},//9
	{4'hA, 4'hE, 4'hA},//10
	{4'hA, 4'hE, 4'hA},//11
	{4'hA, 4'hE, 4'hA},//12
	{4'hA, 4'hE, 4'hA},//13
	{4'hA, 4'hE, 4'hA},//14
	{4'hA, 4'hE, 4'hA}//15
};

assign {red, green, blue} = palette[index];

endmodule
