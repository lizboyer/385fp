module AssetsDogs0_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h6, 4'hA, 4'hF},//0
	{4'h5, 4'h2, 4'h0},//1
	{4'hF, 4'hF, 4'hF},//2
	{4'h9, 4'h4, 4'h0},//3
	{4'h0, 4'h0, 4'h0},//4 
	{4'h6, 4'hA, 4'hF},//5 5-15 NOT USED
	{4'h6, 4'hA, 4'hF},//6
	{4'h6, 4'hA, 4'hF},//7
	{4'h6, 4'hA, 4'hF},//8
	{4'h6, 4'hA, 4'hF},//9
	{4'h6, 4'hA, 4'hF},//10
	{4'h6, 4'hA, 4'hF},//11
	{4'h6, 4'hA, 4'hF},//12
	{4'h6, 4'hA, 4'hF},//13
	{4'h6, 4'hA, 4'hF},//14
	{4'h6, 4'hA, 4'hF}//15
};

assign {red, green, blue} = palette[index];

endmodule
