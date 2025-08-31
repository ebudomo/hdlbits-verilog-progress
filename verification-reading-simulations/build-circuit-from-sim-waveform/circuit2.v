module circuit2 (
	input a,
	input b,
	input c,
	input d,
	output q
);
	// based on given waveform, the output x toggles for each input asserted high
	
	reg x;
	always @(*) begin
		x = 1; // output is normally high when nothing is asserted
		// begin sequential check of inputs from a to d, toggling the value of x if input is high
		x = a ? ~x : x;
		x = b ? ~x : x;
		x = c ? ~x : x;
		x = d ? ~x : x;
	end
	
	assign q = x;

endmodule
