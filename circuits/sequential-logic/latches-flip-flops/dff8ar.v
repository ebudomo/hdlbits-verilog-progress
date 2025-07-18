module dff8ar(
	input clk,
	input areset,
	input [7:0] d,
	output reg [7:0] q
);
	// 8 DFFs with active high asynchronous reset
	always @(posedge clk or posedge areset) begin
		if (areset)
			q <= 8'b0;
		else
			q <= d;
	end
	
endmodule
