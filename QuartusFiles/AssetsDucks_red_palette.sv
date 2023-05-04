module AssetsDucks_red_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hA, 4'hE, 4'hA},//0 BACKGROUND
	{4'hA, 4'h0, 4'h1},//1 red
	{4'hF, 4'hF, 4'hF},//2 white
	{4'h0, 4'h0, 4'h0},//3 black
	{4'hF, 4'h7, 4'h6},//4 orange
	{4'h0, 4'h5, 4'h0},//5 green
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