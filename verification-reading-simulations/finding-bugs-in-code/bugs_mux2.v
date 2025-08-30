module bugs_mux2 (
	input sel,
	input [7:0] a,
	input [7:0] b,
	output [7:0] out
);
	// the following code does not work: fix it
	// (original code) assign out = (~sel & a) | (sel & b);
	// 1. bitwise operators on 1 bit sel and 8 bit vectors does not work
	// 2. simulation waveform shows a asserted when sel is high
	
	assign out = sel ? a : b;
	
endmodule
