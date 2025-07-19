module countslow(
	input clk,
	input slowena,
	input reset,
	output reg [3:0] q
);
	// decade counter with synchronous reset
	// !slowena pauses the counter
	always @(posedge clk) begin
		if (reset)
			q <= 0;
		else if (slowena & q == 9)
			q <= 0;
		else if (slowena)
			q <= q+1;
	end

endmodule
