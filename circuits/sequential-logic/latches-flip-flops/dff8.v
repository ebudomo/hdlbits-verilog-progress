module dff8(
	input clk,
	input [7:0] d,
	output [7:0] q
);
	// create 8 DFFs triggered by posedge clk
	genvar i;
	generate
		for(i=0; i<8; i=i+1) begin : dff_array
			dff_mod u_dff(
				.clk(clk),
				.d(d[i]),
				.q(q[i])
			);
		end
	endgenerate
	
endmodule
