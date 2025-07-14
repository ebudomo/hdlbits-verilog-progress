module alwaysblock2(
	input clk,
	input a,
	input b,
	output wire out_assign,
	output reg out_always_comb,
	output reg out_always_ff
);
	// XOR while practicing different types of assignments
	// continuous, blocking, and non-blocking
	
	// continuous assignment
	assign out_assign = a ^ b;
	
	// procedural blocking assignment in combinational block
	always @(*) 
		out_always_comb = a ^ b;
	
	// procedural non-blocking assignment in combinational block
	always @(posedge clk) 
		out_always_ff <= a ^ b;
		
endmodule
