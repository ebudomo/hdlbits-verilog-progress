module kmap4(
	input a,
	input b,
	input c,
	input d,
	output out
);
	// a 4 variable kmap with a checkerboard pattern
	// since the top-left corner is 0, this is an XOR
	// rather than XNOR
	assign out = a ^ b ^ c ^ d;
	
endmodule
