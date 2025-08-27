module parity(
	input clk,
	input reset,
	input in,
	output reg odd
);
	// counts number of 1 bits to check if input stream has odd parity
	always @(posedge clk) begin 
		if (reset) odd <= 0;
		else if (in) odd <= ~odd;
	end

endmodule
