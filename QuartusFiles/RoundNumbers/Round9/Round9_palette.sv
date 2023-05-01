module Round9_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h8, 4'hD, 4'h0},
	{4'h0, 4'h0, 4'h0},
	{4'h0, 4'h0, 4'h0},
	{4'h8, 4'hD, 4'h0},
	{4'h8, 4'hD, 4'h0},
	{4'h8, 4'hD, 4'h0},
	{4'h0, 4'h0, 4'h0},
	{4'h0, 4'h0, 4'h0},
	{4'h8, 4'hD, 4'h0},
	{4'h8, 4'hD, 4'h0},
	{4'h0, 4'h0, 4'h0},
	{4'h8, 4'hD, 4'h0},
	{4'h0, 4'h0, 4'h0},
	{4'h0, 4'h0, 4'h0},
	{4'h0, 4'h0, 4'h0},
	{4'h8, 4'hD, 4'h0}
};

assign {red, green, blue} = palette[index];

endmodule
