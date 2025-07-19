module count15(
	input clk,
	input reset,
	output reg [3:0] q
);
	// 4-bit binary counter with synchronous reset
	always @(posedge clk) begin
		if (reset)
			q <= 0;
		else
			q <= q + 1;
	end

endmodule
