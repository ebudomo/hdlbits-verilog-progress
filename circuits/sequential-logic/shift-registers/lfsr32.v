module lfsr32(
	input clk,
	input reset,
	output reg [31:0] q
);
	// 32-bit Galois LFSR with taps at bit positions 32, 22, 2, and 1
	reg [31:0] q_next;
	// combinational always block
	// shift first, then evaluate taps individually
	always @(*) begin
		q_next = q >> 1;
		q_next[31] =  q[0];
		q_next[21] = q[22] ^ q[0];
		q_next[1] = q[2] ^ q[0];
		q_next[0] = q[1] ^ q[0];
	end
	
	always @(posedge clk) begin
		if (reset)
			q <= 32'h1;
		else
			q <= q_next;
	end

endmodule
