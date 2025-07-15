module kmap3(
	input a,
	input b,
	input c,
	input d,
	output out
);
	// SOP
	assign out = a | (~b & c);
	
	// POS
	assign out = (a | c) & (a|~b) & (c|~d);
	
endmodule
