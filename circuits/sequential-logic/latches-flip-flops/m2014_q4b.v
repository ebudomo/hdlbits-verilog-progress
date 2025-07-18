module m2014_q4b(
	input clk,
	input d,
	input ar,
	output reg q
);
	// DFF with asynchronous reset
	always @(posedge clk or posedge ar) begin
		if (ar)
			q <= 1'b0;
		else
			q <= d;
	end
	
endmodule
