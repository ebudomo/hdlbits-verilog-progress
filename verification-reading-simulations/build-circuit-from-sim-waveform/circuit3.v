module circuit3 (
	input a,
	input b,
	input c,
	input d,
	output q
);
	// based on given waveform, logic is q = (a | b) & (c | d);
	assign q = (a | b) & (c | d);

endmodule
