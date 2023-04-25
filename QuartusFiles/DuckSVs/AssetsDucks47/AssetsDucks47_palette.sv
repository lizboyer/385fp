module AssetsDucks47_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h0, 4'h0, 4'hA},//0, should be 1
	{4'hA, 4'hE, 4'hA},//1, should be 0
	{4'hF, 4'hF, 4'hF},//2, should be 3
	{4'hB, 4'h0, 4'hB},//3, should be 2
	{4'hF, 4'h7, 4'h6},//4
	{4'hA, 4'hE, 4'hA},//5
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA},
	{4'hA, 4'hE, 4'hA}
};

assign {red, green, blue} = palette[index];

endmodule
