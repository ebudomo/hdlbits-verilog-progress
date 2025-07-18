module dff8r(
	input clk,
	input reset,
	input [7:0] d,
	output [7:0] q
);
	// implement 8 DFFs with active high reset
	genvar i;
	generate
		for (i=0; i<8; i=i+1) begin : dffr_mod_array
			dffr_mod u_dffr_mod(
				.clk(clk),
				.reset(reset),
				.d(d[i]),
				.q(q[i])
			);
		end
	endgenerate

endmodule

module dffr_mod(
	input clk,
	input reset,
	input d,
	output reg q
);
	// single DFF with active high reset
	// use non-blocking assignment
	always @(posedge clk) begin
		q <= reset ? 1'b0 : d;
	end

endmodule
