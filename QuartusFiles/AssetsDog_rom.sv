module AssetsDogs_rom (
	input logic clock,
	input logic [4:0] frame,
	input logic [13:0] address,
	output logic [3:0] q,
	output logic [6:0] DogSizeX, DogSizeY
);
logic [3:0] q0 ,q1, q2, q3, q4, q5, q6, q7, q8;


	AssetsDogs0_rom AssetsDogs0_rom0(.clock, .address(address), .q(q0));
	AssetsDogs1_rom AssetsDogs1_rom0(.clock, .address(address), .q(q1));
	AssetsDogs2_rom AssetsDogs2_rom0(.clock, .address(address), .q(q2));
	AssetsDogs3_rom AssetsDogs3_rom0(.clock, .address(address), .q(q3));
	AssetsDogs4_rom AssetsDogs4_rom0(.clock, .address(address), .q(q4));
	AssetsDogs5_rom AssetsDogs5_rom0(.clock, .address(address), .q(q5));
	AssetsDogs6_rom AssetsDogs6_rom0(.clock, .address(address), .q(q6));
	AssetsDogs7_rom AssetsDogs7_rom0(.clock, .address(address), .q(q7));
	AssetsDogs8_rom AssetsDogs8_rom0(.clock, .address(address), .q(q8));


always_comb
begin
	case(frame)
		5'b00000: begin
			q = q0;//walk1
			DogSizeX = 7'b1101110;
			DogSizeY = 7'b1010110;
		end
		5'b00001:begin
			q = q1;//walk2
			DogSizeX = 7'b1101110;
			DogSizeY = 7'b1010110;
		end
		5'b00010:begin
			q = q2;//walk3
			DogSizeX = 7'b1101110;
			DogSizeY = 7'b1010110;
		end
		5'b00011: begin
			q = q3;//walk4
			DogSizeX = 7'b1101110;
			DogSizeY = 7'b1010110;
		end
		5'b00100: begin
			q = q4;//sniff1
			DogSizeX = 7'b1101110;
			DogSizeY = 7'b1010110;
		end
		5'b00101: begin
			q = q5;//sniff2
			DogSizeX = 7'b1101110;
			DogSizeY = 7'b1010110;
		end
		5'b00110: begin
			q = q6;//surprised1
			DogSizeX = 7'b1101110;
			DogSizeY = 7'b1100000;
		end
		5'b00111: begin
			q = q7;//jump1
			DogSizeX = 7'b1101110;
			DogSizeY = 7'b1100000;
		end
		5'b01000: begin
			q = q8;//jump2
			DogSizeX = 7'b1101110;
			DogSizeY = 7'b1100000;
		end
		default: 
		begin
			q = q0;
			DogSizeX = 7'b0000000;
			DogSizeY = 7'b0000000;
		end
		
	endcase
end
//
//always_ff @ (posedge clock) begin
//	q <= memory[address];
//end
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

module AssetsDogs6_rom (
	input logic clock,
	input logic [13:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:10559] /* synthesis ram_init_file = "./AssetsDogs6/AssetsDogs6.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDogs7_rom (
	input logic clock,
	input logic [13:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:10559] /* synthesis ram_init_file = "./AssetsDogs7/AssetsDogs7.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module AssetsDogs8_rom (
	input logic clock,
	input logic [13:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:10559] /* synthesis ram_init_file = "./AssetsDogs8/AssetsDogs8.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule