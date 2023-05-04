module RoundNumbers_rom (
	input logic clock,
	input logic [7:0] address,
    input logic [3:0] insert_number,
	output logic [3:0] q
);

logic [3:0] q0 ,q1, q2, q3, q4, q5, q6, q7, q8, q9, q10;

Round0_rom Round0_rom0(.clock, .address, .q(q0));
Round1_rom Round1_rom0(.clock, .address, .q(q1));
Round2_rom Round2_rom0(.clock, .address, .q(q2));
Round3_rom Round3_rom0(.clock, .address, .q(q3));
Round4_rom Round4_rom0(.clock, .address, .q(q4));
Round5_rom Round5_rom0(.clock, .address, .q(q5));
Round6_rom Round6_rom0(.clock, .address, .q(q6));
Round7_rom Round7_rom0(.clock, .address, .q(q7));
Round8_rom Round8_rom0(.clock, .address, .q(q8));
Round9_rom Round9_rom0(.clock, .address, .q(q9));
//RoundBlank_rom RoundBlank_rom0(.clock, .address, .q(q10));

always_comb
begin
    case(insert_number)
        4'd0: q = q0;
        4'd1: q = q1;
        4'd2: q = q2;
        4'd3: q = q3;
        4'd4: q = q4;
        4'd5: q = q5;
        4'd6: q = q6;
        4'd7: q = q7;
        4'd8: q = q8;
        4'd9: q = q9;
        4'd10: q = q10; //blank
        default: q = q0;
    endcase
end

endmodule

module Round0_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Round0/Round0.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module Round1_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Round1/Round1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module Round2_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Round2/Round2.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module Round3_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Round3/Round3.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module Round4_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Round4/Round4.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module Round5_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Round5/Round5.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module Round6_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Round6/Round6.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module Round7_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Round7/Round7.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module Round8_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Round8/Round8.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module Round9_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Round9/Round9.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
//
//module RoundBlank_rom (
//	input logic clock,
//	input logic [7:0] address,
//	output logic [3:0] q
//);
//
//logic [3:0] memory [0:255] /* synthesis ram_init_file = "./RoundBlank/RoundBlank.mif" */;
//
//always_ff @ (posedge clock) begin
//	q <= memory[address];
//end
//
//endmodule

