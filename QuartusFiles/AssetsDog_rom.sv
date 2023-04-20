module AssetsDogs_rom (
	input logic clock,
	input logic [4:0] frame,
	input logic [13:0] address,
	output logic [3:0] q
	output logic [5:0] DogSizeX, DogSizeY;
);

// logic [3:0] memory [0:9459] /* synthesis ram_init_file = "./AssetsDogs0/AssetsDogs0.mif" */;
logic [3:0] q0 ,q1, q2, q3, q4, q5; /* synthesis ram_init_file = "./AssetsDogs0/AssetsDogs0.mif" */;


	AssetsDogs0_rom AssetsDogs0_rom0(.clock, .address(address), .q(q0));
	AssetsDogs1_rom AssetsDogs1_rom0(.clock, .address(address), .q(q1));
	AssetsDogs2_rom AssetsDogs2_rom0(.clock, .address(address), .q(q2));
	AssetsDogs3_rom AssetsDogs3_rom0(.clock, .address(address), .q(q3));
	AssetsDogs4_rom AssetsDogs4_rom0(.clock, .address(address), .q(q4));
	AssetsDogs5_rom AssetsDogs5_rom0(.clock, .address(address), .q(q5));


always_comb
begin
	case(frame)
		5'b00000: begin
			q = q0;//walk1
			DogSizeX = 480;
			DogSizeY = 512;
		end
		5'b00001:begin
			q = q1;//walk2
			DogSizeX = 480;
			DogSizeY = 512;
		end
		5'b00010:begin
			q = q2;//walk3
			DogSizeX = 480;
			DogSizeY = 512;
		end
		5'b00011: begin
			q = q3;//walk4
			DogSizeX = 480;
			DogSizeY = 512;
		end
		5'b00100: begin
			q = q4;//sniff1
			DogSizeX = 480;
			DogSizeY = 512;
		end
		5'b00101: begin
			q = q5;//sniff2
			DogSizeX = 480;
			DogSizeY = 512;
		end
		// 5'b00110: q = q6;//surprised1
		// 5'b00111: q = q7;//jump1
		// 5'b01000: q = q8;//jump2
	endcase
end

endmodule

module AssetsDogs0_rom (
	input logic clock,
	input logic [13:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:9459] /* synthesis ram_init_file = "./AssetsDogs0/AssetsDogs0.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDogs1_rom (
	input logic clock,
	input logic [13:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:9459] /* synthesis ram_init_file = "./AssetsDogs1/AssetsDogs1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDogs2_rom (
	input logic clock,
	input logic [13:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:9459] /* synthesis ram_init_file = "./AssetsDogs2/AssetsDogs2.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDogs3_rom (
	input logic clock,
	input logic [13:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:9459] /* synthesis ram_init_file = "./AssetsDogs3/AssetsDogs3.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDogs4_rom (
	input logic clock,
	input logic [13:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:9459] /* synthesis ram_init_file = "./AssetsDogs4/AssetsDogs4.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDogs5_rom (
	input logic clock,
	input logic [13:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:9459] /* synthesis ram_init_file = "./AssetsDogs5/AssetsDogs5.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule