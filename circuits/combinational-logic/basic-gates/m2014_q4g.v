module m2014_q4g(
	input in1,
	input in2,
	input in3,
	output out
);
	// implement a XNOR in series with an XOR gate
	wire xnor_12;
	assign xnor_12 = ~(in1 ^ in2);
	assign out = in3 ^ xnor_12;
	
endmodule
