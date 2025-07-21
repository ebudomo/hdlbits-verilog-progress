module exams_2014_q4b(
	input [3:0] SW,
	input [3:0] KEY,
	output [3:0] LEDR
);
	// 4-bit shift register with submodules containing two 2-1 muxes at DFF input
	// implemented on DE2 board
	wire [3:0] q;
	// cicuit ordered 3 down to 0
	MUXDFF u3(KEY[0], KEY[3], SW[3], KEY[1], KEY[2], q[3]);
	MUXDFF u2(KEY[0], q[3], SW[2], KEY[1], KEY[2], q[2]);
	MUXDFF u1(KEY[0], q[2], SW[1], KEY[1], KEY[2], q[1]);
	MUXDFF u0(KEY[0], q[1], SW[0], KEY[1], KEY[2], q[0]);
   assign LEDR = q;
	
endmodule
	
module MUXDFF(
	input d,
	input ena,
	output reg q
);
	// module copied from m2014_q4b
	always @(*) begin
		if (ena)
			q <= d;
	end
	
endmodule
