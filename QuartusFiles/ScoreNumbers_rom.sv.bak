module ScoreNumbers_rom (
	input logic clock,
	input logic [7:0] address,
    input logic [3:0] insert_number,
	output logic [3:0] q
);

logic [3:0] q0 ,q1, q2, q3, q4, q5, q6, q7, q8, q9, q10;

Score0_rom Score0_rom0(.clock, .address, .q(q0));
Score1_rom Score1_rom0(.clock, .address, .q(q1));
Score2_rom Score2_rom0(.clock, .address, .q(q2));
Score3_rom Score3_rom0(.clock, .address, .q(q3));
Score4_rom Score4_rom0(.clock, .address, .q(q4));
Score5_rom Score5_rom0(.clock, .address, .q(q5));
Score6_rom Score6_rom0(.clock, .address, .q(q6));
Score7_rom Score7_rom0(.clock, .address, .q(q7));
Score8_rom Score8_rom0(.clock, .address, .q(q8));
Score9_rom Score9_rom0(.clock, .address, .q(q9));
ScoreBlank_rom ScoreBlank_rom0(.clock, .address, .q(q10));

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
        // 4'd10: q = q10; //blank
        default: q = q0;
    endcase
end

endmodule

module Score0_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Score0/Score0.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module Score1_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Score1/Score1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module Score2_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Score2/Score2.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module Score3_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Score3/Score3.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module Score4_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Score4/Score4.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module Score5_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Score5/Score5.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module Score6_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Score6/Score6.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module Score7_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Score7/Score7.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module Score8_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Score8/Score8.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module Score9_rom (
	input logic clock,
	input logic [7:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:255] /* synthesis ram_init_file = "./Score9/Score9.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule