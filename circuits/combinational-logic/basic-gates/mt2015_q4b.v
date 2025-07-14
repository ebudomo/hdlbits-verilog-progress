module mt2015_q4b(
	input x,
	input y,
	output z
);
	// implement a circuit that realizes a given simulation waveform
	// I used the SOP approach
	assign z = (~x & ~y) | (x & y);
	
	/*
	// I realized that this was the same as the logical equality operator
	assign z = (x == y);
	*/
	
	/*
	// solution indicates that this is also an XNOR gate
	assign z = ~(x ^ y);
	*/
	
endmodule
