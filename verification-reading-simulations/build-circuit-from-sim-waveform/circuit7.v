module circuit7 (
	input clk,
	input a, 
	output reg q
);
	// sequential circuit where q appears to be set low when a is asserted high
	always @(posedge clk)
        q <= ~a;
	
endmodule
