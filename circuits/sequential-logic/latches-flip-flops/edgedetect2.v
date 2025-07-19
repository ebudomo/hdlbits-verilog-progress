module edgedetect2(
	input clk,
	input [7:0] in,
	output reg [7:0] anyedge
);
	// per-bit any edge detection
	reg [7:0] in_old = 8'b0;
	
	always @(posedge clk) begin
		anyedge <= in_old ^ in;
		in_old <= in;
	end

endmodule
