module AssetsDucks6_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h0, 4'h4, 4'h0},//0, should be 4
	{4'hA, 4'hE, 4'hA},//1, should be 0
	{4'h0, 4'h0, 4'h0},//2, should be 1
	{4'hF, 4'hF, 4'hF},//3, should be 2
	{4'hF, 4'h7, 4'h6},//4, should be 3
	{4'h0, 4'h0, 4'h0},//5, should be 1
	{4'hA, 4'hE, 4'hA},//6
	{4'hA, 4'hE, 4'hA},//7
	{4'hA, 4'hE, 4'hA},//8
	{4'hA, 4'hE, 4'hA},//9
	{4'hA, 4'hE, 4'hA},//10
	{4'hA, 4'hE, 4'hA},//11
	{4'hA, 4'hE, 4'hA},//12, should be 0
	{4'hA, 4'hE, 4'hA},//13, should be 0
	{4'hA, 4'hE, 4'hA},//14
	{4'hA, 4'hE, 4'hA}//15
};

assign {red, green, blue} = palette[index];

endmodule