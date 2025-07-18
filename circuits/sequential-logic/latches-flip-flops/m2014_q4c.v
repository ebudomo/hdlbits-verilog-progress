module m2014_q4c(
	input clk,
	input d,
	input r,
	output reg q
);
	// DFF with active high synchronous reset
	always @(posedge clk) begin
		if (r)
			q <= 1'b0;
		else
			q <= d;
	end

endmodule
