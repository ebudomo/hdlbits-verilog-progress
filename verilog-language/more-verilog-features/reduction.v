module reduction(
	input [7:0] in,
	output parity
);
	// using unary reduction to perform bitwise operations
	// in this case, using unary XOR to produce parity bit
	assign parity = ^ in[7:0];
	
endmodule
