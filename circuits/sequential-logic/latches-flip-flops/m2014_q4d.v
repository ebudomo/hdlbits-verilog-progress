module m2014_q4d(
	input clk,
	input in,
	output reg out
);
	// DFF with D = in XOR out
	always @(posedge clk) begin
		out <= out ^ in;
	end
	
endmodule
