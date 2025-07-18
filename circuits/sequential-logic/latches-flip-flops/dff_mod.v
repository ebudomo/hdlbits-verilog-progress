module dff_mod(
	input clk,
	input d,
	output reg q
);
	// implement a D flip-flop
	always @(posedge clk) begin
		q <= d;
	end
	
endmodule
