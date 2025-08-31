module circuit9 (
	input clk,
	input a,
	output reg [3:0] q
);
	// sequential circuit
	// when a is asserted, q = 4, otherwise q is an upcounter to 6
	always @(posedge clk) begin
		if (a)
			q <= 3'd4;
		else if (q == 3'd6)
			q <= 3'd0;
		else
			q <= q + 1'b1;
	end

endmodule
