module m2014_q4f(
	input in1,
	input in2,
	output out
);
	// implement an AND gate with NOT in2
	assign out = in1 & ~in2;
	
endmodule
