module module_shift(
	input clk,
	input d,
	output q
);
	//implementing a 3 length shift register using D flip-flops
	wire d12, d23;
	
	my_dff dff_1 ( clk, d, d12 );
   my_dff dff_2 ( clk, d12, d23 );
   my_dff dff_3 ( clk, d23, q );
	
endmodule

module my_dff(
	input clk,
	input d,
	output reg q
);
	always @(posedge clk) begin
		q <= d;
	end
endmodule
	