module mt2015_lfsr(
	input [2:0] SW,
	input [1:0] KEY,
	output [2:0] LEDR
);
	// implementing a sequential circuit (diagram on website)
	// to be implemented on DE1-SoC board
	// circuit comprises DFFs, 2-1 muxes, and an XOR gate
	wire d0, d1, d2;
	assign d0 = KEY[1] ? SW[0] : LEDR[2];
	assign d1 = KEY[1] ? SW[1] : LEDR[0];
	assign d2 = KEY[1] ? SW[2] : (LEDR[1] ^ LEDR[2]);
	 
	dff_lfsr dff0(KEY[0], d0, LEDR[0]);
	dff_lfsr dff1(KEY[0], d1, LEDR[1]);
	dff_lfsr dff2(KEY[0], d2, LEDR[2]);
 
endmodule

module dff_lfsr(
	input clk,
	input d,
	output reg q
);
	always @(posedge clk) begin
		q <= d;
	end
endmodule
