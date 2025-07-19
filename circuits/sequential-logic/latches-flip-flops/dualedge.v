module dualedge(
	input clk,
	input d,
	output q
);
	// implementing a circuit that behaves like a dual-edge triggered flip-flop
	reg p, n;
	
	// use two flip-flops: one records d at posedge, other at negedge
	always @(posedge clk)
		p <= d;
		
	always @(negedge clk)
		n <= d;
	
	// update q depending on clock edge
	assign q = clk ? p : n;

endmodule	
