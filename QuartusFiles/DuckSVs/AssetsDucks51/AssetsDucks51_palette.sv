module AssetsDucks51_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hA, 4'hE, 4'hA},//0
	{4'h0, 4'h0, 4'hA},//1
	{4'hB, 4'h0, 4'hB},//2
	{4'hF, 4'hF, 4'hF},//3
	{4'hF, 4'h7, 4'h6},//4
	{4'hA, 4'hE, 4'hA},//5
	{4'h0, 4'h0, 4'hA},//6, should be 1
	{4'h0, 4'h0, 4'hA},//7, should be 1
	{4'h0, 4'h0, 4'hA},//8, should be 1
	{4'h0, 4'h0, 4'hA},//9, should be 1
	{4'hA, 4'hE, 4'hA},//10
	{4'hF, 4'hF, 4'hF},//11, should be 3
	{4'hB, 4'h0, 4'hB},//12, should be 2
	{4'hB, 4'h0, 4'hB},//13, should be 2
	{4'hA, 4'hE, 4'hA},//14
	{4'hB, 4'h0, 4'hB}//15, should be 2
};

assign {red, green, blue} = palette[index];

endmodule
