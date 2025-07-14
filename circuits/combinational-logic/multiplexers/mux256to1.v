module mux256to1(
	input[255:0] in,
	input [7:0] sel,
	output out
);
	// 1 bit wide 256to1 mux
	// sel can be used as variable index
	assign out = in[sel];

endmodule
