module dff8p(
	input clk,
	input reset,
	input [7:0] d,
	output reg [7:0] q
);
	// create 8 DFFs with active high reset to 0x34
	// triggered on negedge of clk
	always @(negedge clk) begin
		q <= reset ? 8'h34 : d;
	end

endmodule
