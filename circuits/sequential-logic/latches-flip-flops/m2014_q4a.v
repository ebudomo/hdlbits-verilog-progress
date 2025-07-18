module m2014_q4a(
	input d,
	input ena,
	output reg q
);
	// implement a D latch
	// latches are sequential: non-blocking assignment
	always @(*) begin
		if (ena)
			q <= d;
	end
	
endmodule
