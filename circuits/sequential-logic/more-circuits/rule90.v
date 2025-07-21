module rule90(
	input clk,
	input load,
	input [511:0] data,
	output reg [511:0] q
);
	// rule 90 on 512-cell array, boundaries are both zero
	// must explicitly concatenate 1'b0 to left neighbour
	// for i=511, right neighbour q[512] is out of bounds: verilog will zero-fill
	always @(posedge clk) begin
		if (load)
			q <= data;
		else
			q <= q[511:1] ^ {q[510:0], 1'b0};
	end

endmodule
