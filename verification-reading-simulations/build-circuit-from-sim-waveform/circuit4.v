module circuit4 (
	input a,
	input b,
	input c,
	input d,
	output q
);
	// looks like waveform only asserts q high when either b or c are high
	assign q = b | c;

endmodule
