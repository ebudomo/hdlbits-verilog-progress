module lfsr5(
	input clk,
	input reset,
	output reg [4:0] q
);
	// 5 bit maximum-length Galois LFSR
	// taps at positions 5 and 3
	reg [4:0] q_next;
	
	// combinational block with sequential blocking assignments
	// first shift q, then manually compute taps
	always @(*) begin
		q_next = q[4:1];
		q_next[4] = q[0]; // q[0] ^ 0 = q[0]
		q_next[2] = q[3] ^ q[0];
	end
	
	always @(posedge clk) begin
		if (reset)
			q <= 5'h1; // first state is 00001
		else
			q <= q_next;
	end

endmodule
