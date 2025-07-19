module count1to10(
	input clk,
	input reset,
	output reg [3:0] q
);
	// 1 to 10 counter with synchronous reset
	always @(posedge clk) begin
		if (reset | q == 10)
			q <= 1;
		else
			q <= q+1;
	end
	
endmodule
