module ece241_2013_q12(
	input clk,
	input enable,
	input S,
	input A, B, C,
	output Z
);
	// implement a 3-input LUT where Q is an 8-bit shift register
	// register shifts left, inserting S into Q[0]
	reg [7:0] Q;
	always @(posedge clk) begin
		if (enable)
		 Q <= {Q[6:0], S};
	 end
	 // 8-to-1 mux
	 assign Z = Q[{A, B, C}];
	 
 endmodule
 