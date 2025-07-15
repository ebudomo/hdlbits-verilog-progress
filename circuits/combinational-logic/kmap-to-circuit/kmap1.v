module kmap1(
	input a,
	input b,
	input c,
	output out
);
	// exercise in translating kmap to circuit
	// in this case both SOP and POS results are the same:
	assign out = a | b | c;

endmodule
