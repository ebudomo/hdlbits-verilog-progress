module edgedetect(
	input clk,
	input [7:0] in,
	output reg [7:0] pedge
);
	// per-bit positive edge detection
	reg [7:0] in_old = 8'b0; // initialize
	
	// non-blocking assignments used in always blocks
	// sequential: pedge is checked first then in_old is updated
	always @(posedge clk) begin
		pedge <= ~in_old & in;
		in_old <= in;
	end

endmodule
