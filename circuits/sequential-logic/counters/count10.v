module count10(
	input clk,
	input reset,
	output reg [3:0] q
);
	// decade counter with synchronous reset
	always @(posedge clk) begin
		if (reset | q == 9)
			q <= 0;
		else
			q <= q+1;
	end
	
endmodule
