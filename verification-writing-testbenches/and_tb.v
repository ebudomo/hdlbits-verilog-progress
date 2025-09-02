module and_tb ();
	reg [1:0] in;
	wire out;

	andgate dut (
		.in (in),
		.out (out)
	);
	
	initial begin
		in[1] = 1'b0;
		in[0] = 1'b0;
		#10
		in[0] = 1'b1;
		#10
		in[1] = 1'b1;
		in[0] = 1'b0;
		#10
		in[1] = 1'b1;
		in[0] = 1'b1;
	end
		

endmodule


// provided and gate module to test
module andgate (
	input [1:0] in,
	output out
);
	assign out = in[1] && in[0];
endmodule
