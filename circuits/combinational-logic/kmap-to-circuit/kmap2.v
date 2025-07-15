module kmap2(
	input a,
	input b, 
	input c,
	input d,
	output out
);
	// SOP implementation
	assign out = (~b & ~c) | (~a & ~d) | (~a & b & c) | (a & c & d);
	
	// POS implementation
	assign out = (~a|~b|c) & (~b|c|~d) & (a|b|~c|~d) & (~a|~c|d);
	
endmodule
