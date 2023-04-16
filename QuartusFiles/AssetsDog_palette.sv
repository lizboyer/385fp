module AssetsDog0_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h0, 4'h0, 4'h0},
	{4'h9, 4'h4, 4'h0},
	{4'h6, 4'hA, 4'hF},
	{4'hF, 4'hF, 4'hF},
	{4'h5, 4'h2, 4'h0},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF}
};

assign {red, green, blue} = palette[index];

endmodule

module AssetsDog1_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h5, 4'h2, 4'h0},
	{4'h6, 4'hA, 4'hF},
	{4'h9, 4'h4, 4'h0},
	{4'hF, 4'hF, 4'hF},
	{4'h0, 4'h0, 4'h0},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF}
};

assign {red, green, blue} = palette[index];

endmodule

module AssetsDog2_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h0, 4'h0, 4'h0},
	{4'hF, 4'hF, 4'hF},
	{4'h5, 4'h2, 4'h0},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h9, 4'h4, 4'h0},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF}
};

assign {red, green, blue} = palette[index];

endmodule

module AssetsDog3_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h0, 4'h0, 4'h0},
	{4'hF, 4'hF, 4'hF},
	{4'h5, 4'h2, 4'h0},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h9, 4'h4, 4'h0},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF}
};

assign {red, green, blue} = palette[index];

endmodule

module AssetsDog4_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h9, 4'h4, 4'h0},
	{4'h6, 4'hA, 4'hF},
	{4'h0, 4'h0, 4'h0},
	{4'hF, 4'hF, 4'hF},
	{4'h5, 4'h2, 4'h0},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF}
};

assign {red, green, blue} = palette[index];

endmodule

module AssetsDog5_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h0, 4'h0, 4'h0},
	{4'h6, 4'hA, 4'hF},	// sky blue
	{4'h6, 4'hA, 4'hF},	// sky blue
	{4'h6, 4'hA, 4'hF},	// sky blue
	{4'h5, 4'h2, 4'h0},	// dark brown
	{4'h6, 4'hA, 4'hF},	// sky blue
	{4'hF, 4'hF, 4'hF},
	{4'h6, 4'hA, 4'hF},	// sky blue
	{4'h6, 4'hA, 4'hF},	// sky blue
	{4'h9, 4'h4, 4'h0},	// brown
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF},
	{4'h6, 4'hA, 4'hF}
};

assign {red, green, blue} = palette[index];

endmodule